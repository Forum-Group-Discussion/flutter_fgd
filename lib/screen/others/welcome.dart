// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:capstone_flutter/screen/auth/login.dart';
import 'package:capstone_flutter/screen/auth/regist.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Stack(children: [
            Positioned(
              right: 10,
              child: Image.asset(
                "images/mascot.png",
                height: 500,
                width: 500,
                fit: BoxFit.none,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome to Found',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                ),
                Text(
                  'Enjoy with your discussion',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red, primary: Colors.white),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return LoginPage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 1.0);
                              return ScaleTransition(
                                scale: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                          width: 80,
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                          )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 2),
                          primary: Colors.white),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return RegistPage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 1.0);
                              return ScaleTransition(
                                scale: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                          width: 80,
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 80)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
