// controllers/feedback_controller.dart

import 'package:get/get.dart';

class FeedbackRatingController extends GetxController {
  var rating = 0.obs; // Stores the rating from 1 to 5
  var feedbackText = ''.obs; // Stores the user's feedback text

  void setRating(int value) {
    rating.value = value;
  }

  void setFeedbackText(String text) {
    feedbackText.value = text;
  }

  void submitFeedback() {
    if (rating.value == 0) {
      Get.snackbar("Error", "Please select a rating");
      return;
    }

    // Perform the submission logic (e.g., API call or local storage)
    print("Rating: ${rating.value}");
    print("Feedback: ${feedbackText.value}");

    // Show confirmation message
    Get.snackbar("Success", "Feedback submitted successfully!");

    // Optionally, reset the feedback form after submission
    rating.value = 0;
    feedbackText.value = '';
  }
}
