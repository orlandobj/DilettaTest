import 'package:diletta_teste/modules/modules.dart';

import '../../../../core/imports/imports.dart';

class GetProductsDatasource implements GetProductsUsecase {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('products').get();
      return ProductMapper.toEntityList(snapshot.docs);
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
