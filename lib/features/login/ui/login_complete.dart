import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import 'package:sayaraty/core/utils/app_local_keys.dart';
import 'package:sayaraty/core/utils/image_picker.dart';
import 'package:sayaraty/core/utils/snackbars.dart';
import 'package:sayaraty/core/widgets/app_background.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_text_field.dart';

class LoginCompleteScreen extends StatefulWidget {
  const LoginCompleteScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<LoginCompleteScreen> createState() => _LoginCompleteScreenState();
}

class _LoginCompleteScreenState extends State<LoginCompleteScreen> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  File? imageFile;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController(text: widget.phoneNumber);

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 30,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 24),
                    Text(
                      "من فضلك أكمل إدخال البيانات",
                      style: AppTextStyles.heading20BoldBlack,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "أملئ البيانات لتتمكن من الدخول إلى التطبيق",
                      style: AppTextStyles.body14Bold.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          await ImagePickerUtil.pickImage(
                            source: ImageSource.gallery,
                          ).then((value) {
                            if (value != null) {
                              setState(() {
                                imageFile = value;
                              });
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.gray,
                          backgroundImage:
                              imageFile != null ? FileImage(imageFile!) : null,
                          child:
                              imageFile != null
                                  ? null
                                  : Icon(
                                    Icons.camera_alt_outlined,
                                    size: 42,
                                    color: AppColors.black.withOpacity(0.2),
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Name and Nickname Fields
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("الاسم", style: AppTextStyles.body14Bold),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: nameController,
                                hintText: "الاسم",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("اللقب", style: AppTextStyles.body14Bold),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: nicknameController,
                                hintText: "اللقب",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Phone Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalKeys.phone.tr(),
                          style: AppTextStyles.body14Bold,
                        ),
                        SizedBox(height: 8),

                        CustomTextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: AppLocalKeys.phone.tr(),
                          enabled: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 120.h),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   AppRouter.loginSuccess,
                          //   (route) => false,
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text("حفظ", style: AppTextStyles.button16White),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/masar_logo.png",
                        height: 20.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
