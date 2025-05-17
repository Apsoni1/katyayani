part of 'product_item_detail_bloc.dart';


@immutable
sealed class ProductItemDetailEvent extends Equatable {
  const ProductItemDetailEvent(); // always const using parent
  @override
  List<Object> get props => <Object>[];
}

class FetchProductItemDetails extends ProductItemDetailEvent {
  const FetchProductItemDetails(this.id);
  final int id;

  @override
  List<Object> get props => <int>[id];
}

class SliderValueChanged extends ProductItemDetailEvent {
  const SliderValueChanged(this.value);
  final double value;
  @override
  List<Object> get props => <double>[value];
}
class ShareProduct extends ProductItemDetailEvent {
  final ProductItemEntity product;
  const ShareProduct(this.product);

  @override
  List<Object> get props => [product];
}
class VariantSelected extends ProductItemDetailEvent {
  final String variant;
  VariantSelected(this.variant);
}

class QuantityChanged extends ProductItemDetailEvent {
  final int quantity;
  QuantityChanged(this.quantity);
}

class ImagePageChanged extends ProductItemDetailEvent {
  final int pageIndex;
  ImagePageChanged(this.pageIndex);
}