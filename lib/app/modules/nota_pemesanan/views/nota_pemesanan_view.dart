import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/profile/views/bottom_nav_bar_view.dart';
import '../controllers/nota_pemesanan_controller.dart';

class NotaPemesananView extends StatelessWidget {
  const NotaPemesananView({super.key});

  @override
  Widget build(BuildContext context) {
    final NotaPemesananController controller = Get.put(NotaPemesananController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Pesanan'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Pesanan
            const Text('Selesai', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Informasi User
            Row(
              children: [
                const Icon(Icons.person, size: 40),
                const SizedBox(width: 10),
                Obx(() => Text(
                  controller.customerName.value.isNotEmpty
                      ? controller.customerName.value
                      : 'Nama Pengguna',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                const Spacer(),
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 10),
                const Icon(Icons.message, color: Colors.green),
              ],
            ),
            Obx(() => Text('⭐ ${controller.rating.value}', style: const TextStyle(fontSize: 14))),
            const Divider(color: Colors.green, thickness: 1),
            const SizedBox(height: 10),

            // Pesanan
            const Text('Pesanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Obx(() => Column(
              children: controller.orderItems.map((item) {
                String itemName = item['item'] as String? ?? 'Unknown Item';
                int itemQuantity = item['qty'] as int? ?? 0;

                String imagePath;
                switch (itemName) {
                  case 'Kemeja':
                    imagePath = 'assets/images/kemeja.png';
                    break;
                  case 'Kaos':
                    imagePath = 'assets/images/kaos.png';
                    break;
                  case 'Celana':
                    imagePath = 'assets/images/celana.png';
                    break;
                  case 'Jaket':
                    imagePath = 'assets/images/jaket.png';
                    break;
                  case 'Lain-nya':
                    imagePath = 'assets/images/cuci_lipat.png';
                    break;
                  default:
                    imagePath = 'assets/default.png';
                    break;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text('$itemQuantity pcs', style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 20),
                      Text(itemName, style: const TextStyle(fontSize: 14)),
                      const Spacer(),
                      Image.asset(imagePath, width: 40, height: 40),
                    ],
                  ),
                );
              }).toList(),
            )),
            const Divider(color: Colors.green, thickness: 1),
            const SizedBox(height: 10),

            // Subtotal Pesanan
            Obx(() => Text('Subtotal Pesanan (${controller.totalWeight.value} kg)', style: const TextStyle(fontSize: 16))),
            Obx(() => Text('Rp${controller.totalPrice.value}', style: const TextStyle(fontSize: 16))),
            const SizedBox(height: 10),

            // Detail tambahan
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Voucher Diskon', style: TextStyle(fontSize: 14)),
                Text('-Rp${controller.discount.value}', style: const TextStyle(fontSize: 14)),
              ],
            )),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Biaya Pengemasan', style: TextStyle(fontSize: 14)),
                Text('Rp${controller.packagingFee.value}', style: const TextStyle(fontSize: 14)),
              ],
            )),
            const SizedBox(height: 10),

            
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
