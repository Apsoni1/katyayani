import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/core/di/service_locator.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/presentation/bloc/products_list_bloc.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/product_list_body.dart';
import 'package:katyayani/feature/product_listing/presentation/widgets/products_list_appbar.dart';

@RoutePage()
class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsListBloc>(
      create: (BuildContext context) =>
          AppInjector.injector<ProductsListBloc>()..add(FetchProductsListEvent()),
      child: Scaffold(
        appBar: const ProductsListAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: BlocBuilder<ProductsListBloc, ProductsListState>(
          builder: (BuildContext context, ProductsListState state) {
            switch (state) {
              case ProductListLoading():
                return const Center(child: CircularProgressIndicator());
              case ProductListLoaded():
                final List<ProductItemEntity> products = state.products;
                return ProductListBody(
                  products: products,
                );
              case ProductListError(:final String message):
                return Center(child: Text(message));
              case ProductsListInitial():
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
