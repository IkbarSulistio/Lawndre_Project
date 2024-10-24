// views/feedback_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/feedback_rating_controller.dart';
import '../widgets/star_rating.dart';

class FeedbackRatingView extends StatelessWidget {
  const FeedbackRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackRatingController controller = Get.put(FeedbackRatingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback & Rating',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            const Text('Rating', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Obx(
              () => StarRating(
                rating: controller.rating.value,
                onRatingSelected: (value) => controller.setRating(value),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Feedback', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your feedback here',
              ),
              onChanged: (text) => controller.setFeedbackText(text),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: controller.submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
