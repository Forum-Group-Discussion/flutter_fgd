// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:capstone_flutter/main.dart';
import 'package:capstone_flutter/screen/auth/login.dart';
import 'package:capstone_flutter/screen/others/about.dart';
import 'package:capstone_flutter/screen/others/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../environments.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      _conUserName.text = sp.getString("user_name")!.toUpperCase();
      _conEmail.text = sp.getString("email")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 550,
                width: 350,
                child: Stack(
                  children: [
                    Card(
                      color: Color.fromRGBO(22, 28, 34, 1),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/bgijoo.png")),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  readOnly: true,
                                  textAlign: TextAlign.center,
                                  controller: _conUserName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange),
                                    minimumSize: MaterialStateProperty.all(
                                        Size(200, 40)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return AboutPage();
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          final tween =
                                              Tween(begin: 0.0, end: 1.0);
                                          return ScaleTransition(
                                            scale: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Tentang',
                                    style: BaseStyle.buttonTextStyle,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange),
                                    minimumSize: MaterialStateProperty.all(
                                        Size(200, 40)),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Pengaturan',
                                    style: BaseStyle.buttonTextStyle,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange),
                                    minimumSize: MaterialStateProperty.all(
                                        Size(200, 40)),
                                  ),
                                  onPressed: _logOut,
                                  child: Text(
                                    'Keluar',
                                    style: BaseStyle.buttonTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 270,
                      left: 25,
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        readOnly: true,
                        textAlign: TextAlign.center,
                        controller: _conEmail,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 125,
                      child: ProfilePicture(
                        name: _conUserName.text,
                        radius: 50,
                        fontsize: 40,
                        random: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isUser');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => MyApp()));
  }
}
