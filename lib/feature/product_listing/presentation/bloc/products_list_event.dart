part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class FetchProductsListEvent extends ProductsListEvent {}

class SearchProductsEvent extends ProductsListEvent {
  SearchProductsEvent(this.query);
  final String query;

  @override
  List<Object> get props => <String>[query];
}

class FetchProductCategoriesEvent extends ProductsListEvent {}

class FilterByCategoryEvent extends ProductsListEvent {
  FilterByCategoryEvent(this.category);
  final String category;

  @override
  List<Object> get props => <String>[category];
}
