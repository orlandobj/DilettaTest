import 'package:diletta_teste/modules/modules.dart';

import '../../../core/imports/imports.dart';

class HomeController extends Cubit<List<ProductEntity>> {
  final GetProductsDatasource _getProductsDatasource;
  final AddToWishlistDatasource _addToWishlistDatasource;
  final RemoveFromWishlistDatasource _removeFromWishlistDatasource;
  final GetWishlistDatasource _getWishlistDatasource;
  final currentUser = FirebaseAuth.instance.currentUser;

  HomeController(this._getProductsDatasource, this._addToWishlistDatasource,
      this._removeFromWishlistDatasource, this._getWishlistDatasource)
      : super([]);

  Future<void> fetchProducts() async {
    final products = await _getProductsDatasource.getProducts();
    emit(products);
  }

  Future<void> getWishlist() async {
    final products = await _getWishlistDatasource.getWishlist(currentUser!.uid);
    emit(products);
  }

  Future<void> addToWishlist(ProductEntity productEntity) async {
    await _addToWishlistDatasource.addToWishlist(productEntity);
  }

  Future<void> removeFromWishlist(String productId) async {
    await _removeFromWishlistDatasource.removeFromWishlist(
        productId, currentUser!.uid);
  }
}
