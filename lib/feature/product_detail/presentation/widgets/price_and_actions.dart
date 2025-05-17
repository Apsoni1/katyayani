
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/product_detail/presentation/bloc/product_item_detail_bloc.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/success_dialog.dart';
import 'package:katyayani/feature/product_listing/domain/entity/product_item_entity.dart';

class PriceAndActions extends StatelessWidget {
  const PriceAndActions({required this.product, super.key});

  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: AppColors.buttonBg,
          ),
          child: Text(
            "\$${product.price}",
            style: AppTextStyles.price,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.black),
              onPressed: () {
                context.read<ProductItemDetailBloc>().add(ShareProduct(product));
              },
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const SuccessDialog(),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: AppColors.searchHint,
              ),
              child: Text(
                AppLocalizations.of(context).orderNowTxt,
                style: AppTextStyles.orderNow,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
