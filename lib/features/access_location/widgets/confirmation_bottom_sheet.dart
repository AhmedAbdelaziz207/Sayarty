import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import 'package:place_picker_google/place_picker_google.dart';

import '../../../core/widgets/custom_button.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  const ConfirmationBottomSheet(
      {super.key,
      required this.address,
      required this.isSearch,
      this.result});

  final String? address;
  final bool isSearch;
  final LocationResult? result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Confirm Location",
          ),
          SizedBox(height: 12),
          isSearch
              ? SizedBox(height: 60, child: CircularProgressIndicator())
              : Text(
                  address ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: AppTextStyles.body14Regular.copyWith(
                    fontSize: 16,
                    color: AppColors.gray,
                  ),
                ),
          SizedBox(height: 20),
          CustomButton(

            text: "Access Location Now",
            onPressed: () {
              // locationController.selectAddress(
              //     result!.formattedAddress ?? "Unknown Location",
              //     LatLng(result!.latLng!.latitude, result!.latLng!.longitude),
              //     result!);
            }, isLoading: false,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
