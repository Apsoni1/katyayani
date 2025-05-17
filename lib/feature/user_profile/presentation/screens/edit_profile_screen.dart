import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/utils/screen_size_utils.dart'
    show ScreenSizeUtils;
import 'package:katyayani/feature/user_profile/presentation/widgets/edit_profile_appbar.dart';
import 'package:katyayani/feature/user_profile/presentation/widgets/user_edit_profile_details_section.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenSizeUtils size = ScreenSizeUtils(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const EditProfileAppbar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: size.h(0.06),
            left: 0,
            right: 0,
            child: Image.asset(AppAssets.profile),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.editProfileBg.withValues(alpha: 0.8),
          ),
          Positioned.fill(
            top: size.h(0.24),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 70,
              ),
              child: const UserEditProfileDetailsSection(),
            ),
          ),
          Positioned(
            top: size.h(0.1),
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  AppAssets.profile,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
