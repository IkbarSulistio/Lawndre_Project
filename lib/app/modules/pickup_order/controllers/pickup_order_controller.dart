// pickup_order_controller.dart
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class PickupOrderController extends GetxController {
  var currentLocation = ''.obs;  // Observable string for the current location
  var weight = 9.6.obs;  // Example weight value
  var price = 89000.obs; // Example price value

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();  // Call this method when the controller is initialized
  }

  // Method to get the current location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();
    updateLocation(position);
  }

  // Update location from the position
  Future<void> updateLocation(Position position) async {
    try {
      // Set location in the controller's observable
      currentLocation.value =
          "Jln. ${position.latitude}, ${position.longitude}";
    } catch (e) {
      currentLocation.value = "Error getting location";
    }
  }
}
