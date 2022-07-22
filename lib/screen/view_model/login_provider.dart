// ignore_for_file: unused_import

import 'package:capstone_flutter/model/api/auth_api.dart';
import 'package:capstone_flutter/model/model_user.dart';
import 'package:capstone_flutter/utils/constant/preference_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../environments.dart';
import '../../utils/finite_state.dart';

class LoginProvider with ChangeNotifier {
  UserRepo userapi = UserRepo();
  SharedPreferences? preference;

  MyState myState = MyState.initial;

  Future login(String email, String password) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      preference = await SharedPreferences.getInstance();
      final model = await userapi.postlogin(email, password);
      preference!.setString(PreferenceKey.token, model.token!);
      preference!.setInt(PreferenceKey.idt, model.id!);

      myState = MyState.success;

      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
