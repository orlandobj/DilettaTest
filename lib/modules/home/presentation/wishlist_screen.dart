import 'package:flutter/material.dart';

import '../../../core/imports/imports.dart';
import '../../modules.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController(
          GetProductsDatasource(),
          AddToWishlistDatasource(),
          RemoveFromWishlistDatasource(),
          GetWishlistDatasource())
        ..getWishlist(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
        ),
        body: BlocBuilder<HomeController, List<ProductEntity>>(
          builder: (context, products) {
            if (products.isEmpty) {
              return const Center(child: Text('Nenhum produto na wish list'));
            }

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  leading: Image.network(
                    product.image,
                    width: 40,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.red,
                      width: 40,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await context
                          .read<HomeController>()
                          .removeFromWishlist(product.id);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('${product.name} removido da wish list!'),
                          ),
                        );

                        context.read<HomeController>().getWishlist();
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
