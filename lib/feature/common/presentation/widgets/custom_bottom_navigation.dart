import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'bottom_nav_item.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    required this.activeIndex,
    required this.onTap,
    super.key,
  });
  final int activeIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      color: AppColors.hot,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            onPress: () => onTap(0),
            assetName: AppAssets.home,
            isSelected: activeIndex == 0,
          ),
          BottomNavItem(
            onPress: () => onTap(1),
            assetName: AppAssets.profileIc,
            isSelected: activeIndex == 1,
          ),
          const SizedBox(),
          BottomNavItem(
            onPress: () => onTap(2),
            assetName: AppAssets.comment,
            isSelected: activeIndex == 2,
          ),
          BottomNavItem(
            onPress: () => onTap(3),
            assetName: AppAssets.filledHeart,
            isSelected: activeIndex == 3,
          ),
        ],
      ),
    );
  }
}
