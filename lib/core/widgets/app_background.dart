import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sayaraty/core/theme/app_colors.dart';

import '../utils/app_assets.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.child});

  final Widget? child;

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
          Align(
            alignment:
                context.locale.languageCode == 'ar'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
            child: child ?? SizedBox(),
          ),
        ],
      ),
    
    );
  }
}
