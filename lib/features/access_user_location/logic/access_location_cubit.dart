import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/utils/location_helper.dart';
import 'access_location_state.dart';

class AccessLocationCubit extends Cubit<AccessLocationState> {
  AccessLocationCubit() : super(AccessLocationInitial());
  late Position location;


  Future<void> getUserLocation() async {
    log("get User Location");
    try {
      location = await LocationHelper.getCurrentLocation();
      emit(AccessLocationLoaded(location: location));
      sendLocation();
    } catch (e) {
      emit(AccessLocationError(message: e.toString()));
    }
  }

  void listenToDeviceLocation() {
    LocationHelper.listenToDeviceLocation().listen(
      (status) {
        if (status == ServiceStatus.disabled) {
          emit(AccessLocationError(message: "Location Service Disabled"));
        }
      },
    );
  }

  void sendLocation() {
    log("Send Location");
    try {

    } catch (e) {
      log(e.toString());
    }
  }
}
