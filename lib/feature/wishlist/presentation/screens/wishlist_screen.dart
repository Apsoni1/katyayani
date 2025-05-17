import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/products_grid_view_body.dart';
import 'package:katyayani/feature/wishlist/presentation/bloc/wishlist_bloc.dart';

@RoutePage()
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context).wishlist,
          style: AppTextStyles.subTitle,
        ),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (BuildContext context, WishlistState state) {
          switch (state) {
            case WishlistLoading():
              return const Center(child: CircularProgressIndicator());
            case WishlistLoaded():
              final List<ProductItemEntity> items = state.items;
              if (items.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context).wishlistEmpty),
                );
              }
              return ProductsGridViewBody(products: items);
            case WishlistError():
              return Center(child: Text(state.message));

            case WishlistInitial():
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
