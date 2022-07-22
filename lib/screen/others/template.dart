// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:capstone_flutter/screen/mvp/post.dart';
import 'package:capstone_flutter/screen/others/notif.dart';
import 'package:capstone_flutter/screen/others/profil.dart';
import 'package:capstone_flutter/screen/others/saved.dart';
import 'package:flutter/material.dart';

import '../mvp/trend.dart';
import '../mvp/home.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  var _currentIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DetailPage(),
    PostPage(),
    SavedPage(),
    ProfilPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset(
            "images/namefound.png",
            height: 100,
            width: 100,
          ),
          backgroundColor: Color.fromRGBO(15, 19, 21, 1),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotifPage()));
                },
                icon: Icon(Icons.notifications_none))
          ],
        ),
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(15, 19, 21, 1),
                icon: Icon(Icons.home),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.whatshot_sharp), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.turned_in_sharp), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
