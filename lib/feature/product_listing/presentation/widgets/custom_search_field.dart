import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({required this.onChanged, super.key});
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SearchBar(
          hintText: AppLocalizations.of(context).searchTxt,
          hintStyle: WidgetStatePropertyAll<TextStyle>(
            AppTextStyles.searchHint,
          ),
          onChanged: onChanged,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          leading: Image.asset(AppAssets.search),
          elevation: const WidgetStatePropertyAll<double>(
              0), // Remove default elevation
          backgroundColor: const WidgetStatePropertyAll<Color>(AppColors.white),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
