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
          title: Text('About Comunity'),
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
                          '   Found adalah sebuah platform dimana semua orang bisa mengeluarkan opini dan pendapat mereka tentang berbagai hal seperti pendidikan, teknologi, dan lainnya yang mana nantinya akan di diskusikan dengan orang lain.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '   Platform ini terinspirasi dari Kaskus, Twitter, dan Instagram yang mana salah satu fitur utamanya adalah Post a Thread, yaitu mengunggah sesuatu seperti foto ataupun tulisan yang nantinya dapat di diskusikan bersama para pengguna lainnya. Para pengguna juga bisa menyimpan Thread orang lain agar tidak ketinggalan dengan bahasan yang sedang mereka diskusikan.',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '   Diharapkan dengan platform ini dapat membantu para pengguna untuk mengungkapkan pendapat mereka agar dapat didiskusikan bersama dengan baik. Dan apabila terdapat Thread yang tidak pantas, pihak admin akan memberikan peringatan terhadap orang yang membuatnya. Karena itu platform ini aman dan nyaman untuk digunakan.',
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
