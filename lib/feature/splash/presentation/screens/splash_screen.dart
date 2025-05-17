import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/core/navigation/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      // 🛡️ Prevent overriding deep links
      final stack = context.router.stack;
      final isOnlySplash = stack.length == 1 && stack.first.name == SplashRoute.name;

      if (isOnlySplash) {
        context.replaceRoute(const HomeRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              AppColors.gradientTop,
              AppColors.gradientCenter,
              AppColors.gradientBottom,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              heightFactor: 10,
              child: Image.asset(AppAssets.profile),
            ),
          ],
        ),
      ),
    );
  }
}
