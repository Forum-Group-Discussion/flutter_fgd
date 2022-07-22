// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'dart:io';

import 'package:capstone_flutter/screen/others/about.dart';
import 'package:capstone_flutter/screen/others/template.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../view_model/profile_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  File? image;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<ProfileProvider>(context, listen: false);

      await viewModel
          .getUserId()
          .then((value) => _nameController.text = viewModel.userData.name!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProfileProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        appBar: AppBar(
          title: Text('Edit Profile'),
          backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: _imageFile == null
                          ? NetworkImage(
                                  'https://www.greeners.co/wp-content/uploads/2021/03/Kucing-Domestik-1.jpg')
                              as ImageProvider
                          : FileImage(File(_imageFile!.path)),
                    ),
                    Positioned(
                        top: 55,
                        left: 55,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Color.fromARGB(49, 245, 245, 245),
                              backgroundColor: Color.fromRGBO(15, 19, 21, 1),
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            controller: _nameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            enabled: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'Bio',
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            enabled: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30)),
                              labelText: 'Website',
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      data.updateUser(_nameController.text).then(
                            (_) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TemplatePage(),
                              ),
                            ),
                          );
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(22, 28, 34, 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return AboutPage();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  final tween = Tween(begin: 0.0, end: 1.0);
                                  return ScaleTransition(
                                    scale: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Comunity',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Share Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(22, 28, 34, 1),
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Privacy',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Comunity',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Restricted Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Blocked Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('token');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 28, 34, 1),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: Text('Logout')),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Wrap(
      children: [
        Center(
          child: Icon(
            Icons.linear_scale,
            color: Colors.white,
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              'Choose Profile Photo',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromRGBO(15, 19, 21, 1),
                ),
                FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Gallery',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromRGBO(15, 19, 21, 1),
                )
              ],
            )
          ]),
        ),
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
