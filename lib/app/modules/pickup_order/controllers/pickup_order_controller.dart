import 'package:get/get.dart';

class PickupOrderController extends GetxController {
  // Properti dinamis untuk menyimpan data
  var distance = 7.0.obs; // Contoh jarak pickup (default 7 km)
  var weight = 9.6.obs; // Contoh berat barang (default 9.6 kg)
  var payableAmount = 89000.obs; // Harga yang harus dibayar (Rp89.000)

  // Fungsi untuk memperbarui jarak
  void updateDistance(double newDistance) {
    distance.value = newDistance;
  }

  // Fungsi untuk memperbarui berat barang
  void updateWeight(double newWeight) {
    weight.value = newWeight;
  }

  // Fungsi untuk memperbarui jumlah yang harus dibayar
  void updatePayableAmount(int newAmount) {
    payableAmount.value = newAmount;
  }

  // Fungsi untuk navigasi ke Nota Pemesanan View
  void goToNotaPemesanan() {
    Get.toNamed('/nota-pemesanan'); // Pastikan rute ini didefinisikan di GetX route
  }

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi logika tambahan di sini (misalnya, fetch data awal)
    print("PickupOrderController initialized");
  }

  @override
  void onClose() {
    super.onClose();
    // Cleanup jika dibutuhkan
    print("PickupOrderController disposed");
  }
}
