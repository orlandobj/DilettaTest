import '../../../core/imports/imports.dart';
import '../../modules.dart';

class RegistrationDatasource implements RegistrationUsecase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<bool> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({'email': email, 'name': name});
        return true;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }
}
