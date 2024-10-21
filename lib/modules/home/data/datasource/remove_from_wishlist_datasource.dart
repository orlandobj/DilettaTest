import 'package:diletta_teste/modules/modules.dart';

import '../../../../core/imports/imports.dart';

class RemoveFromWishlistDatasource implements RemoveFromWishlistUsecase {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<void> removeFromWishlist(String productId, String userId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('wishlist')
          .doc(productId)
          .delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
