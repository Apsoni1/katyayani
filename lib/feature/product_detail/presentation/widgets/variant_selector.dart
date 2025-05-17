import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_constants.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/product_detail/presentation/bloc/product_item_detail_bloc.dart';

class VariantSelector extends StatelessWidget {
  const VariantSelector({required this.selectedVariant, super.key});

  final String selectedVariant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Variant",
          style: AppTextStyles.description.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          children: AppsConstants.variantsToShow.map((variant) {
            final isSelected = variant == selectedVariant;
            return ChoiceChip(
              label: Text(variant),
              selected: isSelected,
              onSelected: (_) {
                if (!isSelected) {
                  context.read<ProductItemDetailBloc>().add(VariantSelected(variant));
                }
              },
              selectedColor: AppColors.buttonBg,
            );
          }).toList(),
        ),
      ],
    );
  }
}


