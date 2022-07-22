// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:capstone_flutter/environments.dart';
import 'package:flutter/material.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({Key? key}) : super(key: key);

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  bool descTextShowFlag = false;
  bool follow = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(15, 19, 21, 1),
          actions: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  barrierColor: Color.fromARGB(49, 245, 245, 245),
                  backgroundColor: Color.fromRGBO(15, 19, 21, 1),
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Wrap(
                        children: [
                          Center(
                            child: Icon(
                              Icons.linear_scale,
                              color: Colors.white,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.share, color: Colors.white),
                            title: Text(
                              'Share Account',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.report, color: Colors.white),
                            title: Text(
                              'Report Account',
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MzWildan Tampan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "mzwildan@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "www.wildan.com",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "|    Saya Pecinta Kucing",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                      Hero(
                        tag: "pp",
                        child: Center(
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  "https://play-lh.googleusercontent.com/AmKSpZt_rynhOO0ID1eS0gqeW3DFzoH6KNZkAAgepQ0t9MDRQTmil-nlY5GqkZ_7El0")),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            follow = !follow;
                          });
                        },
                        child: follow
                            ? Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    'Unfollow',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            : Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )),
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Post',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '999',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Follower',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '999',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            Tab(text: 'Thread'),
                            Tab(text: 'Activity'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: TabBarView(
                          children: <Widget>[
                            ThreadCard(
                              like: '99',
                              uName: 'MzWildan Tampan',
                              urlImage:
                                  'https://preview.redd.it/qhpzm00wcbi81.png?auto=webp&s=36f3650bb9c5077ca18c7532794c6e1e51935cde',
                              caption:
                                  'Apakah Marin-chan adalah waifu terbaik?',
                              comment: '69',
                              icon: Icon(
                                Icons.turned_in_rounded,
                                color: Colors.orange,
                              ),
                            ),
                            //Page 2
                            Container(
                              child: Center(
                                  child: Text(
                                "No Activity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                    color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
