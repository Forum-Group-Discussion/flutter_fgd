// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:capstone_flutter/screen/mvp/post.dart';
import 'package:capstone_flutter/screen/others/notif.dart';
import 'package:capstone_flutter/screen/others/profil.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
    PostPage(),
    NewsPage(),
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
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotifPage()));
          }, icon: Icon(Icons.notifications_none))
        ],
      ),
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          /// Beranda
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            unselectedColor: Colors.white,
            selectedColor: Colors.purple,
          ),

          /// Peringkat
          SalomonBottomBarItem(
            icon: Icon(Icons.whatshot_sharp),
            title: Text("Trending"),
            unselectedColor: Colors.white,
            selectedColor: Colors.red,
          ),

          /// Post
          SalomonBottomBarItem(
            icon: Icon(Icons.add_circle_outlined),
            title: Text("Post"),
            unselectedColor: Colors.white,
            selectedColor: Colors.blue,
          ),

          /// Notif
          SalomonBottomBarItem(
            icon: Icon(Icons.turned_in_sharp),
            title: Text("Saved"),
            unselectedColor: Colors.white,
            selectedColor: Colors.orange,
          ),

          /// Profil
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            unselectedColor: Colors.white,
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
