import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/home_page/views/home_page_view.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CouponController()); // Initialize the controller

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text(
          'Special Offers',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your Coupon',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildCouponCard(controller, 0),
            const SizedBox(height: 16),
            _buildCouponCard(controller, 1),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await controller.playConfirmSound(); // Play sound
                      Get.off(HomePageView()); // Navigate to home page
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _showAudioSourceDialog(context, controller);
                    },
                    child: const Text('Change Audio Source'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCard(CouponController controller, int index) {
    return GestureDetector(
      onTap: () => controller.selectCoupon(index),
      child: Obx(() {
        return Container(
          decoration: BoxDecoration(
            color: controller.selectedCoupon.value == index
                ? Colors.lightBlue[200]
                : Colors.lightBlue[100],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '25% OFF',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Valid until : dd/mm/yyyy',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Minimum order of Rp20.000',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Radio(
                value: index,
                groupValue: controller.selectedCoupon.value,
                onChanged: (int? value) => controller.selectCoupon(value!),
                activeColor: Colors.black,
              ),
            ],
          ),
        );
      }),
    );
  }

  void _showAudioSourceDialog(BuildContext context, CouponController controller) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController textController = TextEditingController();
        return AlertDialog(
          title: const Text('Change Audio Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Enter Audio URL',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  controller.setAudioSource(textController.text);
                  Navigator.of(context).pop();
                },
                child: const Text('Set URL'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  controller.setAudioSource('audio/simple-notification-152054.mp3'); // Set default
                  Navigator.of(context).pop();
                },
                child: const Text('Set Default'),
              ),
            ],
          ),
        );
      },
    );
  }
}
