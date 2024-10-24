// views/cuci_gorden_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/schedule_pickup/views/schedule_pickup_view.dart';
import '../controllers/cuci_gorden_controller.dart';
import '../widgets/service_card.dart';

class CuciGordenView extends StatelessWidget {
  const CuciGordenView({super.key});

  @override
  Widget build(BuildContext context) {
    final CuciGordenController controller = Get.put(CuciGordenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuci Gorden', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih Layanan:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            ServiceCard(
              title: "Gorden (213 cm)",
              price: controller.price213,
              quantity: controller.quantity213,
              onIncrement: controller.increment213,
              onDecrement: controller.decrement213,
            ),
            ServiceCard(
              title: "Gorden (243 cm)",
              price: controller.price243,
              quantity: controller.quantity243,
              onIncrement: controller.increment243,
              onDecrement: controller.decrement243,
            ),
            ServiceCard(
              title: "Gorden (274 cm)",
              price: controller.price274,
              quantity: controller.quantity274,
              onIncrement: controller.increment274,
              onDecrement: controller.decrement274,
            ),
            const SizedBox(height: 20),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(227, 242, 241, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Grand Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Text('Rp. ${controller.grandTotal}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.to(SchedulePickupView()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
