import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final String? initialValue;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType ,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.primaryColor;

    return Directionality(
      textDirection:
          context.locale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLines,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: validator,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.body14Bold.copyWith(
            fontSize: 12.sp,
            color: primaryColor,
          ),
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon, color: primaryColor) : null,
          suffixIcon:
              suffixIcon != null ? Icon(suffixIcon, color: primaryColor) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
