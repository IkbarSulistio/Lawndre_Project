import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/selimut_carpet_controller.dart';
import '../widgets/price_option.dart';

class SelimutCarpetView extends StatelessWidget {
  const SelimutCarpetView({super.key});

  @override
  Widget build(BuildContext context) {
    final SelimutCarpetController controller = Get.put(SelimutCarpetController());

    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1), // Background color
      appBar: AppBar(
        title: const Text('Cuci Selimut dan Karpet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih Sesuai Ukuran:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  PriceOption(
                    dimensions: controller.getDimension(0), // Pass dimensions instead of weight
                    regularPrice: controller.getRegularPrice(0),
                    expressPrice: controller.getExpressPrice(0),
                  ),
                  const SizedBox(height: 12),
                  PriceOption(
                    dimensions: controller.getDimension(1),
                    regularPrice: controller.getRegularPrice(1),
                    expressPrice: controller.getExpressPrice(1),
                  ),
                  const SizedBox(height: 12),
                  PriceOption(
                    dimensions: controller.getDimension(2),
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
