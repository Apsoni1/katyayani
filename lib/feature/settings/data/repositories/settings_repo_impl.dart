import 'package:katyayani/feature/settings/data/data_sources/settings_local_datasource.dart';
import 'package:katyayani/feature/settings/data/models/app_locale_model.dart';
import 'package:katyayani/feature/settings/domain/entities/app_locale.dart';
import 'package:katyayani/feature/settings/domain/repositories/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  SettingsRepoImpl({required this.settingsLocalDataSource});
  final SettingsLocalDataSource settingsLocalDataSource;

  @override
  Future<void> changeLocale(AppLocale? locale) {
    return settingsLocalDataSource.setLocale(AppLocaleModel.fromEntity(locale));
  }

  @override
  Future<AppLocale?> getLocale() async {
    final AppLocaleModel? code = await settingsLocalDataSource.getLocale();
    return code;
  }
}
