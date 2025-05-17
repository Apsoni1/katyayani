import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.editProfileBg.withValues(alpha: 0.8),
      centerTitle: false,
      title: Text(
        AppLocalizations.of(context).settings,
        style: AppTextStyles.textFieldHint.copyWith(color: AppColors.white),
      ),
      leading: InkWell(
        onTap: () => context.router.maybePop(),
        child: Image.asset(
          AppAssets.arrowLeft,
          color: AppColors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
