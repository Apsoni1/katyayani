import 'package:katyayani/feature/user_profile/domain/entity/user_profile.dart';
import 'package:katyayani/feature/user_profile/domain/repo/user_profile_repo.dart';

class UserProfileUseCase {
  UserProfileUseCase({required this.repo});
  final UserProfileRepo repo;

  UserProfileEntity getUserProfile() {
    return repo.getUser();
  }

  void updateUserProfile(UserProfileEntity profile) {
    repo.updateUser(profile);
  }

  void clearUserProfile() {
    repo.clearUserProfile();
  }
}
