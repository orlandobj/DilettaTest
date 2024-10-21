
import '../../../modules.dart';

abstract class GetProductsUsecase {
  Future<List<ProductEntity>> getProducts();
}
