import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/app/app.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/features/home/widgets/home_body_section.dart';

import '../../core/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: Colors.white,
        toolbarHeight: 80.h,

        title: Row(
          children: [
            CircleAvatar(backgroundColor: AppColors.primaryColor),
            const SizedBox(width: 8),
            Column(
              children: [
                Text('هلا سارة توفيق 👋', style: AppTextStyles.body14Bold),

                Text(
                  'الجزائر - شارع الجيش',
                  style: AppTextStyles.body14Regular.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications, color: AppColors.primaryColor),
          const SizedBox(width: 8),
        ],
      ),
      body: HomeBodySection(),
    );
  }
}
