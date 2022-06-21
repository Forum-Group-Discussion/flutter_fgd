// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        appBar: AppBar(
          title: Text('Tentang Komunitas'),
           backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 550,
                width: 350,
                child: Card(
                  color: Color.fromRGBO(22, 28, 34, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '   COIN-19 adalah aplikasi yang menginformasikan seputar Covid-19 di Indonesia berupa statistika, data terkini, dan informasi lainnya.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '   Pada saat ini Covid-19 masih menyebar dan masih memakan banyak korban. Banyak yang sudah mulai terlena akan pentingnya mengikuti protokol kesehatan. Salah satu alasan orang-orang sudah mulai terlena itu dikarenakan ketidaksadarannya mereka dengan Covid-19 yang nampaknya mulai tidak ada. Karena itu dibutuhkan suatu aplikasi sebagai pengingat agar masyarakat dapat selalu tahu dengan kondisi Covid-19 saat ini.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '   COIN-19 berupakan suatu aplikasi yang dibutuhkan masyarakat untuk dapat selalu tahu statistika dan berita terkini seputar Covid-19. COIN-19 dapat memberikan data terkini berupa total kasus yang ada di Indonesia dan juga total kasus di masing-masing Provinsinya. COIN-19 dapat memberikan berita terkini seputar Covid-19.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
