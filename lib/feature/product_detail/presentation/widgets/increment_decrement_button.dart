import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_colors.dart';

class IncrementDecrementButton extends StatelessWidget {
  const IncrementDecrementButton({
    required this.icon,
    required this.onPress,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: AppColors.white,
      ),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.buttonBg,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
