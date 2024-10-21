import 'package:diletta_teste/modules/modules.dart';

import '../../../core/imports/imports.dart';

class LoginController {
  final LoginDatasource _loginDatasource = LoginDatasource();

  Future<void> login(String email, String password) async {
    try {
      await _loginDatasource.login(email, password);
    } catch (e) {
      log(e.toString());
    }
  }
}
