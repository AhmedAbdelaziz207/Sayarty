import 'package:flutter/material.dart';
import 'package:sayaraty/core/routing/app_router.dart';
import 'package:sayaraty/core/utils/app_assets.dart';

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
          // Center logo
          Center(child: Image.asset(AppAssets.logo, width: 200)),
        ],
      ),
    );
  }
}
