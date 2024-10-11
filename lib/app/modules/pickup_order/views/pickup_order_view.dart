import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pickup_order_controller.dart';

class PickupOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PickupOrderController controller = Get.put(PickupOrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup Order'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Jarak dan status pick up
            Text('(~ 7km) Pick Up Now', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            // Lokasi Sengkaling
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.green),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sengkaling', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Perumahan Sengkaling, Jln. Sengkaling Indah', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Lokasi berdasarkan perangkat
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tegalgondo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Obx(() => Text(controller.deviceInfo.value, style: TextStyle(color: Colors.grey))),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 2, color: Colors.green),
            SizedBox(height: 10),
            // Berat item
            Obx(() => Text('${controller.weight.value} kg', style: TextStyle(fontSize: 16))),
            SizedBox(height: 20),
            Divider(thickness: 2, color: Colors.green),
            SizedBox(height: 10),
            // Harga yang harus dibayar
            Obx(() => Text('Payable by Customer Rp${controller.price.value}', style: TextStyle(fontSize: 16))),
            Spacer(),
            // Tombol Pickup Now
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logic untuk proses pickup
                },
                child: Text('PICKUP NOW', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
