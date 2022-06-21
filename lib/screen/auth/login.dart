// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_escapes, prefer_final_fields, unnecessary_new, prefer_typing_uninitialized_variables, avoid_print

import 'package:capstone_flutter/screen/auth/regist.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../comm/comHelper.dart';
import '../../databaseHandler/dbHelper.dart';
import '../../environments.dart';
import '../../model/model.dart';
import '../others/template.dart';
import '../others/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String email = _conEmail.text;
    String passwd = _conPassword.text;

    if (_formKey.currentState!.validate() || email.isEmpty) {
    } else if (_formKey.currentState!.validate() || passwd.isEmpty) {
    } else {
      setState(() {
        _isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isUser', true);

      await dbHelper.getLoginUser(email, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => TemplatePage()),
                (Route<dynamic> route) => false);
          });
          alertDialog(context, "Berhasil Masuk");
        } else {
          alertDialog(context, "Error: Akun Tidak Di Temukan");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Gagal Masuk");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Color.fromRGBO(15, 19, 21, 1),
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WelcomePage()));
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
                                fontSize: 18,
                                color: Colors.grey.withOpacity(0.8))),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukkan Kata Sandi';
                              }
                              if (!validateEmail(value)) {
                                return 'Kata Sandi Tidak Valid';
                              }
                              return null;
                            },
                            obscureText: true,
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
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: login,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                            minimumSize:
                                MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/2, MediaQuery.of(context).size.width/10)),
                          ),
                          child: Text(
                            'Sign In',
                            style: BaseStyle.buttonTextStyle,
                          ),
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
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
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
