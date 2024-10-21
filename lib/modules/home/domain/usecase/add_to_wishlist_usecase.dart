import '../../../modules.dart';

abstract class AddToWishlistUsecase {
  Future<void> addToWishlist(ProductEntity productEntity);
}
