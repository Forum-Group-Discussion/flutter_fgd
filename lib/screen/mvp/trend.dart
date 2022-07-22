// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:capstone_flutter/environments.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = TextEditingController();
  bool value = false;

  final theme = [
    CheckBoxState(title: 'Edication'),
    CheckBoxState(title: 'Games'),
    CheckBoxState(title: 'Medical'),
    CheckBoxState(title: 'Sport'),
    CheckBoxState(title: 'Politics'),
    CheckBoxState(title: 'Technology'),
    CheckBoxState(title: 'Travel'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      InkWell(
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.linear_scale,
                                        color: Color.fromARGB(255, 42, 37, 37),
                                      ),
                                    ),
                                    Text(
                                      'Search Filters',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    ...theme.map(singleCheckBox).toList()
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_list_alt,
                                color: Colors.white,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ThreadCard(
                        caption: "Rapat DPRRI membahas tentang sesuatu",
                        uName: "Sugianto",
                        urlImage:
                            "https://publiksatu.co/file/2018/05/Rapat-Paripurna-Anggota-DPR-RI-Sepi.jpg",
                        like: "666",
                        comment: "666",
                        icon: Icon(
                          Icons.turned_in_not_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ThreadCard(
                        caption: "Anggota DPRRI turu saat rapat?",
                        uName: "Rabunsel",
                        urlImage:
                            "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1570008689/i3rmcmyevdnlsssdesrk.jpg",
                        like: "634",
                        comment: "134",
                        icon: Icon(
                          Icons.turned_in_not_rounded,
                          color: Colors.white,
                        ),
                      ),
                      ThreadCard(
                        caption: "Siapakah jagoanmu pada pilpres 2024 nanti",
                        uName: "Sugiono",
                        urlImage:
                            "https://kliksajasultra.co/wp-content/uploads/2022/06/Prediksi-4-Pasnagan-Capres-2024-768x432-1.jpg",
                        like: "480",
                        comment: "634",
                        icon: Icon(
                          Icons.turned_in_not_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  CheckboxListTile singleCheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.orange,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: TextStyle(color: Colors.white),
        ),
        onChanged: (value) => setState(() => checkbox.value = value!));
  }
}
