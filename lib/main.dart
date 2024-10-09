import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 final Future<FirebaseApp>_initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
        builder: (context, snapshot)
        //snapshot contain our data
        {
          if ( snapshot.connectionState == ConnectionState.waiting )
          {
            return  MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text("Welcome to our Application...",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            );
          }

          else if (snapshot.hasError)
            {
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text("An Error has occurred",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              );
            }

          return MaterialApp(
            debugShowCheckedModeBanner : false,
            title: "Job Finder Application",
            theme:ThemeData(
              scaffoldBackgroundColor: Colors.black87,
              primarySwatch:  Colors.deepPurple,
            ),
            home: Scaffold(
              body: Center(
                child: Text("hello",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),

            ),
          );
          }
    );
  }
}

