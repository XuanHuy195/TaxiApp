import 'dart:async';
import 'package:TaxiApp/src/validators/validation.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String user, String pass) {
    if (!Validations.isValidUser(user)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("Info Valid");
    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }
    _passController.sink.add("Info Valid");
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
