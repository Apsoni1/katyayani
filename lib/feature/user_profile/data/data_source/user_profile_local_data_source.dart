import 'package:katyayani/feature/user_profile/domain/entity/user_profile.dart';

abstract class UserProfileLocalDataSource {
  UserProfileEntity getUserProfile();
  void updateUserProfile(UserProfileEntity user);
  void clearUserProfile();
}

class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  UserProfileEntity _user = UserProfileEntity.empty;

  @override
  UserProfileEntity getUserProfile() => _user;

  @override
  void updateUserProfile(UserProfileEntity user) {
    _user = user;
  }

  @override
  void clearUserProfile() {
    _user = UserProfileEntity.empty;
  }
}
