import 'package:diletta_teste/core/imports/imports.dart';
import 'package:diletta_teste/modules/modules.dart';

class ProductMapper {
  static List<ProductEntity> toEntityList(List<QueryDocumentSnapshot> docs) {
    List<ProductEntity> products = [];
    for (var doc in docs) {
      products.add(ProductEntity(
          id: doc['id'],
          name: doc['name'],
          description: doc['description'],
          image: doc['image']));
    }
    return products;
  }
}
