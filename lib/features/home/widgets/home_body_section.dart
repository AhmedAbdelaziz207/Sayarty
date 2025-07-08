import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sayaraty/features/home/widgets/available_services_section.dart';

class HomeBodySection extends StatefulWidget {
  const HomeBodySection({super.key});

  @override
  State<HomeBodySection> createState() => _HomeBodySectionState();
}

class _HomeBodySectionState extends State<HomeBodySection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable services section
              AvailableServicesSection(),
              SizedBox(height: 20),
              // Google Map section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: isWide ? 400.h : 350.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: const GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14.4746,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
