// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class CardStatistik extends StatelessWidget {
  const CardStatistik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(60)),
            child: Center(
              child: Image.network(
                  'https://cdn140.picsart.com/297361716279211.png'),
            ),
          ),
        ),
        Text(
          'Username',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class BaseStyle {
  static Color bColor = Colors.green;

  static Color covidColor = Colors.red;

  static Color bgColor = Colors.greenAccent;

  static TextStyle bTextStyle =
      TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle dataTextStyle = TextStyle(
      fontSize: 23, fontWeight: FontWeight.bold, color: Colors.orange);

  static TextStyle isiTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[700]);

  static TextStyle secondTextStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle buttonTextStyle =
      TextStyle(fontSize: 13, color: Colors.white);

  static String tLorem =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
}
