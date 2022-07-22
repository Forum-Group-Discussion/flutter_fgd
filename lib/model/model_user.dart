// ignore_for_file: camel_case_types, prefer_collection_literals, unnecessary_new, unnecessary_this, unused_import

import 'dart:convert';

class RegisterRequestModel {
  String? email;
  String? name;
  String? password;

  RegisterRequestModel({this.email, this.name, this.password});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}

class LoginModel {
  String? token;
  int? id;
  bool? isAdmin;
  String? name;
  bool? isSupended;

  LoginModel({this.token, this.id, this.isAdmin, this.name, this.isSupended});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    isAdmin = json['isAdmin'];
    name = json['name'];
    isSupended = json['isSupended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['isAdmin'] = this.isAdmin;
    data['name'] = this.name;
    data['isSupended'] = this.isSupended;
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? urlImage;
  bool? isAdmin;
  bool? isSuspended;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.urlImage,
      this.isAdmin,
      this.isSuspended});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    urlImage = json['url_image'];
    isAdmin = json['is_admin'];
    isSuspended = json['is_suspended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['url_image'] = this.urlImage;
    data['is_admin'] = this.isAdmin;
    data['is_suspended'] = this.isSuspended;
    return data;
  }
}
