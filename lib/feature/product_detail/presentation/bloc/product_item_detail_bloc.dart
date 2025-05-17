import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_constants.dart';
import 'package:katyayani/core/networking/network_failure.dart';
import 'package:katyayani/feature/product_detail/domain/usecase/get_product_item_detail.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';
import 'package:share_plus/share_plus.dart';

part 'product_item_detail_event.dart';

part 'product_item_detail_state.dart';
class ProductItemDetailBloc
    extends Bloc<ProductItemDetailEvent, ProductItemDetailState> {
  ProductItemDetailBloc({required this.getProductItemDetail})
      : super(ProductItemDetailInitial()) {
    on<FetchProductItemDetails>(_fetchProductItemDetails);
    on<SliderValueChanged>(_sliderValueChanged);
    on<ShareProduct>(_onShareProduct);
    on<VariantSelected>((event, emit) {
      if (state is ProductItemDetailLoaded) {
        final current = state as ProductItemDetailLoaded;
        emit(current.copyWith(selectedVariant: event.variant));
      }
    });

    on<QuantityChanged>((event, emit) {
      if (state is ProductItemDetailLoaded) {
        final current = state as ProductItemDetailLoaded;
        emit(current.copyWith(quantity: event.quantity));
      }
    });

    on<ImagePageChanged>((event, emit) {
      if (state is ProductItemDetailLoaded) {
        final current = state as ProductItemDetailLoaded;
        emit(current.copyWith(currentImagePage: event.pageIndex));
      }
    });


  }
  GetProductItemDetail getProductItemDetail;

  Future<void> _fetchProductItemDetails(
    FetchProductItemDetails event,
    Emitter<ProductItemDetailState> emit,
  ) async {
    emit(ProductItemDetailLoading());
    final Either<NetworkFailure, ProductItemEntity> result =
        await getProductItemDetail.getProductItem(event.id);
    result.fold((NetworkFailure failure) {
      emit(ProductItemDetailLoadError(error: failure.message));
    }, (ProductItemEntity product) {
      emit(ProductItemDetailLoaded(product: product, sliderValue: 0.0));
    });
  }

  Future<void> _sliderValueChanged(
    SliderValueChanged event,
    Emitter<ProductItemDetailState> emit,
  ) async {
    if (state is ProductItemDetailLoaded) {
      final ProductItemDetailLoaded currentState = state as ProductItemDetailLoaded;
      emit(currentState.copyWith(sliderValue: event.value));
    }
  }
  Future<void> _onShareProduct(
      ShareProduct event,
      Emitter<ProductItemDetailState> emit,
      ) async {
    final String fallbackUrl = AppsConstants.productShareUrl;
    final String shareMessage = "Check out this product: ${event.product.title}\nOpen in app: $fallbackUrl";

    try {
      await Share.share(shareMessage, subject: "Product Recommendation");
      // Optionally i can emit a success state here
    } catch (e) {
      // Optionally i can emit an error state here
    }
  }

}
