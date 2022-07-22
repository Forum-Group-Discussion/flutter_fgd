// ignore_for_file: unused_import, avoid_print

import 'package:capstone_flutter/model/model_register.dart';
import 'package:capstone_flutter/model/model_user.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class UserRepo {
  var dio = Dio();

  UserRepo() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://44.206.244.111/v1',
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );

    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<RegisterModel> register(RegisterRequestModel gcontact) async {
    try {
      final FormData request = FormData.fromMap(
        {
          'json': """{
            "name": "${gcontact.name}",
            "email": "${gcontact.email}",
            "password": "${gcontact.password}",
            "is_admin": false
          }""",
        },
      );
      Response respon = await dio.post(
        '/auth/register/',
        options: Options(
          contentType: 'multipart/form-data',
        ),
        data: request,
      );
      return RegisterModel.fromJson(respon.data);
    } on DioError {
      rethrow;
    }
  }

  Future<LoginModel> postlogin(String email, String password) async {
    try {
      Response respon = await dio.post(
        '/auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      return LoginModel.fromJson(respon.data['data']);
    } on DioError {
      rethrow;
    }
  }

  Future<UserModel> getUserById(int id, String token) async {
    try {
      dio.options.headers["Authorization"] = 'Bearer $token';
      Response respon = await dio.get('/user/$id');
      var user = respon.data['data'];
      return UserModel.fromJson(user);
    } on DioError {
      rethrow;
    }
  }

  Future<Response> updateUser(String nama, String token, int id) async {
    try {
      dio.options.headers["Authorization"] = 'Bearer $token';
      final response = await dio.put(
        '/user/update/$id',
        data: {"name": nama},
      );
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
