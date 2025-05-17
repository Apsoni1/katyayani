import 'package:flutter/material.dart';
import 'package:katyayani/core/constants/app_assets.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(AppAssets.filter,width: 44,height: 44,),
    );
  }
}
