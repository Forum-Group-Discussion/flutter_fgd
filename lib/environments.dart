// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class CardStatistik extends StatelessWidget {
  CardStatistik({Key? key, required this.tema}) : super(key: key);
  String tema;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      width: 100,
      child: InkWell(
        onTap: () {},
        child: Card(
          // color: Color.fromRGBO(22, 28, 34, 1),
          color: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(tema,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
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
