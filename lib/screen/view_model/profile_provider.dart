import 'package:capstone_flutter/model/api/auth_api.dart';
import 'package:capstone_flutter/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/finite_state.dart';

class ProfileProvider with ChangeNotifier {
  UserRepo userapi = UserRepo();
  MyState myState = MyState.initial;
  UserModel _userData = UserModel();
  UserModel get userData => _userData;

  Future getUserId() async {
    try {
      myState = MyState.loading;
      final SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString('token');
      int? id = sp.getInt('idt');
      notifyListeners();

      final dataUser = await userapi.getUserById(id!, token!);
      _userData = dataUser;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future updateUser(String nama) async {
    try {
      myState = MyState.loading;
      final SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString('token');
      int? id = sp.getInt('idt');
      notifyListeners();

      await userapi.updateUser(nama, token!, id!);

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
