part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class LoadUserProfile extends UserProfileEvent {}

class EnableEditEvent extends UserProfileEvent {}

class DisableEditEvent extends UserProfileEvent {}

class UpdateUserProfile extends UserProfileEvent {
  UpdateUserProfile(this.user);
  final UserProfileEntity user;
  @override
  List<Object> get props => <UserProfileEntity>[user];
}

class ClearUserProfileEvent extends UserProfileEvent {}
