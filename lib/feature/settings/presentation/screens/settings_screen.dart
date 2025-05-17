import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_constants.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/settings/domain/entities/app_locale.dart';
import 'package:katyayani/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:katyayani/feature/settings/presentation/widgets/settings_app_bar.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBar(),
      body: Stack(
        children: <Widget>[
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(AppAssets.halfLeftBurger),
                Image.asset(AppAssets.halfRightBurger),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.editProfileBg.withValues(alpha: 0.8),
          ),
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (BuildContext context, SettingsState state) {
              if (state is SettingsLoaded) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.white,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 34),
                    onTap: () {},
                    leading: const Icon(Icons.language),
                    title: Text(AppLocalizations.of(context).changeLanguage),
                    subtitle: Row(
                      spacing: 8,
                      children: AppsConstants.supportedLocales
                          .map((AppLocale locale) {
                        final bool isSelected = locale.code ==
                            (state.locale?.code ?? 'en'); //ask doubt
                        return ChoiceChip(
                          label: Text(locale.name!.toUpperCase()),
                          selected: isSelected,
                          selectedColor: AppColors.hot,
                          backgroundColor:
                              AppColors.labelTxt.withValues(alpha: 0.4),
                          labelStyle: AppTextStyles.textFieldStyle.copyWith(
                            color:
                                isSelected ? AppColors.white : AppColors.black,
                          ),
                          onSelected: (bool value) {
                            context
                                .read<SettingsBloc>()
                                .add(ChangeLocaleEvent(locale: locale));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
