import 'package:capstone_flutter/model/api/auth_api.dart';
import 'package:capstone_flutter/model/model_user.dart';
import 'package:flutter/material.dart';

import '../../model/model_register.dart';
import '../../utils/finite_state.dart';

class RegisterProvider with ChangeNotifier {
  UserRepo userapi = UserRepo();
  MyState myState = MyState.initial;
  RegisterModel? registerModel;

  Future register(RegisterRequestModel request) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      final RegisterModel response = await userapi.register(request);
      registerModel = response;

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
