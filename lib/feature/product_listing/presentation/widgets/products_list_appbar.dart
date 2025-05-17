import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/core/navigation/app_router.gr.dart';

class ProductsListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SafeArea(
        child: ListTile(
          title: Text(
            AppLocalizations.of(context).appName,
            style: AppTextStyles.title,
          ),
          titleAlignment: ListTileTitleAlignment.top,
          subtitle: Text(
            AppLocalizations.of(context).orderQuote,
            style: AppTextStyles.subTitle,
          ),
          trailing: InkWell(
              onTap: () => context.router.navigate(const EditProfileRoute()),
              child: Image.asset(
                AppAssets.profile,
                width: 50,
                height: 120,
              )),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
