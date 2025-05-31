import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayaraty/core/routing/app_router.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  Locale _selectedLocale = Locale('ar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),

              // Image
              Image.asset('assets/images/language.png', height: 220.h),

              SizedBox(height: 40.h),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.sp),
                child: Column(
                  children: [
                    Text(
                      'languageSelection'.tr(),
                      style: GoogleFonts.tajawal(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Arabic Option
                    _buildLanguageOption(
                      title: 'اللغة العربية',
                      locale: Locale('ar'),
                      selected: _selectedLocale.languageCode == 'ar',
                    ),

                    SizedBox(height: 16.h),

                    // French Option
                    _buildLanguageOption(
                      title: 'French',
                      locale: Locale('fr'),
                      selected: _selectedLocale.languageCode == 'fr',
                    ),

                    SizedBox(height: 40.h),

                    // Start Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.setLocale(_selectedLocale);
                          // Navigate to the next screen
                          Navigator.pushNamed(context, AppRouter.selectRole);
                        },

                        child: Text(
                          'start'.tr(),
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Powered by Masar
              Image.asset('assets/images/masar_logo.png', width: 100.w),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required String title,
    required Locale locale,
    required bool selected,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLocale = locale;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? Color(0xFFFF8A5B) : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: selected ? Color(0xFFFF8A5B) : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
