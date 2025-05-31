import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';

import '../../core/utils/app_assets.dart';

class UserRoleSelection extends StatefulWidget {
  const UserRoleSelection({super.key});

  @override
  State<UserRoleSelection> createState() => _UserRoleSelectionState();
}

class _UserRoleSelectionState extends State<UserRoleSelection> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top-left decorative background
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AppAssets.background, width: 150),
          ),
          // Bottom-right decorative background
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(AppAssets.background, width: 150),
          ),

          // Centered Content
          Column(
            children: [
              SizedBox(height: 120.h),
              Text(
                "هل أنت مستخدم أم فني ؟",
                style: AppTextStyles.heading20BoldBlack,
              ),
              SizedBox(height: 120.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRoleSelection(
                    "assets/images/tech.png",
                    "فني",
                    isSelected: selectedRole == "فني",
                  ),
                  buildRoleSelection(
                    "assets/images/user.png",
                    "مستخدم",
                    isSelected: selectedRole == "مستخدم",
                  ),
                ],
              ),
              SizedBox(height: 120.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize:  Size(300.w, 58.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () {
                  // Navigate to the next screen or perform any desired action
                },
                child:  Text("next".tr(),style: AppTextStyles.button16White,),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRoleSelection(
    String imagePath,
    String title, {
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedRole = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.gray,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              color: isSelected ? AppColors.primary : AppColors.gray,
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: AppTextStyles.body14Bold.copyWith(
                color: isSelected ? AppColors.primary : AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
