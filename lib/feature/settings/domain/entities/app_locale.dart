import 'package:equatable/equatable.dart';

class AppLocale extends Equatable {
  const AppLocale({required this.code, required this.name});
  final String? code;
  final String? name;

  @override
  List<Object?> get props => <String?>[code, name];
}
