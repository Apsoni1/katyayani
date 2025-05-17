import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/price_and_actions.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/product_image_dots_indicator.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/product_image_slider.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/quantity_selector.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/variant_selector.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

import '../../../../app_localisation/app_localizations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../common/presentation/widgets/rating_row.dart';
import '../bloc/product_item_detail_bloc.dart';

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({
    required this.product,
    required this.selectedVariant,
    required this.quantity,
    required this.currentImagePage,
    super.key,
  });

  final ProductItemEntity product;
  final String selectedVariant;
  final int quantity;
  final int currentImagePage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      children: <Widget>[
        ProductImageSlider(
          images: product.image,
          currentPage: currentImagePage,
          onPageChanged: (index) => context
              .read<ProductItemDetailBloc>()
              .add(ImagePageChanged(index)),
        ),
        ProductImageDotsIndicator(currentPage: currentImagePage, count: 3),
        const SizedBox(height: 25),
        Text(
          product.title,
          style: AppTextStyles.productItemDetailTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            const RatingRow(color: AppColors.deliveryTime),
            Text(
              AppLocalizations.of(context).deliveryTime,
              style: AppTextStyles.deliveryTime,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          product.description,
          style: AppTextStyles.description,
        ),
        const SizedBox(height: 20),
        VariantSelector(selectedVariant: selectedVariant),
        const SizedBox(height: 30),
        QuantitySelector(
          quantity: quantity,
          onIncrement: () {
            context.read<ProductItemDetailBloc>().add(
              QuantityChanged(quantity + 1),
            );
          },
          onDecrement: () {
            if (quantity > 1) {
              context.read<ProductItemDetailBloc>().add(
                QuantityChanged(quantity - 1),
              );
            }
          },
        ),
        const SizedBox(height: 72),
        PriceAndActions(product: product),
      ],
    );
  }
}
