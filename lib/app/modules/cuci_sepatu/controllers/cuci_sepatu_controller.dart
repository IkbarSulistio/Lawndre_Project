// controllers/cuci_gorden_controller.dart

import 'package:get/get.dart';

class CuciSepatuController extends GetxController {
  // Define service prices
  final int price213 = 123;
  final int price243 = 150;
  final int price274 = 180;

  // Define observable quantities and totals
  var quantity213 = 0.obs;
  var quantity243 = 0.obs;
  var quantity274 = 0.obs;
  
  // Calculate total for each service
  int get total213 => quantity213.value * price213;
  int get total243 => quantity243.value * price243;
  int get total274 => quantity274.value * price274;

  // Calculate grand totalA
  int get grandTotal => total213 + total243 + total274;

  // Methods to increment and decrement quantities
  void increment213() => quantity213.value++;
  void decrement213() {
    if (quantity213.value > 0) quantity213.value--;
  }

  void increment243() => quantity243.value++;
  void decrement243() {
    if (quantity243.value > 0) quantity243.value--;
  }

  void increment274() => quantity274.value++;
  void decrement274() {
    if (quantity274.value > 0) quantity274.value--;
  }
}
