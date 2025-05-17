import 'package:katyayani/feature/settings/domain/entities/app_locale.dart';
import 'package:katyayani/feature/settings/domain/repositories/settings_repo.dart';

class SettingsUseCase {
  SettingsUseCase({required this.repository});
  final SettingsRepo repository;

  Future<void> setAppLocale(AppLocale? locale) =>
      repository.changeLocale(locale);
  Future<AppLocale?> getAppLocale() => repository.getLocale();
}
