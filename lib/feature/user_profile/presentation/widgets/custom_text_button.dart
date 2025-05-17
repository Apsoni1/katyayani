import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {required this.title,
      required this.icon,
      super.key,
      this.side,
      this.backgroundColor,
      this.style,
      this.iconColor,
      this.onPress});
  final String title;
  final String icon;
  final BorderSide? side;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? style;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      label: Text(
        title,
        style: style,
      ),
      iconAlignment: IconAlignment.end,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        side: side,
        backgroundColor: backgroundColor,
      ),
      icon: Image.asset(
        icon,
        width: 24,
        height: 24,
        color: iconColor,
      ),
    );
  }
}
