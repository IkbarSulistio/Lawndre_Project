import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pickup_order_controller.dart';
import '../widgets/map_widget.dart';

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
            Text('(~ 7km) Pick Up Now', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
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
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Obx(() => Text(controller.selectedAddress.value, style: TextStyle(color: Colors.grey))),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => MapWidget()); // Navigate to map page
              },
              child: Text('Select Location on Map'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 2, color: Colors.green),
            Obx(() => Text('${controller.selectedLatLng.value.latitude}, ${controller.selectedLatLng.value.longitude}', style: TextStyle(fontSize: 16))),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Process pickup logic
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
          ],
        ),
      ),
    );
  }
}
