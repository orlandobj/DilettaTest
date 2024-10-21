import 'package:diletta_teste/modules/modules.dart';

import '../../../core/imports/imports.dart';

class RegistrationController {
  final RegistrationDatasource _registrationDatasource =
      RegistrationDatasource();

  Future<bool> register(String email, String password, name) async {
    bool success = false;
    try {
      success = await _registrationDatasource.register(
          email: email, password: password, name: name);
    } catch (e) {
      log(e.toString());
    }
    return success;
  }
}
