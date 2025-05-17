import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';

import '../../../../core/constants/app_colors.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    required this.images,
    required this.currentPage,
    required this.onPageChanged,
    super.key,
  });

  final String images;
  final int currentPage;
  final void Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: images.length > 1
          ? PageView.builder(
              itemCount: 3,
              controller: PageController(initialPage: currentPage),
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return Image.network(
                  images,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.error, size: 50, color: AppColors.red),
                );
              },
            )
          : Image.network(
              images,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.error, color: AppColors.red, size: 50),
                  Text(AppLocalizations.of(context).loadError),
                ],
              ),
            ),
    );
  }
}
