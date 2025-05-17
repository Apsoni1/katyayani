import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/core/di/service_locator.dart';
import 'package:katyayani/feature/product_detail/presentation/bloc/product_item_detail_bloc.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/product_item_detail_body.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

@RoutePage()
class ProductItemDetailScreen extends StatelessWidget {
  const  ProductItemDetailScreen({
    @PathParam('id') required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductItemDetailBloc>(
      create: (BuildContext context) =>
          AppInjector.injector<ProductItemDetailBloc>()
            ..add(FetchProductItemDetails(index)),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => context.router.maybePop(),
            child: Image.asset(AppAssets.arrowLeft),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                child: Image.asset(AppAssets.search),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProductItemDetailBloc, ProductItemDetailState>(
          builder: (BuildContext context, ProductItemDetailState state) {
            switch (state) {
              case ProductItemDetailLoading():
                return const Center(child: CircularProgressIndicator());
              case ProductItemDetailLoaded():
                final ProductItemEntity product = state.product;
                return ProductItemDetailBody(product: product);
              case ProductItemDetailLoadError(:final String error):
                return Center(child: Text(error));
              case ProductItemDetailInitial():
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
