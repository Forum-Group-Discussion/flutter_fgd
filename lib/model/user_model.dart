// ignore_for_file: non_constant_identifier_names

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
