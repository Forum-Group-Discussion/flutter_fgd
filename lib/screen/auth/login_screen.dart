// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_escapes, prefer_final_fields, unnecessary_new, prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously, unused_import

import 'package:capstone_flutter/screen/auth/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../comm/comHelper.dart';
import '../../environments.dart';
import '../../model/model.dart';
import '../../model/model_user.dart';
import '../../utils/finite_state.dart';
import '../others/template.dart';
import '../others/welcome.dart';
import '../view_model/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    final provideruser = Provider.of<LoginProvider>(context, listen: false);
    provideruser.addListener(() {
      if (provideruser.myState == MyState.success) {
        var snackBar = SnackBar(content: Text("Login Success"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TemplatePage(),
            ));
      } else if (provideruser.myState == MyState.failed) {
        var snackBar = SnackBar(content: Text("Login Failed"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: Colors.white,
              )),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Sign In',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.white)),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Stack(children: [
            Positioned(
              top: 20,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lets you sign in',
                    style: BaseStyle.bTextStyle,
                  ),
                  Text('Welcome back, there is a lot discuss',
                      style: TextStyle(
                          fontSize: 18, color: Colors.grey.withOpacity(0.8))),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      controller: _conEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Email';
                        }
                        if (!validateEmail(value)) {
                          return 'Email Tidak Valid';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      controller: _conPassword,
                      obscureText: _isObscure,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30)),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        String email = _conEmail.text;
                        String passwd = _conPassword.text;

                        if (_formKey.currentState!.validate()) {
                          await Provider.of<LoginProvider>(context,
                                  listen: false)
                              .login(email, passwd);
                        }
                      } catch (e) {
                        var snackBar = SnackBar(content: Text("Login Failed"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.width / 10)),
                    ),
                    child:
                        Consumer<LoginProvider>(builder: (context, model, _) {
                      if (model.myState == MyState.loading) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          'Sign In',
                          style: BaseStyle.buttonTextStyle,
                        );
                      }
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont Have An Account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
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
                                return FadeTransition(
                                  opacity: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
