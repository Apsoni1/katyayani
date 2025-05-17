part of 'product_item_detail_bloc.dart';

@immutable
sealed class ProductItemDetailState extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

final class ProductItemDetailInitial extends ProductItemDetailState {}

final class ProductItemDetailLoading extends ProductItemDetailState {}

final class ProductItemDetailLoaded extends ProductItemDetailState {
  final ProductItemEntity product;
  final double sliderValue;
  final String? selectedVariant;
  final int quantity;
  final int currentImagePage;

  ProductItemDetailLoaded({
    required this.product,
    required this.sliderValue,
    this.selectedVariant,
    this.quantity = 1,
    this.currentImagePage = 0,
  });

  ProductItemDetailLoaded copyWith({
    ProductItemEntity? product,
    double? sliderValue,
    String? selectedVariant,
    int? quantity,
    int? currentImagePage,
  }) {
    return ProductItemDetailLoaded(
      product: product ?? this.product,
      sliderValue: sliderValue ?? this.sliderValue,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      quantity: quantity ?? this.quantity,
      currentImagePage: currentImagePage ?? this.currentImagePage,
    );
  }

  @override
  List<Object> get props => <Object>[
    product,
    sliderValue,
    selectedVariant ?? '',
    quantity,
    currentImagePage,
  ];
}



final class ProductItemDetailLoadError extends ProductItemDetailState {
  ProductItemDetailLoadError({required this.error});
  final String error;
  @override
  List<Object> get props => <String>[error];
}
