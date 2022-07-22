// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_new, prefer_typing_uninitialized_variables, avoid_print, unused_import, unused_local_variable, use_build_context_synchronously

import 'package:capstone_flutter/model/model_user.dart';
import 'package:capstone_flutter/screen/auth/login_screen.dart';
import 'package:capstone_flutter/screen/view_model/register_provider.dart';
import 'package:capstone_flutter/screen/view_model/login_provider.dart';
import 'package:capstone_flutter/utils/finite_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../comm/comHelper.dart';
import '../../environments.dart';
import '../../model/model.dart';
import '../others/welcome.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();

  bool _isObscure = true;

  @override
  void initState() {
    final provideruser = Provider.of<RegisterProvider>(context, listen: false);
    provideruser.addListener(() {
      if (provideruser.myState == MyState.success) {
        var snackBar = SnackBar(content: Text("Register Success"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } else if (provideruser.myState == MyState.failed) {
        var snackBar = SnackBar(content: Text("Register Failed"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provideruser = Provider.of<RegisterProvider>(context, listen: false);

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
            title: Text('Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17)),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Positioned(
              top: 20,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: BaseStyle.bTextStyle,
                  ),
                  Text('Create new account',
                      style: TextStyle(
                          fontSize: 18, color: Colors.grey.withOpacity(0.8))),
                ],
              ),
            ),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        controller: _conUserName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan Nama Pengguna';
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
                          labelText: 'Username',
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
                        keyboardType: TextInputType.emailAddress,
                        controller: _conEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan Email';
                          }
                          if (!validateEmail(value)) {
                            return 'Masukkan Email Dengan Benar';
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
                          return null;
                        },
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
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        controller: _conCPassword,
                        validator: (value) {
                          String passwd = _conPassword.text;
                          String cpasswd = _conCPassword.text;

                          if (value == null || value.isEmpty) {
                            return 'Masukkan Kata Sandi Kembali';
                          }
                          if (passwd != cpasswd) {
                            return 'Kata Sandi Tidak Sesuai';
                          }
                          return null;
                        },
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
                            labelText: 'Confirm Password',
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
                          String uname = _conUserName.text;
                          String email = _conEmail.text;
                          String passwd = _conPassword.text;
                          String cpasswd = _conCPassword.text;

                          if (_formKey.currentState!.validate()) {
                            if (passwd != cpasswd) {
                              alertDialog(context, 'Kata Sandi Tidak Sesuai');
                            } else {
                              await provideruser.register(
                                RegisterRequestModel(
                                  email: email,
                                  name: uname,
                                  password: passwd,
                                ),
                              );
                            }
                          }
                        } catch (e) {
                          var snackBar =
                              SnackBar(content: Text("Register Failed"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 10)),
                      ),
                      child: Consumer<RegisterProvider>(
                          builder: (context, model, _) {
                        if (model.myState == MyState.loading) {
                          return CircularProgressIndicator();
                        } else {
                          return Text(
                            'Sign Up',
                            style: BaseStyle.buttonTextStyle,
                          );
                        }
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have An Account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
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
                                  return FadeTransition(
                                    opacity: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: const Text('Sign In'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
