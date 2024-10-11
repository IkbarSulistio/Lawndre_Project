import 'package:get/get.dart';

class NotaPemesananController extends GetxController {
  // Sample data for demonstration
  var customerName = "User_1945".obs;
  var rating = 5.0.obs;
  var orderItems = [
    {'item': 'Kemeja', 'qty': 1 },
    {'item': 'Kaos', 'qty': 2},
    {'item': 'Celana', 'qty': 1},
    {'item': 'Jaket', 'qty': 2},
    {'item': 'Lain-nya', 'qty': 1}
  ].obs;

  var totalWeight = 9.6.obs; // in kg
  var totalPrice = 89000.obs; // in IDR
  var discount = 20000.obs; // in IDR
  var packagingFee = 2000.obs; // in IDR
  var orderNumber = "123124674564522".obs;
}
