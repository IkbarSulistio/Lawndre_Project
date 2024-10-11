import 'package:get/get.dart';

class CuciRanselController extends GetxController {
  // Item counts for ransel
  var ranselCount = 1.obs; // Rename to match the view's usage of "ransel"

  // Total items count
  int get totalItems => ranselCount.value; // Adjust this if managing multiple items

  // Increment and decrement functions for ransel
  void increment(String item) {
    switch (item) {
      case 'ransel': // Handle "ransel" correctly
        ranselCount++;
        break;
    }
  }

  void decrement(String item) {
    switch (item) {
      case 'ransel': // Handle "ransel" correctly
        if (ranselCount.value > 0) ranselCount--;
        break;
    }
  }
}
