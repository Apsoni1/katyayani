import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/feature/settings/domain/entities/app_locale.dart';
import 'package:katyayani/feature/settings/domain/use_cases/settings_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.settingsUseCase}) : super(SettingsInitial()) {
    on<LoadSettingsEvent>(_loadSettingsEvent);
    on<ChangeLocaleEvent>(_changeLocaleEvent);
  }
  final SettingsUseCase settingsUseCase;

  Future<void> _loadSettingsEvent(
    LoadSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final AppLocale? locale = await settingsUseCase.getAppLocale();
    emit(SettingsLoaded(locale: locale));
  }

  Future<void> _changeLocaleEvent(
    ChangeLocaleEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await settingsUseCase.setAppLocale(event.locale);
    final AppLocale? locale = await settingsUseCase.getAppLocale();
    emit(SettingsLoaded(locale: locale));
  }
}
