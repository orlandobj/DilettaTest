import 'package:diletta_teste/modules/modules.dart';

import '../../../../core/imports/imports.dart';

class AddToWishlistDatasource implements AddToWishlistUsecase {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addToWishlist(ProductEntity product) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("Usuário não está autenticado.");
      }

      final userId = currentUser.uid;

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('wishlist')
          .doc(product.id)
          .set({
        'id': product.id,
        'name': product.name,
        'description': product.description,
        'image': product.image,
      });

      log('${product.name} adicionado à wish list com sucesso.');
    } catch (e) {
      log('Erro ao adicionar à wish list: $e');
    }
  }
}
