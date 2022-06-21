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
  String publish;

  CThread({
    required this.caption,
    required this.publish
  });

  Map<String, dynamic> toJson() => {
    'caption' : caption,  'publish' : publish
  };

  CThread.fromjson(Map<String, dynamic> json)  
  : caption = json['caption'], publish = json['photo'];

  static Map<String, dynamic> toMap(CThread cThread) => {
    'caption' : cThread.caption,
    'publish' : cThread.publish
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

// @JsonSerializable()
// class AuthModel {
//   String email;
//   String name;
//   String password;

//   AuthModel({required this.email, required this.name, required this.password});

//   factory AuthModel.fromJson(Map<String, dynamic> json) =>
//       _$AuthModelFromJson(json);

//   Map<String, dynamic> toJson() => _$AuthModelToJson(this);
// }