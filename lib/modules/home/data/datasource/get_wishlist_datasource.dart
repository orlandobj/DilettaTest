import 'package:diletta_teste/modules/modules.dart';

import '../../../../core/imports/imports.dart';

class GetWishlistDatasource implements GetWishlistUsecase {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<List<ProductEntity>> getWishlist(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('wishlist')
          .get();
      return ProductMapper.toEntityList(snapshot.docs);
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
