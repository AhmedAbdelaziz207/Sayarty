import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/routing/app_router.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/core/utils/app_assets.dart';
import 'package:sayaraty/core/utils/app_local_keys.dart';
import 'package:sayaraty/core/widgets/app_background.dart';
import 'package:sayaraty/core/widgets/custom_text_field.dart';

import '../../../core/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController(); // Add this lin

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.18,
          left: 24.w,
          right: 24.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalKeys.login.tr(),
                style: AppTextStyles.heading20BoldBlack,
              ),
              SizedBox(height: 4.h),
              Text(
                AppLocalKeys.inputYourPhoneNumber.tr(),
                style: AppTextStyles.body14Bold.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppAssets.logo, width: 270),
              ),

              SizedBox(height: 30.h),
              Text(
                AppLocalKeys.phoneNumber.tr(),
                style: AppTextStyles.body14Bold,
              ),
              SizedBox(height: 8.h),
              Form(
                key: _formKey,
                child: CustomTextField(
                  controller: phoneController,
                  hintText: AppLocalKeys.inputPhoneNumber.tr(),
                  suffixIcon: Icons.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalKeys.inputYourPhoneNumber.tr();
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 160.h),
              ElevatedButton(
                onPressed: () {
                  // Loading Simulation

                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                        Navigator.pushNamed(
                          context,
                          AppRouter.loginComplete,
                          arguments: phoneController.text,
                        );
                      });
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                ),
                child:
                    isLoading
                        ? CircularProgressIndicator(color: AppColors.white)
                        : Text(
                          AppLocalKeys.enter.tr(),
                          style: AppTextStyles.button16White,
                        ),
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/masar_logo.png", width: 120),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
