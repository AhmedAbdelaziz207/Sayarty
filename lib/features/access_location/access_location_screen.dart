import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import '../../core/widgets/loader.dart';

class AccessLocationScreen extends StatefulWidget {
  const AccessLocationScreen({super.key});

  @override
  State<AccessLocationScreen> createState() => _AccessLocationScreenState();
}

class _AccessLocationScreenState extends State<AccessLocationScreen> {
  LatLng? initialLatLng;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    setupInitialLocation();
  }

  Future<void> setupInitialLocation() async {
    final isEdit = false;

    if (isEdit) {
      // initialLatLng = LatLng(
      //   double.tryParse(address['lat'].toString()) ?? 0.0,
      //   double.tryParse(address['lng'].toString()) ?? 0.0,
      // );
    }

    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Scaffold(body: Center(child: AppLoader()));
    }

    return Scaffold(
      body: PlacePicker(
        mapsBaseUrl: "https://maps.googleapis.com/maps/api/",
        usePinPointingSearch: true,
        apiKey: 'AIzaSyC86lWEI5fMklifz509ZmHUyGpj1AuplUA',
        initialLocation: initialLatLng!,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onPlacePicked: (LocationResult result) {},
        onMapCreated: (controller) {},
        searchInputConfig: const SearchInputConfig(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          autofocus: false,
        ),
        searchInputDecorationConfig: SearchInputDecorationConfig(
          hintText: "Search for a building, street or ...",
        ),
        selectedPlaceWidgetBuilder: (ctx, state, result) {
          return SizedBox();
        },
        autocompletePlacesSearchRadius: 150,
        enableNearbyPlaces: false,
        showSearchInput: true,
      ),
    );
  }
}
