import 'package:katyayani/feature/settings/domain/entities/app_locale.dart';

class AppsConstants {
  static const String productShareUrl = "https://apoorvsoni.neocities.org/";

  static final List<AppLocale> supportedLocales = const <AppLocale>[
    AppLocale(code: 'en', name: 'English'),
    AppLocale(code: 'hi', name: 'Hindi'),
  ];
 static final variantsToShow = ['Variant A', 'Variant B', 'Variant C'];

}
