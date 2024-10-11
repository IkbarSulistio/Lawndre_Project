import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/pickup_order_controller.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PickupOrderController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        centerTitle: true,
      ),
      body: Obx(
        () => GoogleMap(
          initialCameraPosition: CameraPosition(
            target: controller.selectedLatLng.value, // Default location
            zoom: 14.0,
          ),
          onTap: (LatLng position) {
            controller.selectLocation(position);  // Update selected location
          },
          markers: {
            Marker(
              markerId: MarkerId("selected-location"),
              position: controller.selectedLatLng.value,
            ),
          },
        ),
      ),
    );
  }
}
