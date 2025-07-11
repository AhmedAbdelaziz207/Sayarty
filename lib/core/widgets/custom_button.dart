import 'package:flutter/material.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import '../theme/app_colors.dart';
import 'loader.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final double width;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.height = 52,
    this.width = double.infinity,
    this.borderRadius = 28,
    this.textStyle,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(text, style: textStyle),
      ),
    );
  }
}
