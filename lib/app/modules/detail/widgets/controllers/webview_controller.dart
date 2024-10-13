import 'package:get/get.dart';

class WebviewController extends GetxController {
  // Observable URL
  var url = ''.obs;

  // Update the URL
  void updateUrl(String newUrl) {
    url.value = newUrl;
  }

  // Load the initial URL if necessary (optional)
  void loadInitialUrl(String initialUrl) {
    url.value = initialUrl;
  }
}
