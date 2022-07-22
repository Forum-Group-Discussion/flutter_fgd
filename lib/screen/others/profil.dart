// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, unnecessary_null_comparison, use_build_context_synchronously, unnecessary_cast, sized_box_for_whitespace

import 'package:capstone_flutter/cubit/capt_cubit.dart';
import 'package:capstone_flutter/screen/others/comment.dart';
import 'package:capstone_flutter/screen/others/setting.dart';
import 'package:capstone_flutter/screen/view_model/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool descTextShowFlag = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<ProfileProvider>(context, listen: false);

      await viewModel.getUserId();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProfileProvider>(context);

    return SafeArea(
      child: BlocBuilder<DataCubit, DataState>(
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(15, 19, 21, 1),
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
                                data.userData.name ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                data.userData.email ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Center(
                            child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    "https://www.greeners.co/wp-content/uploads/2021/03/Kucing-Domestik-1.jpg")),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage()));
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
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
                              '666',
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
                              '666',
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
                                Expanded(
                                  child: ListView.separated(
                                      padding: EdgeInsets.all(5),
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            thickness: 1,
                                          ),
                                      itemCount: state.listThread.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.1,
                                              child: Card(
                                                color: Color.fromRGBO(
                                                    22, 28, 34, 1),
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                  radius: 20,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          "https://www.greeners.co/wp-content/uploads/2021/03/Kucing-Domestik-1.jpg")),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    data.userData
                                                                            .name ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    "Update second ago",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              showModalBottomSheet(
                                                                barrierColor:
                                                                    Color.fromARGB(
                                                                        49,
                                                                        245,
                                                                        245,
                                                                        245),
                                                                backgroundColor:
                                                                    Color
                                                                        .fromRGBO(
                                                                            15,
                                                                            19,
                                                                            21,
                                                                            1),
                                                                context:
                                                                    context,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.vertical(
                                                                            top:
                                                                                Radius.circular(20))),
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child: Wrap(
                                                                      children: [
                                                                        Center(
                                                                          child:
                                                                              Icon(
                                                                            Icons.linear_scale,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        ListTile(
                                                                          leading: Icon(
                                                                              Icons.share,
                                                                              color: Colors.white),
                                                                          title:
                                                                              Text(
                                                                            'Share Thread',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                        ),
                                                                        ListTile(
                                                                          leading: Icon(
                                                                              Icons.report,
                                                                              color: Colors.white),
                                                                          title:
                                                                              Text(
                                                                            'Report Thread',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                              state
                                                                  .listThread[
                                                                      index]
                                                                  .caption,
                                                              maxLines:
                                                                  descTextShowFlag
                                                                      ? 10
                                                                      : 2,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  height: 2,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            InkWell(
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              splashFactory:
                                                                  NoSplash
                                                                      .splashFactory,
                                                              onTap: () {
                                                                setState(() {
                                                                  descTextShowFlag =
                                                                      !descTextShowFlag;
                                                                });
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: <
                                                                    Widget>[
                                                                  descTextShowFlag
                                                                      ? Text(
                                                                          "Show Less",
                                                                          style:
                                                                              TextStyle(color: Colors.blue),
                                                                        )
                                                                      : Text(
                                                                          "Show More",
                                                                          style:
                                                                              TextStyle(color: Colors.blue))
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
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Image.network(
                                                          "https://images2.alphacoders.com/121/1213770.jpg",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 10, 5, 5),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .thumb_up_alt_outlined,
                                                              color:
                                                                  Colors.orange,
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              child: Center(
                                                                child: Text("1",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                  barrierColor:
                                                                      Color.fromARGB(
                                                                          49,
                                                                          245,
                                                                          245,
                                                                          245),
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          15,
                                                                          19,
                                                                          21,
                                                                          1),
                                                                  context:
                                                                      context,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.vertical(
                                                                              top: Radius.circular(20))),
                                                                  builder:
                                                                      (context) {
                                                                    return Column(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .linear_scale,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                CommentPage()),
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          child:
                                                                              TextFormField(
                                                                            decoration:
                                                                                InputDecoration(
                                                                              border: OutlineInputBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                                                                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                                                                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                                                                              prefixIcon: Padding(
                                                                                padding: const EdgeInsets.all(5.0),
                                                                                child: Container(
                                                                                  height: 18,
                                                                                  width: 18,
                                                                                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(50)),
                                                                                ),
                                                                              ),
                                                                              suffixIcon: Icon(Icons.send, color: Colors.grey),
                                                                              hintText: "Comment...",
                                                                              hintStyle: TextStyle(color: Colors.grey),
                                                                              fillColor: Colors.white,
                                                                              filled: true,
                                                                            ),
                                                                            style:
                                                                                TextStyle(color: Colors.black),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .comment_rounded,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                              child: Center(
                                                                child: Text("5",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .turned_in_not_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
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
                                ),
                                //Page 2
                                Container(
                                    child: Center(
                                  child: Text(
                                    'No Activity',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
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
          );
        },
      ),
    );
  }
}
