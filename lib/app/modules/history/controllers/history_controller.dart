import 'package:get/get.dart';

class HistoryController extends GetxController {
  var orderHistory = [
    {"orderId": "123124674564522", "date": "15 Sep 2024", "amount": "Rp89.000", "status": true},
    {"orderId": "123124674564423", "date": "01 Sep 2024", "amount": "Rp49.000", "status": true},
    {"orderId": "123124674564321", "date": "25 Agu 2024", "amount": "Rp60.000", "status": true},
    {"orderId": "123124674564121", "date": "10 Agu 2024", "amount": "Rp40.000", "status": true},
  ].obs; // Observable list untuk menyimpan riwayat transaksi
}