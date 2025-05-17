part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

final class ProductsListInitial extends ProductsListState {}

final class ProductListLoading extends ProductsListState {}

final class ProductListLoaded extends ProductsListState {
  ProductListLoaded({required this.products});
  final List<ProductItemEntity> products;

  @override
  List<Object> get props => <List<ProductItemEntity>>[products];
}

class ProductListError extends ProductsListState {
  ProductListError({required this.message});
  final String message;

  @override
  List<Object> get props => <String>[message];
}
