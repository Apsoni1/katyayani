import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    required this.onPress,
    required this.assetName,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onPress;
  final String assetName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            assetName,
            color: AppColors.white,
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 4),
          if (isSelected)
            const CircleAvatar(
              radius: 2,
              backgroundColor: AppColors.white,
            ),
        ],
      ),
    );
  }
}
