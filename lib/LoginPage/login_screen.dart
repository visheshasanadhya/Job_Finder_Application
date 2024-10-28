

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

String loginUrlImage ='https://i.pinimg.com/736x/29/98/53/299853174e2c2e5a3a8954d03147ec6e.jpg';

//Use “final” when you have values that should not change after initialization.
final TextEditingController _emailTextController = TextEditingController(text: ' ');
final TextEditingController _passTextController = TextEditingController(text:' ');
//bool _isLoading = false;
bool _obscureText =true;

final _loginFormKey = GlobalKey<FormState>();


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
                        //onEditingComplete: () =>  FocusScope.of(context).requestFocus(_passFocusNode),
                        keyboardType: TextInputType.emailAddress,
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
                        decoration: const InputDecoration(
                          hintText:  "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color:  Colors.red),
                          ),
                        ),
                      ),

                      const SizedBox(height:5,),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        //focusNode: _passFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passTextController,
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
                          hintText:  "Password",
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder:  const UnderlineInputBorder(
                            borderSide: BorderSide(color:  Colors.red),
                          ),
                        ),

                      ),
                      const SizedBox(height:15,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassword()));
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
                        onPressed: (){},   // _submitFormOnLogin,
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
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'Do not have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,

                                  )
                              ),
                              const TextSpan(text: '     '),
                              TextSpan(
                                //recognizer:  TapGestureRecognizer()
                                 // ..onTap =() => Navigator.push(context, MaterialPageRoute(builder: (context)  => SignUp())),
                                text:  'Signup',
                                style: const TextStyle(
                                  color: Colors.cyan,
                                  fontWeight:  FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
