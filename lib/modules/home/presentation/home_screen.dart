import 'package:flutter/material.dart';

import '../../../core/imports/imports.dart';
import '../../modules.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController(
          GetProductsDatasource(),
          AddToWishlistDatasource(),
          RemoveFromWishlistDatasource(),
          GetWishlistDatasource())
        ..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocBuilder<HomeController, List<ProductEntity>>(
          builder: (context, products) {
            if (products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 150),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  leading: Image.network(
                    width: 40,
                    product.image,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.red,
                      width: 40,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      context.read<HomeController>().addToWishlist(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${product.name} foi adicionado à wish list!'),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Nav(context).push(page: const WishListScreen());
          },
          tooltip: 'Ver Wish List',
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
