// cuci_lipat_controller.dart
import 'package:get/get.dart';

class SetrikaItemController extends GetxController {
  // Items count
  var kemejaCount = 1.obs;
  var kaosCount = 1.obs;
  var celanaCount = 1.obs;
  var jaketCount = 1.obs;
  var lainnyaCount = 1.obs;

  // Total items count
  int get totalItems => kemejaCount.value + kaosCount.value + celanaCount.value + jaketCount.value + lainnyaCount.value;

  // Increment and decrement functions
  void increment(String item) {
    switch (item) {
      case 'kemeja':
        kemejaCount++;
        break;
      case 'kaos':
        kaosCount++;
        break;
      case 'celana':
        celanaCount++;
        break;
      case 'jaket':
        jaketCount++;
        break;
      case 'lainnya':
        lainnyaCount++;
        break;
    }
  }

  void decrement(String item) {
    switch (item) {
      case 'kemeja':
        if (kemejaCount.value > 0) kemejaCount--;
        break;
      case 'kaos':
        if (kaosCount.value > 0) kaosCount--;
        break;
      case 'celana':
        if (celanaCount.value > 0) celanaCount--;
        break;
      case 'jaket':
        if (jaketCount.value > 0) jaketCount--;
        break;
      case 'lainnya':
        if (lainnyaCount.value > 0) lainnyaCount--;
        break;
    }
  }
}
