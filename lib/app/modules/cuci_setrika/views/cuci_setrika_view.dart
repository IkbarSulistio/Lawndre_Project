// views/weight_selection_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cuci_setrika_controller.dart';
import '../widgets/price_option.dart';

class CuciSetrikaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CuciSetrikaController controller = Get.put(CuciSetrikaController());

    return Scaffold(
      backgroundColor: Color(0xFFE0F2F1), // Background color
      appBar: AppBar(
        title: Text('Cuci Setrika', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Berat:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  PriceOption(
                    weight: 3,
                    regularPrice: controller.getRegularPrice(0),
                    expressPrice: controller.getExpressPrice(0),
                  ),
                  SizedBox(height: 12),
                  PriceOption(
                    weight: 5,
                    regularPrice: controller.getRegularPrice(1),
                    expressPrice: controller.getExpressPrice(1),
                  ),
                  SizedBox(height: 12),
                  PriceOption(
                    weight: 7,
                    regularPrice: controller.getRegularPrice(2),
                    expressPrice: controller.getExpressPrice(2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
