import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/app/app.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/features/access_location/access_location_screen.dart';
import 'package:sayaraty/features/home/widgets/home_body_section.dart';

import '../../core/theme/app_text_styles.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/pref_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName = '';

  @override
  void initState() {
    PrefManager.getData(Constants.firstName).then((value) {
      setState(() {
        firstName = value;
      });
    });
    super.initState();
  }

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
                Text('هلا $firstName 👋', style: AppTextStyles.body14Bold),

                SizedBox(height: 4.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccessLocationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'الجزائر - شارع الجيش',
                    style: AppTextStyles.body14Bold.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                    ),
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
