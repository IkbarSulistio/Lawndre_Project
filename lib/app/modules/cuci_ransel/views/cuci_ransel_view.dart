// cuci_lipat_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/schedule_pickup/views/schedule_pickup_view.dart';
import '../controllers/cuci_ransel_controller.dart';

class CuciRanselView extends StatelessWidget {
  const CuciRanselView({super.key});

  @override
  Widget build(BuildContext context) {
    final CuciRanselController controller =
        Get.put(CuciRanselController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuci Ransel"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildItemBox("assets/images/cuci_ransel.png", "Ransel", controller),
            const SizedBox(height: 20),
            _buildTotalItems(controller),
            const SizedBox(height: 20),
            const Spacer(), // This will push the button to the bottom
            ElevatedButton(
              onPressed: () {
                Get.to(SchedulePickupView()); // Navigate to your desired view
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 70),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Refined Item box widget with image, text, and border
  Widget _buildItemBox(
      String? imagePath, String label, CuciRanselController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300), // Border color
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (imagePath != null) ...[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(imagePath,
                          fit: BoxFit.contain), // Item image
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => controller.decrement('ransel'),
                  color: const Color.fromRGBO(55, 94, 97, 1),
                ),
                Obx(() {
                  // Observe the count dynamically for "ransel"
                  return Text("${controller.ranselCount.value}");
                }),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => controller.increment('ransel'),
                  color: const Color.fromRGBO(55, 94, 97, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Total items widget with styling
  Widget _buildTotalItems(CuciRanselController controller) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(227, 242, 241, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Total Items:", style: TextStyle(fontSize: 16)),
          Obx(() => Text("${controller.totalItems}",
              style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
