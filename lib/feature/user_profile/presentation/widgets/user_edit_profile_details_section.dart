import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katyayani/app_localisation/app_localizations.dart';
import 'package:katyayani/core/constants/app_assets.dart';
import 'package:katyayani/core/constants/app_colors.dart';
import 'package:katyayani/core/constants/app_text_styles.dart';
import 'package:katyayani/feature/user_profile/domain/entity/user_profile.dart';
import 'package:katyayani/feature/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:katyayani/feature/user_profile/presentation/widgets/custom_text_button.dart';
import 'package:katyayani/feature/user_profile/presentation/widgets/profile_option_tile.dart';
import 'package:katyayani/feature/user_profile/presentation/widgets/text_field_custom.dart';

class UserEditProfileDetailsSection extends StatefulWidget {
  const UserEditProfileDetailsSection({super.key});

  @override
  State<UserEditProfileDetailsSection> createState() =>
      _UserEditProfileDetailsSectionState();
}

class _UserEditProfileDetailsSectionState
    extends State<UserEditProfileDetailsSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (BuildContext context, UserProfileState state) {
        final bool isEditing = state is UserProfileEditState;

        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                children: <Widget>[
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context).name,
                    enabled: isEditing,
                    controller: _nameController,
                  ),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context).email,
                    enabled: isEditing,
                    controller: _emailController,
                  ),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context).address,
                    enabled: isEditing,
                    controller: _addressController,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    label: Row(
                      spacing: 6,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(AppLocalizations.of(context).password),
                        Image.asset(
                          AppAssets.lock,
                          color: AppColors.description,
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                    enabled: isEditing,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Divider(
              indent: 28,
              endIndent: 28,
              height: 2,
              color: AppColors.divider,
            ),
            const SizedBox(height: 20),
            ProfileOptionTile(
              onPress: () {},
              title: AppLocalizations.of(context).paymentDetails,
            ),
            ProfileOptionTile(
              onPress: () {},
              title: AppLocalizations.of(context).orderHistory,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomTextButton(
                  onPress: () {
                    if (isEditing) {
                      if (_formKey.currentState!.validate()) {
                        final UserProfileEntity user = UserProfileEntity(
                          name: _nameController.text,
                          email: _emailController.text,
                          address: _addressController.text,
                          password: _passwordController.text,
                        );
                        context
                            .read<UserProfileBloc>()
                            .add(UpdateUserProfile(user));
                      }
                    } else {
                      context.read<UserProfileBloc>().add(EnableEditEvent());
                    }
                  },
                  title: isEditing
                      ? AppLocalizations.of(context).updateProfile
                      : AppLocalizations.of(context).editProfile,
                  icon: AppAssets.edit,
                  backgroundColor: AppColors.title,
                  style: AppTextStyles.editProfile,
                ),
                CustomTextButton(
                  title: AppLocalizations.of(context).logOut,
                  icon: AppAssets.logout,
                  style: AppTextStyles.logout,
                  side: const BorderSide(color: AppColors.hot, width: 3),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
