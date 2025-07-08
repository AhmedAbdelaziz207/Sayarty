import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle heading24BoldPrimary = GoogleFonts.tajawal(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor, // primary
  );

  static TextStyle heading20BoldBlack = GoogleFonts.tajawal(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle body14Regular = GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static TextStyle body14Bold = GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle button16White = GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle small12Grey = GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.gray,
  );
}
