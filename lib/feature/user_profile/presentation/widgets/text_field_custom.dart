import 'package:flutter/material.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.label,
    this.enabled,
    this.controller,
    this.obscureText,
  });
  final String? labelText;
  final Widget? label;
  final bool? enabled;
  final bool? obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        validator: (String? value) => (value == null || value.isEmpty)
            ? "${labelText ?? AppLocalizations.of(context).password} ${AppLocalizations.of(context).isRequired}"
            : null,
        enabled: enabled,
        style: AppTextStyles.textFieldStyle,
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          label: label,
          labelText: labelText,
          labelStyle: AppTextStyles.textFieldHint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: AppColors.outlineBorder, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: AppColors.outlineBorder, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: AppColors.outlineBorder, width: 2),
          ),
        ),
      );
}
