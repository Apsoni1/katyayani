import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:katyayani/feature/wishlist/domain/use_cases/wishlist_usecase.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc({required this.wishlistUseCase}) : super(WishlistInitial()) {
    on<LoadWishlist>(_loadWishlist);
    on<AddToWishlist>(_addToWishlist);
    on<RemoveFromWishlist>(_removeFromWishlist);
  }
  final WishlistUseCase wishlistUseCase;

  void _loadWishlist(LoadWishlist event, Emitter<WishlistState> emit) {
    emit(WishlistLoading());
    final List<ProductItemEntity> items = wishlistUseCase.getWishlistItems();
    emit(WishlistLoaded(items));
  }

  void _addToWishlist(AddToWishlist event, Emitter<WishlistState> emit) {
    final WishlistState currentState = state;
    if (currentState is WishlistLoaded) {
      final List<ProductItemEntity> updatedList =
          List<ProductItemEntity>.from(currentState.items)..add(event.item);
      wishlistUseCase.addToWishlist(event.item);
      emit(WishlistLoaded(updatedList));
    }
  }

  void _removeFromWishlist(
      RemoveFromWishlist event, Emitter<WishlistState> emit) {
    final WishlistState currentState = state;
    if (currentState is WishlistLoaded) {
      final List<ProductItemEntity> updatedList = currentState.items
          .where((ProductItemEntity item) => item.id != event.item.id)
          .toList();
      wishlistUseCase.removeFromWishlist(event.item);
      emit(WishlistLoaded(updatedList));
    }
  }
}
