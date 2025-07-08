import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import 'package:sayaraty/core/utils/app_local_keys.dart';
import 'package:sayaraty/features/requests/request_card.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          AppLocalKeys.requests.tr(),
          style: AppTextStyles.heading20BoldBlack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            // Tabs
            Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              _currentIndex == 0
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Text(
                          AppLocalKeys.currentRequests.tr(),
                          style: AppTextStyles.body14Bold.copyWith(
                            color:
                                _currentIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              _currentIndex == 1
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Text(
                          AppLocalKeys.pastRequests.tr(),
                          style: AppTextStyles.body14Bold.copyWith(
                            color:
                                _currentIndex == 1
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Order Card
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => RequestCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
