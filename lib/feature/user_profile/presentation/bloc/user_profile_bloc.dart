import 'package:equatable/equatable.dart';
import 'package:katyayani/feature/user_profile/domain/entity/user_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:katyayani/feature/user_profile/domain/usecase/user_profile_usecase.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required this.userProfileUseCase})
      : super(UserProfileInitial()) {
    on<LoadUserProfile>(_loadUserProfile);
    on<UpdateUserProfile>(_updateUserProfile);
    on<EnableEditEvent>(_enableEditEvent);
    on<ClearUserProfileEvent>(_clearUserProfile);
  }

  final UserProfileUseCase userProfileUseCase;

  Future<void> _loadUserProfile(
    LoadUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      emit(UserProfileLoading());
      final UserProfileEntity userProfile = userProfileUseCase.getUserProfile();
      emit(UserProfileLoaded(userProfile));
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  Future<void> _updateUserProfile(
    UpdateUserProfile event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      userProfileUseCase.updateUserProfile(event.user);
      emit(UserProfileUpdated(event.user));
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  Future<void> _enableEditEvent(
    EnableEditEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileEditState(isEditing: true));
  }

  Future<void> _clearUserProfile(
    ClearUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    userProfileUseCase.clearUserProfile();
    emit(UserProfileInitial());
  }
}
