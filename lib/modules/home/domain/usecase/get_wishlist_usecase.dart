
import '../../../modules.dart';

abstract class GetWishlistUsecase {
  Future<List<ProductEntity>> getWishlist(String userId);
}
