// import 'package:dio/dio.dart';
// import 'dart:convert' as convert;

// import '../model.dart';

// class UserRepo {
//   Dio().get("http://34.125.26.208/v1/auth/register").then((response));

//   Future<UserModel> postData(UserModel gcontact) async {
//     try {
//       final apiURL = await Dio().post(
//         'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
//         data: convert.json.encode(
//           UserModel.toJson(UserModel(
//               user_name: gcontact.user_name,
//               email: gcontact.email,
//               password: gcontact.p)),
//         ),
//       );
//       final dataC = UserModel.fromJson(apiURL.data);
//       print(apiURL.data);
//       return dataC;
//     } on DioError catch (e) {
//       throw Exception(e);
//     }
//   }
// }