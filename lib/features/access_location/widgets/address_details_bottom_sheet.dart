import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sayaraty/core/utils/app_local_keys.dart';
import 'package:sayaraty/core/widgets/custom_text_field.dart';
import '../../../core/theme/app_colors.dart';




// class AddressDetailsBottomSheet extends StatelessWidget {
//   const AddressDetailsBottomSheet({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final locationController = Get.put(LocationController());
//     return Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             SizedBox(height: 21),
//
//             /// Location Input
//             CustomTextField(
//               controller: locationController.addressController,
//               // validator: (value) {
//               //   if (value!.isEmpty) {
//               //     return 'Please enter your location';
//               //   }
//               // },
//             ),
//             SizedBox(height: 12),
//
//             /// Other Address Fields
//             CustomTextField(
//               hintText: AppKeys.street.tr,
//               controller: locationController.streetController,
//             ),
//             SizedBox(height: 12),
//             CustomTextFormField(
//               hintText: AppKeys.theBuilding.tr,
//               controller: locationController.buildingController,
//               fillColor: AppColors.babyBlue,
//             ),
//             SizedBox(height: 12),
//             CustomTextFormField(
//               hintText: AppKeys.floor.tr,
//               fillColor: AppColors.babyBlue,
//               controller: locationController.floorController,
//             ),
//             SizedBox(height: 12),
//             CustomTextFormField(
//                 hintText: AppKeys.theApartment.tr,
//                 controller: locationController.apartmentController,
//                 fillColor: AppColors.babyBlue),
//             SizedBox(height: 12),
//
//             /// Destination Selection
//             DestinationSelection(),
//             SizedBox(height: 21),
//
//             /// Save Button
//             Align(
//               alignment: Alignment.center,
//               child: Obx(() {
//                 return CustomButton(
//                   text: AppKeys.saveAddress.tr,
//                   isEnabled: !locationController.isLoadingUpdate.value,
//                   onPressed: () async {
//                     await locationController.updateAddress();
//                     showCustomBottomSheet(
//                         context,
//                         Column(
//                           children: [
//                             Image.asset(
//                               Assets.imagesAccessLocationDone,
//                               height: 200,
//                               width: 180,
//                             ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             Text(
//                               AppKeys.thankYou.tr,
//                               style: AppFonts.heading3.copyWith(fontSize: 18),
//                             ),
//                             SizedBox(
//                               height: 4,
//                             ),
//                             Text(
//                               AppKeys.weAddedYourAddress.tr,
//                               style: AppFonts.heading3.copyWith(
//                                 fontSize: 18,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             CustomButton(
//                               text: AppKeys.addressDirectory.tr,
//                               onPressed: () {
//                                 Get.back();
//                                 Get.back();
//                               },
//                             )
//                           ],
//                         ));
//                   },
//                 );
//               }),
//             ),
//             SizedBox(height: 12),
//           ],
//         ),
//       ),
//     );
//   }
// }




