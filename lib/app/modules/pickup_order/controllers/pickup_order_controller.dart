import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PickupOrderController extends GetxController {
  var deviceInfo = ''.obs;  // Observable for storing device information
  var weight = 9.6.obs;     // Example weight value
  var price = 89000.obs;    // Example price value

  @override
  void onInit() {
    super.onInit();
    getDeviceInfo();  // Call this method when the controller is initialized
  }

  // Method to get device information
  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    // You can extract information like model, version, and more
    deviceInfo.value = "${androidInfo.brand} ${androidInfo.model}";
  }
}
