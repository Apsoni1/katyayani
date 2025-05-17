part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => <Object>[];
}

class LoadWishlist extends WishlistEvent {}

class AddToWishlist extends WishlistEvent {
  const AddToWishlist(this.item);
  final ProductItemEntity item;

  @override
  List<Object?> get props => <ProductItemEntity>[item];
}

class RemoveFromWishlist extends WishlistEvent {
  const RemoveFromWishlist(this.item);
  final ProductItemEntity item;

  @override
  List<Object?> get props => <ProductItemEntity>[item];
}
