import 'package:flutter/material.dart';
import 'package:sayaraty/core/routing/app_router.dart';
import 'package:sayaraty/core/utils/app_assets.dart';
import 'package:sayaraty/core/widgets/app_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRouter.firstOnboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(child: Image.asset(AppAssets.logo, width: 200)),
    );
  }
}
