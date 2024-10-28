
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_finder_application/ForgetPassword/forget_password_screen.dart';
import 'package:job_finder_application/SignupPage/signup_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';

String loginUrlImage ='https://i.pinimg.com/736x/29/98/53/299853174e2c2e5a3a8954d03147ec6e.jpg';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}



//Use “final” when you have values that should not change after initialization.
final TextEditingController _emailTextController = TextEditingController(text: ' ');
final TextEditingController _passTextController = TextEditingController(text:' ');
//bool _isLoading = false;
bool _obscureText =false;
final FirebaseAuth _auth =FirebaseAuth.instance;
final _loginFormKey = GlobalKey<FormState>();


final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8,
        errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ],
);

// void _submitFormOnLogin() async
// {
//   final  isValid = _loginFormKey.currentState!.validate();
//   if(isValid){
//     setState(() {
//       _isLoading =true;
//     });
//
//
//     try
//     {
//       await  _auth.signInWithEmailAndPassword(
//         email: _emailTextController.text.trim().toLowerCase(),
//         password: _passTextController.text.trim(),
//       );
//       Navigator.canPop(context) ? Navigator.pop(context): null;
//     }catch (error)
//     {
//       setState( (){
//         _isLoading =false;
//       });
//       // GlobalMethord.showErrorDialog(error: error.toString(), ctx: context);
//       print('error occurred $error');
//     }
//   }
//   setState(() {
//     _isLoading= false;
//   });
// }

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

        CachedNetworkImage(
        imageUrl: loginUrlImage,
        placeholder: (context, url)=> Image.asset(
          'assets/images/background.png',
          fit: BoxFit.fill,
        ),

        errorWidget: (context, url,error)=> const Icon(Icons.error),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),


        Container(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80 , right: 80),
                  child: Image.asset('assets/images/login.png'),
                ),

                const SizedBox(height: 15,),


                Form(
                  key: _loginFormKey,
                  child:  Column(
                    children: [

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        //onEditingComplete: () =>  FocusScope.of(context).requestFocus(_passFocusNode),
                        controller: _emailTextController,
                        obscureText: false,

                        validator: (value)
                        {
                          if(value!.isEmpty || !value.contains('@'))
                          {
                            return 'Please enter a valid Email address';
                          }
                          else
                          {
                            return null;
                          }
                        },

                        style: const TextStyle(color: Colors.white),

                        decoration: InputDecoration(
                          labelText: "Email*",labelStyle:TextStyle(fontSize: 25) ,
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),

                        ),

                      ),

                      const SizedBox(height:14),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passTextController,
                        //focusNode: _passFocusNode,
                        //obscureText: true,
                        obscureText: !_obscureText,
                        validator: (value){
                          if(value!.isEmpty || value.length <7){
                            return'Please enter a valid password';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration:  InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: ()
                            {
                              setState((){
                                _obscureText =!_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          labelText: "Password*",labelStyle:TextStyle(fontSize: 25) ,
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),


                          //enabledBorder: const UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white),
                          // ),
                          // focusedBorder: const UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white),
                          // ),
                          // errorBorder:  const UnderlineInputBorder(
                          //   borderSide: BorderSide(color:  Colors.red),
                          // ),

                        ),
                      ),

                      const SizedBox(height:15,),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassword()));
                          },
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height:10,),

                      MaterialButton(
                        onPressed:(){},  //_submitFormOnLogin,
                        color: Colors.cyan,
                        elevation:  8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height:40,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text('Do not have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),

                                   TextButton(
                                     onPressed: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                                     },
                                     child: Text("Sign up!",
                                       style: TextStyle(
                                       color: Colors.cyan,
                                       ),
                                     ),
                                   )
                            ],
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
