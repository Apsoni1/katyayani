part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}

final class LoadSettingsEvent extends SettingsEvent {}

final class ChangeLocaleEvent extends SettingsEvent {
  ChangeLocaleEvent({required this.locale});
  final AppLocale? locale;
  @override
  List<Object?> get props => <Object?>[locale];
}
