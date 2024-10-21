import 'package:diletta_teste/core/auth/user_manager.dart';

import '../imports/imports.dart';

class DependencyInjection {
  static void initialize() {
    final GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    UserManager.registerUser();
  }
}
