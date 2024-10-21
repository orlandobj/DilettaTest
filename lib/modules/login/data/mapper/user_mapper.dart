import 'package:diletta_teste/modules/modules.dart';

import '../../../../core/imports/imports.dart';

class UserMapper {
  static UserEntity toEntity(DocumentSnapshot<Object?> userDoc) {
    return UserEntity(
        id: userDoc.id, email: userDoc['email'], name: userDoc['name']);
  }
}
