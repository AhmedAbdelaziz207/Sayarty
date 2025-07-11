import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import 'package:sayaraty/core/utils/app_local_keys.dart';
import 'package:sayaraty/core/utils/image_picker.dart';
import 'package:sayaraty/core/utils/snackbars.dart';
import 'package:sayaraty/core/widgets/app_background.dart';
import 'package:sayaraty/features/login/logic/login_cubit.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/pref_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/loader.dart';
import '../model/login_response.dart';

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
  bool isLoading = false;

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
                              Text(
                                AppLocalKeys.name.tr(),
                                style: AppTextStyles.body14Bold,
                              ),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: nameController,
                                hintText: AppLocalKeys.name.tr(),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalKeys.fieldRequired.tr();
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalKeys.lastName.tr(),
                                style: AppTextStyles.body14Bold,
                              ),
                              SizedBox(height: 8),
                              CustomTextField(
                                controller: nicknameController,
                                hintText: AppLocalKeys.lastName.tr(),
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalKeys.fieldRequired.tr();
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Phone Field
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        handleStates(context, state);
                      },
                      builder: (context, state) {
                        return Column(
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
                        );
                      },
                    ),
                    SizedBox(height: 120.h),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: CustomButton(
                        isLoading: isLoading,
                        text: AppLocalKeys.save.tr(),
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              imageFile != null) {
                            context.read<LoginCubit>().completeLogin(
                              name: nameController.text,
                              familyName: nicknameController.text,
                              phoneNumber: widget.phoneNumber,
                              latitude: "41.1432423",
                              longitude: "32.4134234",
                              deviceToken: "sdlkfjsdkfjskfjksddfj",
                              photoFile: imageFile,
                            );
                          } else if (imageFile == null) {
                            SnackBarUtil.show(
                              context: context,
                              isSuccess: false,
                              message: AppLocalKeys.selectProfileImage.tr(),
                            );
                          }
                        },
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

  void handleStates(BuildContext context, LoginState state) {
    if (state is LoginLoading) {
      isLoading = true;
      setState(() {});
    } else if (state is LoginSuccess) {
      isLoading = false;
      setState(
        () {},
      );
      saveData(state.loginResponse).then((value) {
        Navigator.pushNamed(
          context,
          AppRouter.loginSuccess,
        );
      });
    }

    if (state is LoginError) {
      isLoading = false;
      setState(() {});
      SnackBarUtil.show(
        context: context,
        message: state.message,
        isSuccess: false,
        duration: const Duration(seconds: 5),
      );
    }
  }
}
saveData(LoginResponse response) async {
  log(
    "Saved Data token: ${response.data?.token} id: ${response.data?.id} firstName: ${response.data?.firstName}",
  );

  await PrefManager.setData(Constants.token, response.data?.token);
  await PrefManager.setData(Constants.firstName, response.data?.firstName);
  await PrefManager.setData(Constants.userId, response.data?.id);
}
