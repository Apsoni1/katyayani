
import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_colors.dart';

class ProductImageDotsIndicator extends StatelessWidget {
  const ProductImageDotsIndicator({
    required this.currentPage,
    required this.count,
    super.key,
  });

  final int currentPage;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? AppColors.black : AppColors.labelTxt,
          ),
        ),
      ),
    );
  }
}







