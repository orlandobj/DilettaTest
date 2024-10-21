

import 'package:diletta_teste/modules/modules.dart';

import '../../../../core/imports/imports.dart';

class LoginDatasource implements LoginUsecase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _getIt = GetIt.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserEntity userEntity = _getIt<UserEntity>();
      if (_auth.currentUser != null) {
        String uid = _auth.currentUser!.uid;

        try {
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(uid).get();

          if (userDoc.exists) {
            UserEntity mappedUser = UserMapper.toEntity(userDoc);
            userEntity.email = mappedUser.email;
            userEntity.name = mappedUser.name;
            userEntity.id = mappedUser.id;
          } else {
            log("Usuário não encontrado no Firestore");
          }
        } catch (e) {
          log("Erro ao buscar o usuário no Firestore: $e");
        }
      } else {
        log("Nenhum usuário logado");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
