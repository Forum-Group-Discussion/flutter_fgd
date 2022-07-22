// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardStatistik extends StatelessWidget {
  const CardStatistik({
    Key? key,
    required this.title,
    required this.urlimage,
  }) : super(key: key);
  final String title;
  final String urlimage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child:
              CircleAvatar(radius: 35, backgroundImage: NetworkImage(urlimage)),
        ),
        Text(
          title,
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

class ThreadCard extends StatelessWidget {
  const ThreadCard({
    Key? key,
    required this.caption,
    required this.uName,
    required this.urlImage,
    required this.like,
    required this.comment,
    required this.icon,
  }) : super(key: key);
  final String caption;
  final String uName;
  final String urlImage;
  final String like;
  final String comment;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Card(
              color: Color.fromRGBO(22, 28, 34, 1),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "https://play-lh.googleusercontent.com/AmKSpZt_rynhOO0ID1eS0gqeW3DFzoH6KNZkAAgepQ0t9MDRQTmil-nlY5GqkZ_7El0")),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  uName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "3 days ago",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Color.fromARGB(49, 245, 245, 245),
                              backgroundColor: Color.fromRGBO(15, 19, 21, 1),
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: (context) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Wrap(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.linear_scale,
                                          color: Colors.white,
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.share,
                                            color: Colors.white),
                                        title: Text(
                                          'Share Thread',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.report,
                                            color: Colors.white),
                                        title: Text(
                                          'Report Thread',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            caption,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 2,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("Show More",
                                  style: TextStyle(color: Colors.blue))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        urlImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                      child: Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined,
                              color: Colors.white),
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(like,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.comment_rounded,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(comment,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          icon
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({required this.title, this.value = false});
}
