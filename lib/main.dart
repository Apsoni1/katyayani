import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/di/service_locator.dart';
import 'package:katyayani/core/navigation/app_router.dart';
import 'package:katyayani/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:katyayani/feature/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:nested/nested.dart';
import 'app_localisation/app_localizations.dart';
import 'feature/user_profile/presentation/bloc/user_profile_bloc.dart';

void main() {
  AppInjector.setupInjector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<SettingsBloc>(
          //for settings globallly changing language
          create: (BuildContext context) =>
              AppInjector.injector<SettingsBloc>()..add(LoadSettingsEvent()),
        ),
        BlocProvider<UserProfileBloc>(
          //more than 2 screens use it one for edit anther for display
          create: (BuildContext context) =>
              AppInjector.injector<UserProfileBloc>()..add(LoadUserProfile()),
        ),
        BlocProvider<WishlistBloc>(
          //more than 2 screen use it one for adding and another for displaying
          create: (BuildContext context) =>
              AppInjector.injector<WishlistBloc>()..add(LoadWishlist()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          Locale? locale;
          if (state is SettingsLoaded && state.locale?.code != null) {
            locale = Locale(state.locale!.code!);
          }

          return MaterialApp.router(
            //wrapped around material since entire apps language is changed
            theme: ThemeData(
              primaryColor: AppColors.white,
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.white,
                surfaceTintColor: Colors.transparent,
              ),
            ),
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
