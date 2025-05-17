import 'package:katyayani/feature/settings/data/models/app_locale_model.dart';

abstract class SettingsLocalDataSource {
  Future<void> setLocale(AppLocaleModel? code);
  Future<AppLocaleModel?> getLocale();
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  AppLocaleModel? _locale;

  @override
  Future<void> setLocale(AppLocaleModel? locale) async {
    _locale = locale;
  }

  @override
  Future<AppLocaleModel?> getLocale() async {
    return _locale;
  }
}
