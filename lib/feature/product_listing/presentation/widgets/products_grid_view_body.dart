import 'package:flutter/material.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/products_gridview_item.dart';

class ProductsGridViewBody extends StatelessWidget {
  const ProductsGridViewBody({required this.products, super.key});

  final List<ProductItemEntity> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 40.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 14.0,
          childAspectRatio: 0.77,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final ProductItemEntity product = products[index];
          return ProductsGridviewItem(product: product);
        },
      ),
    );
  }
}
