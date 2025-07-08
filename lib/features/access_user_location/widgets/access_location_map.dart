import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/theme/app_text_styles.dart';
import '../logic/access_location_cubit.dart';
import '../logic/access_location_state.dart';

class AccessLocationMap extends StatefulWidget {
  const AccessLocationMap({
    super.key,
    required this.onLocationPicked,
  });

  final Function() onLocationPicked;

  @override
  State<AccessLocationMap> createState() => _AccessLocationMapState();
}

class _AccessLocationMapState extends State<AccessLocationMap> {
  static Position? currentPosition;

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  static final CameraPosition myLocationCameraPosition = CameraPosition(
    target: LatLng(
      currentPosition!.latitude,
      currentPosition!.longitude,
    ),
    bearing: 0.0,
    tilt: 0.0,
    zoom: 17.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AccessLocationCubit>().getUserLocation();
    return BlocBuilder<AccessLocationCubit, AccessLocationState>(
      builder: (context, state) {
        if (state is AccessLocationLoading || state is AccessLocationInitial) {
          return const SafeArea(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is AccessLocationError) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(state.message),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AccessLocationCubit>().getUserLocation();
                  },
                  child: Text(
                    "Retry",
                    style: AppTextStyles.button16White,
                  ),
                )
              ],
            ),
          );
        } else {
          currentPosition =
          state is AccessLocationLoaded ? state.location : currentPosition;
          return SafeArea(
            child: GoogleMap(
              initialCameraPosition: myLocationCameraPosition,
              mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: const MarkerId("My Location"),
                  position: LatLng(
                      currentPosition!.latitude, currentPosition!.longitude),
                  draggable: true,
                  onDragEnd: (value) {
                    currentPosition = Position(
                      latitude: value.latitude,
                      longitude: value.longitude,
                      accuracy: 0.0,
                      altitude: 0.0,
                      heading: 0.0,
                      speed: 0.0,
                      speedAccuracy: 0.0,
                      timestamp: DateTime.now(),
                      altitudeAccuracy: currentPosition?.altitudeAccuracy ?? 0,
                      headingAccuracy: currentPosition?.headingAccuracy ?? 0.0,
                    );

                    context.read<AccessLocationCubit>().location =
                        currentPosition!;

                    log(context.read<AccessLocationCubit>().location.latitude.toString());
                    log(context.read<AccessLocationCubit>().location.longitude.toString());

                    setState(() {});
                  },
                )
              },
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              buildingsEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              onMapCreated: (controller) {
                mapController.complete(controller);
              },
            ),
          );
        }
      },
    );
  }
}
