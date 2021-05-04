import 'package:digitours/api/api.dart';
import 'package:digitours/utils/color_error_util.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  bool _postingMobileLogin = false;
  bool get postingMobileLogin => _postingMobileLogin;

  set postingMobileLogin(bool val) {
    _postingMobileLogin = val;
    notifyListeners();
  }

  Future mobileLogin(String phoneNumber) {
    return api.mobilelogin(phoneNumber).then((response) {
      var payload = response.data;
      print(payload);
    }).catchError((error) {
      printError('Error occured while confirming login phone number $error');
    });
  }
}

AuthService authservice = AuthService();