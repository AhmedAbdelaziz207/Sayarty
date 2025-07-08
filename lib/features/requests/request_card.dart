import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayaraty/core/widgets/custom_dialog.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_local_keys.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date & Icon
            Row(
              children: [
                Image.asset(
                  AppAssets.scanner,
                  width: 40.w,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 4.w),
                Text(
                  "سكانير",
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "10/10/2023",
                  style: AppTextStyles.small12Grey.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              "خدمة السكانير هي خدمات احترافية تتعلق بفحص أشياء السيارة بدقة شديدة والتجهيزات قبل الشراء للتأكد من صحة سلامتها.",
              style: AppTextStyles.body14Regular.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 12.h),

            // Request Status
            Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/300", // Replace with actual URL
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "خالد سعيد",
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => FlexibleDialog(
                                icon: Icons.warning,
                                title: "هل انت متاكد من الغاء الطلب",
                                message: "سيتم حذف الطلب من قائمة الطلبات",
                                primaryButtonText: "نعم",
                                secondaryButtonText: "لا",
                                onPrimaryTap: () {},
                                onSecondaryTap: () {},
                              ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          AppLocalKeys.cancelRequest.tr(),
                          style: AppTextStyles.button16White,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.orange,
                          size: 18.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "يبعد عنك 1 كيلو",
                          style: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // User & Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppLocalKeys.showNumber.tr(),
                      style: GoogleFonts.cairo(),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppLocalKeys.directions.tr(),
                      style: GoogleFonts.cairo(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
