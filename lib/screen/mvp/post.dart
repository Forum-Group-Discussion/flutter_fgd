// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'dart:io';
import 'package:capstone_flutter/cubit/capt_cubit.dart';
import 'package:capstone_flutter/model/model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../others/template.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File? file;

  var formKey = GlobalKey<FormState>();
  final _captionTextController = TextEditingController();
  final _titleTextController = TextEditingController();

  String publish = '';
  String caption = '';

  @override
  void dispose() {
    _captionTextController.dispose();
    _titleTextController.dispose();
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Topic',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 2,
                              color: Colors.white),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ChooseT(
                                nTopic: "Games",
                              ),
                              ChooseT(
                                nTopic: "Education",
                              ),
                              ChooseT(
                                nTopic: "Food",
                              ),
                              ChooseT(
                                nTopic: "Travel",
                              ),
                              ChooseT(
                                nTopic: "Healthy",
                              ),
                              ChooseT(
                                nTopic: "Etc",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
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
                                  child: Container(),
                                )
                        ],
                      ),
                    ),
                    widgetCover(),
                    const SizedBox(
                      height: 15,
                    ),
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
                        final threadBaru = CThread(caption: caption);

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
          'Add Image',
          style: TextStyle(
              fontWeight: FontWeight.bold, height: 2, color: Colors.white),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width / 0.5,
                  MediaQuery.of(context).size.width / 10.0)),
            ),
            onPressed: () {
              _pickFile();
            },
            child: const Text('Choose Image'),
          ),
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
            hintText: 'Start a new message',
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
          minLines: 6,
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

class ChooseT extends StatelessWidget {
  ChooseT({Key? key, required this.nTopic}) : super(key: key);

  String nTopic;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: SizedBox(
          width: 100,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.width / 10.0)),
            ),
            onPressed: () {},
            child: Text(
              nTopic,
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
