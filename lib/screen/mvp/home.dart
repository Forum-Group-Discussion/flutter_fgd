// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, unused_import, prefer_final_fields

import 'dart:io';

import 'package:capstone_flutter/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../environments.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(15, 19, 21, 1),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CardStatistik(),
                        CardStatistik(),
                        CardStatistik(),
                        CardStatistik(),
                        CardStatistik(),
                        CardStatistik(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(5),
                        separatorBuilder: (context, index) => Divider(
                              thickness: 1,
                            ),
                        itemCount: state.listThread.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Card(
                                  color: Color.fromRGBO(22, 28, 34, 1),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Muhammad Wildannil Haq",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  state.listThread[index]
                                                      .publish,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                state.listThread[index].caption,
                                                maxLines:
                                                    descTextShowFlag ? 10 : 2,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    height: 2,
                                                    color: Colors.white),
                                              ),
                                              InkWell(
                                                highlightColor: Colors.transparent,
                                                splashFactory: NoSplash.splashFactory,
                                                onTap: () {
                                                  setState(() {
                                                    descTextShowFlag =
                                                        !descTextShowFlag;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    descTextShowFlag
                                                        ? Text(
                                                            "Show Less",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          )
                                                        : Text("Show More",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image.network(
                                            "https://dafunda.com/wp-content/uploads/2018/01/Dari-mana-Violet-Evergarden-dari-Dafunda-Community-800x513.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 5, 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.favorite,
                                                    color: Colors.pink,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.comment_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.share,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
