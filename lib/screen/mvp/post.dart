// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:capstone_flutter/cubit/contact_cubit.dart';
import 'package:capstone_flutter/model/model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../others/template.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  File? file;

  var formKey = GlobalKey<FormState>();
  final _publishTextController = TextEditingController();
  final _captionTextController = TextEditingController();

  String publish = '';
  String caption = '';

  @override
  void dispose() {
    _publishTextController.dispose();
    _captionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(15, 19, 21, 1),
          body: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          file != null
                              ? Image.file(
                                  file!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    height: 200,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text('No Photo',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 2,
                                            color: Colors.white)),
                                  ),
                                )
                        ],
                      ),
                    ),
                    widgetCover(),
                    const SizedBox(
                      height: 15,
                    ),
                    // widgetPublistAt(context),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    widgetCaption(),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 10)),
                      ),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;

                        formKey.currentState!.save();
                        final threadBaru =
                            CThread(caption: caption, publish: publish);

                        context.read<DataCubit>().tambahData(threadBaru);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TemplatePage()));
                      },
                      child: const Text('Make A Thread'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget widgetCover() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cover',
          style: TextStyle(
              fontWeight: FontWeight.bold, height: 2, color: Colors.white),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width / 2,
                  MediaQuery.of(context).size.width / 10)),
            ),
            onPressed: () {
              _pickFile();
            },
            child: const Text('Add Photo'),
          ),
        ),
      ],
    );
  }

  Widget widgetPublistAt(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Publish At',
          style: TextStyle(
              fontWeight: FontWeight.bold, height: 2, color: Colors.white),
        ),
        TextField(
          controller: _publishTextController,
          focusNode: AlwaysDisabledFocusNode(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'dd/mm/yyyy',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
          onChanged: (String value) {
            publish = value;
          },
          onTap: () async {
            final selectDate = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(1990),
              lastDate: DateTime(currentDate.year + 5),
            );
            setState(() {
              if (selectDate != null) {
                _dueDate = selectDate;
                _publishTextController
                  ..text = DateFormat('dd/MM/yyyy').format(_dueDate)
                  ..selection = TextSelection.fromPosition(TextPosition(
                      offset: _publishTextController.text.length,
                      affinity: TextAffinity.upstream));
              }
            });
          },
        ),
      ],
    );
  }

  Widget widgetCaption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Caption',
          style: TextStyle(
              fontWeight: FontWeight.bold, height: 2, color: Colors.white),
        ),
        TextFormField(
          controller: _captionTextController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Add title...',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
          onChanged: (String value) {
            caption = value;
          },
          minLines:
              6, // any number you need (It works as the rows for the textarea)
          keyboardType: TextInputType.multiline,
          maxLines: 6,
        ),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = File(result.files.single.path ?? "");
      });
    }
  }

}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
