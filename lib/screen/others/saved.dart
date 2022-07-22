// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import '../../environments.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        body: ListView(
          children: [
            ThreadCard(
              like: '99',
              uName: 'MzWildan Tampan',
              urlImage:
                  'https://preview.redd.it/qhpzm00wcbi81.png?auto=webp&s=36f3650bb9c5077ca18c7532794c6e1e51935cde',
              caption: 'Apakah Marin-chan adalah waifu terbaik?',
              comment: '69',
              icon: Icon(
                Icons.turned_in_rounded,
                color: Colors.orange,
              ),
            ),
            Divider(),
            ThreadCard(
              like: '0',
              uName: 'Febrianto Nich',
              urlImage:
                  'https://thumb.viva.co.id/media/frontend/thumbs3/2018/11/30/5c00bce7cd125-jennie-blackpink_1265_711.jpg',
              caption: 'Apakah Jennie BlackPink adalah cowok?',
              comment: '99',
              icon: Icon(
                Icons.turned_in_rounded,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
