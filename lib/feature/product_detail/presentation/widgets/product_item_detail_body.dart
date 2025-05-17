import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:katyayani/core/constants/app_constants.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/product_detail_content.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

import '../bloc/product_item_detail_bloc.dart';

class ProductItemDetailBody extends StatelessWidget {
  const ProductItemDetailBody({required this.product, super.key});

  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductItemDetailBloc, ProductItemDetailState>(
      builder: (context, state) {
        switch (state) {
          case ProductItemDetailLoading():
            return const Center(child: CircularProgressIndicator());

          case ProductItemDetailLoadError():
            final errorState = state as ProductItemDetailLoadError;
            return Center(child: Text(errorState.error));

          case ProductItemDetailLoaded():
            final loadedState = state;
            return ProductDetailContent(
              product: loadedState.product,
              selectedVariant: loadedState.selectedVariant ?? AppsConstants.variantsToShow.first,
              quantity: loadedState.quantity,
              currentImagePage: loadedState.currentImagePage,
            );

          case ProductItemDetailInitial():
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}



