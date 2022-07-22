// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class UserModel {
  late String user_name;
  late String email;
  late String password;

  UserModel(this.user_name, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_name': user_name,
      'email': email,
      'password': password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
  }
}

class CThread {
  String caption;

  CThread({
    required this.caption,
  });

  Map<String, dynamic> toJson() => {'caption': caption};

  CThread.fromjson(Map<String, dynamic> json) : caption = json['caption'];

  static Map<String, dynamic> toMap(CThread cThread) => {
        'caption': cThread.caption,
      };

  static String encode(List<CThread> cThread) => json.encode(
        cThread
            .map<Map<String, dynamic>>((cThread) => CThread.toMap(cThread))
            .toList(),
      );

  static List<CThread> decode(String cThread) =>
      (json.decode(cThread) as List<dynamic>)
          .map<CThread>((item) => CThread.fromjson(item))
          .toList();
}
