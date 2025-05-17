import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/navigation/app_router.gr.dart';

class EditProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EditProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () => context.router.maybePop(),
        child: Image.asset(
          AppAssets.arrowLeft,
          color: AppColors.white,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            icon: const Icon(
              Icons.settings,
              color: AppColors.white,
              size: 24,
            ),
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
