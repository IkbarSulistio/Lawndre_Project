import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/schedule_pickup/views/schedule_pickup_view.dart';

class SelimutCarpetController extends GetxController {
  var regularPrices = <int>[123, 223, 323].obs;
  var expressPrices = <int>[150, 250, 350].obs;

  // List of dimensions instead of weights
  var dimensions = <String>['80 x 120 CM', '100 x 150 CM', '120 x 180 CM'].obs;

  int getRegularPrice(int index) => regularPrices[index];
  int getExpressPrice(int index) => expressPrices[index];

  String getDimension(int index) => dimensions[index]; // Add this function
  
  // Functions to handle navigation
  void goToRegularPage(String dimensions) {
    Get.to(SchedulePickupView(), arguments: dimensions);
  }

  void goToExpressPage(String dimensions) {
    Get.to(SchedulePickupView(), arguments: dimensions);
  }
}
