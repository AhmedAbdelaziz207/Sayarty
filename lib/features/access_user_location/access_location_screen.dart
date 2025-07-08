
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/features/access_user_location/widgets/access_location_map.dart';
import 'logic/access_location_cubit.dart';
import 'logic/access_location_state.dart';

class AccessLocationScreen extends StatefulWidget {
  const AccessLocationScreen({super.key});

  @override
  State<AccessLocationScreen> createState() => _AccessLocationScreenState();
}

class _AccessLocationScreenState extends State<AccessLocationScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<AccessLocationCubit, AccessLocationState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: AccessLocationMap(onLocationPicked: () {} ),
              ),
              if (state is AccessLocationLoaded)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<AccessLocationCubit>().sendLocation();
                          },
                          child: Text(
                           "save".tr(),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
