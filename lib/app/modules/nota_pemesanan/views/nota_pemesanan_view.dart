import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nota_pemesanan_controller.dart';

class NotaPemesananView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotaPemesananController controller = Get.put(NotaPemesananController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Rincian Pesanan'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Pesanan
            Text('Selesai', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // Informasi User
            Row(
              children: [
                Icon(Icons.person, size: 40),
                SizedBox(width: 10),
                Obx(() => Text(
                  controller.customerName.value.isNotEmpty
                      ? controller.customerName.value
                      : 'Nama Pengguna',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                Spacer(),
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 10),
                Icon(Icons.message, color: Colors.green),
              ],
            ),
            Obx(() => Text('⭐ ${controller.rating.value}', style: TextStyle(fontSize: 14))),
            Divider(color: Colors.green, thickness: 1),
            SizedBox(height: 10),

            // Pesanan
            Text('Pesanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
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
                      Text('$itemQuantity pcs', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 20),
                      Text(itemName, style: TextStyle(fontSize: 14)),
                      Spacer(),
                      Image.asset(imagePath, width: 40, height: 40),
                    ],
                  ),
                );
              }).toList(),
            )),
            Divider(color: Colors.green, thickness: 1),
            SizedBox(height: 10),

            // Subtotal Pesanan
            Obx(() => Text('Subtotal Pesanan (${controller.totalWeight.value} kg)', style: TextStyle(fontSize: 16))),
            Obx(() => Text('Rp${controller.totalPrice.value}', style: TextStyle(fontSize: 16))),
            SizedBox(height: 10),

            // Detail tambahan
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Voucher Diskon', style: TextStyle(fontSize: 14)),
                Text('-Rp${controller.discount.value}', style: TextStyle(fontSize: 14)),
              ],
            )),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Biaya Pengemasan', style: TextStyle(fontSize: 14)),
                Text('Rp${controller.packagingFee.value}', style: TextStyle(fontSize: 14)),
              ],
            )),
            SizedBox(height: 10),

            
          ],
        ),
      ),
    );
  }
}
