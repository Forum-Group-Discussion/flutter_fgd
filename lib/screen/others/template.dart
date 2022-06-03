// ignore_for_file: prefer_const_constructors

import 'package:capstone_flutter/screen/others/profile.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../environments.dart';
import '../mvp/detail.dart';
import '../mvp/home.dart';
import '../news/news.dart';

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
    NewsPage(),
    ProfilePage()
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
        title: Image.asset(
          "images/namefound.png",
          height: 100,
          width: 100,
        ),
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
      ),
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          /// Beranda
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Beranda"),
            unselectedColor: Colors.white,
            selectedColor: Colors.purple,
          ),

          /// Peringkat
          SalomonBottomBarItem(
            icon: Icon(Icons.star),
            title: Text("Peringkat"),
            unselectedColor: Colors.white,
            selectedColor: Colors.orange,
          ),

          /// Notif
          SalomonBottomBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Notifikasi"),
            unselectedColor: Colors.white,
            selectedColor: Colors.pink,
          ),

          /// Profil
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profil"),
            unselectedColor: Colors.white,
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
