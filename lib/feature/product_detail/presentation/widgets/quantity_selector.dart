import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/product_detail/presentation/widgets/increment_decrement_button.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).portion,
          style: AppTextStyles.spicy,
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            IncrementDecrementButton(icon: Icons.remove, onPress: onDecrement),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                quantity.toString(),
                style: AppTextStyles.quantity,
              ),
            ),
            IncrementDecrementButton(icon: Icons.add, onPress: onIncrement),
          ],
        ),
      ],
    );
  }
}
