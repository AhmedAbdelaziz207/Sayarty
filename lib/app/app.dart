import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import '../core/routing/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          initialRoute: AppRouter.splash,
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: Colors.deepOrange,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,

                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.sp),
                ),
              ),
            ),
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
