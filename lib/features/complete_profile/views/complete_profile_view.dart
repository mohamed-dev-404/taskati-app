import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/helper/snack_bar_helper.dart';
import 'package:taskati_app/core/utils/assets/app_assets.dart';
import 'package:taskati_app/core/utils/colors/app_colors.dart';
import 'package:taskati_app/core/utils/styles/text_styles.dart';
import 'package:taskati_app/core/widgets/app_text_form_field.dart';
import 'package:taskati_app/core/widgets/main_button.dart';
import 'package:taskati_app/core/widgets/tab_button.dart';
import 'package:taskati_app/features/complete_profile/widgets/remove_image_icon.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String? _imagePath;
  late final TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* AppBar
      appBar: AppBar(
        title: const Text('Complete Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Gap(24),
                //* image title
                _buildTitlText('Profile Image'),
                const Gap(20),
                //* image section
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: (_imagePath == null)
                          ? const AssetImage(AppAssets.user)
                          : FileImage(
                              File(_imagePath!),
                            ),
                    ),
                    (_imagePath == null)
                        ? const SizedBox.shrink()
                        : Positioned(
                            bottom: 8,
                            right: 6,
                            child: RemoveImageIcon(
                              onTap: () {
                                setState(() {
                                  _imagePath = null;
                                });
                              },
                            ),
                          ),
                  ],
                ),
                const Gap(32),
                //* Add image Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabButton(
                      text: 'From Camera',
                      onPressed: () async {
                        var pickedImage = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                        );
                        if (pickedImage != null) {
                          setState(() {
                            _imagePath = pickedImage.path;
                          });
                        }
                      },
                    ),
                    const Gap(12),
                    TabButton(
                      text: 'From Gallery',
                      onPressed: () async {
                        var pickedImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedImage != null) {
                          setState(() {
                            _imagePath = pickedImage.path;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const Gap(50),
                //* name title
                _buildTitlText('Your Name'),
                const Gap(12),
                //* name textField
                AppTextFormField(
                  controller: _nameController,
                  prefixIcon: const Icon(
                    Icons.person_2,
                    color: AppColors.primaryColor,
                  ),
                  hintText: 'Enetr your name',
                ),
              ],
            ),
          ),
        ),
      ),
      //* let's start button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: MainButton(
          text: 'Let’s Start !',
          onPressed: () {
            final name = _nameController.text;
            if (_imagePath == null && name.isEmpty) {
              showErrorSnackBar(
                context,
                'Please, enter your name and choose image',
              );
            } else if (_imagePath == null) {
              showErrorSnackBar(
                context,
                'Please, choose image',
              );
            } else if (name.isEmpty) {
              showErrorSnackBar(
                context,
                'Please, enter your name',
              );
            } else {
              showSuccessSnackBar(
                context,
                'Created account successfully! ',
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildTitlText(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppStyles.caption2.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
