import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/product_listing/domain/usecase/get_all_products_list.dart';

part 'products_list_event.dart';

part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc({required this.getAllProductsList}) : super(ProductsListInitial()) {
    on<FetchProductsListEvent>(_fetchProductsListEvent);
    on<SearchProductsEvent>(_searchProductsEvent);
    on<FilterByCategoryEvent>(_filterByCategoryEvent);
  }

  final GetAllProductsList getAllProductsList;

  List<ProductItemEntity> _allProducts =
      <ProductItemEntity>[]; // add one more parameyer in state

  Future<void> _fetchProductsListEvent(
    FetchProductsListEvent event,
    Emitter<ProductsListState> emit,
  ) async {
    emit(ProductListLoading());
    final Either<NetworkFailure, List<ProductItemEntity>> result =
        await getAllProductsList.getAllProductsList();
    result.fold(
      (NetworkFailure failure) => emit(ProductListError(message: failure.message)),
      (List<ProductItemEntity> products) {
        _allProducts = products;
        emit(ProductListLoaded(products: products));
      },
    );
  }

  void _searchProductsEvent(
    SearchProductsEvent event,
    Emitter<ProductsListState> emit,
  ) {
    final String query = event.query.toLowerCase();
    final List<ProductItemEntity> filteredProducts = _allProducts
        .where(
          (ProductItemEntity product) => product.title.toLowerCase().contains(query),
        )
        .toList();
    emit(ProductListLoaded(products: filteredProducts));
  }

  void _filterByCategoryEvent(
    FilterByCategoryEvent event,
    Emitter<ProductsListState> emit,
  ) {
    final List<ProductItemEntity> filteredProducts = event.category == 'All'
        ? _allProducts
        : _allProducts
            .where((ProductItemEntity product) => product.category == event.category)
            .toList();
    emit(ProductListLoaded(products: filteredProducts));
  }

  List<String> get allCategories {
    final List<String> categories = _allProducts
        .map((ProductItemEntity product) => product.category)
        .toSet()
        .toList()
      ..insert(0, 'All');
    return categories;
  }
}
