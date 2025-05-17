part of 'settings_bloc.dart';

@immutable
sealed class SettingsState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

final class SettingsInitial extends SettingsState {}

final class SettingsLoaded extends SettingsState {
  SettingsLoaded({required this.locale});

  final AppLocale? locale;

  @override
  List<Object?> get props => <Object?>[locale];
}
