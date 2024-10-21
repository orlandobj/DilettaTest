import 'package:diletta_teste/modules/modules.dart';

import '../imports/imports.dart';

class UserManager {
  static void registerUser() {
    final GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<UserEntity>(
        () => UserEntity(id: '', name: '', email: ''));
  }
}
