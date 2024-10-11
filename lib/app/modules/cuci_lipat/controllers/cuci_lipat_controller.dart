// controllers/weight_selection_controller.dart

import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/schedule_pickup/views/schedule_pickup_view.dart';

class CuciLipatController extends GetxController {
  var regularPrices = <int>[123, 223, 323].obs;
  var expressPrices = <int>[150, 250, 350].obs;

  int getRegularPrice(int index) => regularPrices[index];
  int getExpressPrice(int index) => expressPrices[index];
  
  // Functions to handle navigation
  void goToRegularPage(int weight) {
    Get.to(SchedulePickupView(), arguments: weight);
  }

  void goToExpressPage(int weight) {
    Get.to(SchedulePickupView(), arguments: weight);
  }
}
