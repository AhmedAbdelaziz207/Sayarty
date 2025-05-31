import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';

import '../../core/routing/app_router.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const FirstOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/onboarding_1.png',
                width: double.infinity,
              ),
            ),
            SizedBox(height: 40.h),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Text(
                    'app_name'.tr(),
                    style: AppTextStyles.heading24BoldPrimary,
                  ),

                  SizedBox(height: 16.h),

                  // Description
                  Text(
                    'app_description'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body14Bold.copyWith(fontSize: 18.sp),
                  ),

                  SizedBox(height: 50.h),

                  // Start Button
                  SizedBox(
                    width: double.infinity,
                    height: 58.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.secondOnboarding,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                      ),
                      child: Text(
                        'next'.tr(),
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Powered by Masar
                  Image.asset('assets/images/masar_logo.png', width: 100.w),
                ],
              ),
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
