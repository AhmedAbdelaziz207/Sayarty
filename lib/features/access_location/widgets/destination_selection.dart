import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';

import '../../../core/theme/app_colors.dart';

class DestinationSelection extends StatefulWidget {
  const DestinationSelection({super.key});

  @override
  State<DestinationSelection> createState() => _SetAsSelectionState();
}

class _SetAsSelectionState extends State<DestinationSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        "Set as",
        ),
        SizedBox(height: 12),
        // Obx(() {
        //   return SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: locationController.options.map((option) {
        //
        //         return GestureDetector(
        //           onTap: () {
        //             setState(() {
        //             });
        //           },
        //           child: Container(
        //             margin: EdgeInsets.only(right: 12),
        //             padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                 color:
        //                     isSelected ? AppColors.black : Colors.grey.shade300,
        //                 width: 1,
        //               ),
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: Text(
        //               option,
        //               style: AppTextStyles.body14Regular.copyWith(
        //                 color: isSelected ? AppColors.black : AppColors.gray,
        //               ),
        //             ),
        //           ),
        //         );
        //       }).toList(),
        //     ),
        //   );
        // }),
      ],
    );
  }
}
