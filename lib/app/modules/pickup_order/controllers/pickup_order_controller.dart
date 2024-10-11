import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class PickupOrderController extends GetxController {
  var selectedAddress = ''.obs;
  var selectedLatLng = LatLng(-7.978469, 112.561741).obs; // Default location (UMM)

  // Function to get the address from LatLng
  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      selectedAddress.value = "${place.street}, ${place.locality}, ${place.country}";
    } catch (e) {
      selectedAddress.value = "No address available";
    }
  }

  // Function called when user selects location on map
  void selectLocation(LatLng position) {
    selectedLatLng.value = position;
    getAddressFromLatLng(position);
  }
}
