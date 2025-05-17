import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: <Widget>[
        Image.asset(
          AppAssets.rating,
          color: AppColors.rating,
        ),
        Text(
          AppLocalizations.of(context).rating5,
          style: AppTextStyles.rating.copyWith(color: color),
        ),
      ],
    );
  }
}
