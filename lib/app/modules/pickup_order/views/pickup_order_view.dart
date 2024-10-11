import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/nota_pemesanan/views/nota_pemesanan_view.dart';
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
            // Detail jarak dan waktu pickup
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '(~ 7km)',  // Anda dapat mengganti ini dengan variabel jarak dinamis
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  'Pick Up Now',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Lokasi 1
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Color.fromRGBO(49, 90, 57, 1)),
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

            // Lokasi 2
            Row(
              children: [
                Icon(Icons.location_on, color: Color.fromRGBO(49, 90, 57, 1)),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tegalgondo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Jln. Tegalgondo, RT.9/RW.1', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Berat barang
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(49, 90, 57, 1)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '9.6 kg',  // Anda dapat mengganti ini dengan variabel berat dinamis
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Harga yang harus dibayarkan oleh pelanggan
            Text(
              'Payable by Customer Rp89.000',  // Ganti dengan harga dinamis
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),

            // Tombol untuk memilih lokasi di peta
            ElevatedButton(
              onPressed: () {
                Get.to(() => MapWidget()); // Navigate to map page
              },
              child: Text('Select Location on Map', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 115),
                backgroundColor: Color.fromRGBO(55, 94, 97, 1),
              ),
            ),
            SizedBox(height: 20),

            // Tombol Pickup Now
            ElevatedButton(
              onPressed: () => Get.to(NotaPemesananView()),
              child: Text('PICKUP NOW', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 145),
                backgroundColor: Color.fromRGBO(55, 94, 97, 1),
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
