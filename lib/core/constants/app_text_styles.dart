import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamilyLobster = "Lobster";
  static const String fontFamilyPoppins = "Poppins";
  static const String fontFamilyRoboto = "Roboto";
  static const String fontFamilyInter = "Inter";

  static final TextStyle title = const TextStyle(
    fontFamily: fontFamilyLobster,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
    fontSize: 35,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle subTitle = const TextStyle(
    fontFamily: fontFamilyPoppins,
    fontWeight: FontWeight.w500,
    color: AppColors.subTitle,
    fontSize: 14,
    letterSpacing: 0,
    height: 1,
  );
  static final TextStyle searchHint = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 16,
    letterSpacing: 0,
    height: 1,
  );
  static final TextStyle rating = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 14,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle gridItemTitle = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.title,
    fontSize: 13,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle gridItemSubTitle = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    color: AppColors.title,
    fontSize: 12,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle splashTitle = const TextStyle(
    fontFamily: fontFamilyLobster,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontSize: 50,
    letterSpacing: 0,
    height: 1,
  );
  static final TextStyle deliveryTime = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
    color: AppColors.deliveryTime,
    fontSize: 14,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle productItemDetailTitle = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.title,
    fontSize: 25,
    letterSpacing: 0,
    height: 1.35,
    overflow: TextOverflow.ellipsis,
  );
  static final TextStyle description = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    color: AppColors.description,
    fontSize: 15,
    letterSpacing: 0,
    height: 1.70,
  );
  static final TextStyle orderNow = const TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontSize: 18,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle price = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontSize: 18,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle spicy = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 13,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle mild = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.mild,
    fontSize: 10,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle hot = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.hot,
    fontSize: 10,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle quantity = const TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 16,
    letterSpacing: 0,
    height: 1.35,
  );
  static final TextStyle success = const TextStyle(
    fontFamily: fontFamilyPoppins,
    fontWeight: FontWeight.w700,
    color: AppColors.hot,
    fontSize: 24,
    letterSpacing: 0,
    height: 1,
  );
  static final TextStyle successTxt = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w400,
    color: AppColors.deliveryTime,
    fontSize: 11,
    letterSpacing: 0,
    height: 1.54,
  );
  static final TextStyle goBack = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontSize: 12,
    letterSpacing: 0,
    height: 1.54,
  );
  static final TextStyle logout = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.hot,
    fontSize: 16,
    letterSpacing: 0,
    height: 1.54,
  );
  static final TextStyle editProfile = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontSize: 16,
    letterSpacing: 0,
    height: 1.54,
  );
  static final TextStyle paymentTxt = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w600,
    color: AppColors.labelTxt,
    fontSize: 14,
    letterSpacing: 0,
    height: 1.32,
  );
  static final TextStyle textFieldHint = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w700,
    color: AppColors.labelTxt,
    fontSize: 17,
    letterSpacing: 0,
    height: 1.54,
  );
  static final TextStyle textFieldStyle = const TextStyle(
    fontFamily: fontFamilyRoboto,
    fontWeight: FontWeight.w900,
    color: AppColors.black,
    fontSize: 14,
    letterSpacing: 0,
    height: 1,
  );
  static final TextStyle selectedTab = const TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontSize: 14,
    letterSpacing: 0,
    height: 1,
  );
  static final TextStyle unSelectedTab = const TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w400,
    color: AppColors.description,
    fontSize: 14,
    letterSpacing: 0,
    height: 1,
  );
}
