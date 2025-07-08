import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/utils/app_assets.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AvailableServicesSection extends StatefulWidget {
  const AvailableServicesSection({super.key});

  @override
  State<AvailableServicesSection> createState() =>
      _AvailableServicesSectionState();
}

class _AvailableServicesSectionState extends State<AvailableServicesSection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Text("الخدمات المتاحة", style: AppTextStyles.body14Bold),
        SizedBox(height: 12.h),
        SizedBox(
          height: 120.h,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 16.w),
              buildCategoriesItem(
                isSelected: currentIndex == 0,
                onTap:  () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                AppAssets.electric,
                "كهربائي",
              ),
              SizedBox(width: 12.w),
              buildCategoriesItem(
                isSelected: currentIndex == 1,
                onTap: () =>  setState(() {
                  currentIndex = 1;
                }),
                AppAssets.scanner,
                "سكانير",
              ),
              SizedBox(width: 12.w),
              buildCategoriesItem(
                isSelected: currentIndex == 2,
                onTap: () =>  setState(() {
                  currentIndex = 2;
                }),
                AppAssets.toolly,
                "طولي",
              ),
              SizedBox(width: 12.w),
              buildCategoriesItem(
                isSelected: currentIndex == 3,
                onTap: () =>  setState(() {
                  currentIndex = 3;
                }),
                AppAssets.mechanical,
                "ميكانيكي",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCategoriesItem(
    String imagePath,
    String title, {
    Function()? onTap,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap?? () {},
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primaryColor : AppColors.gray,
                width: 1.5,
              ),
            ),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              color: isSelected ? AppColors.primaryColor : AppColors.gray,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: AppTextStyles.body14Bold.copyWith(
              color: isSelected ? AppColors.primaryColor : AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
