import 'package:katyayani/feature/settings/domain/entities/app_locale.dart';

class AppLocaleModel extends AppLocale {
  const AppLocaleModel({required super.name, required super.code});

  factory AppLocaleModel.fromEntity(AppLocale? locale) {
    return AppLocaleModel(name: locale!.name, code: locale.code);
  }

  AppLocale? toEntity() {
    return AppLocale(name: name, code: code);
  }
}
