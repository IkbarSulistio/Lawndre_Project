// controllers/support_controller.dart

import 'package:get/get.dart';

class CustomerSupportController extends GetxController {
  void goToFAQ() {
    Get.toNamed('/faq');
  }

  void goToQnA() {
    Get.toNamed('/qna');
  }

  void goToEmailSupport() {
    Get.toNamed('/email-support');
  }

  void goToCallCenter() {
    Get.toNamed('/call-center');
  }

  void goToFeedback() {
    Get.toNamed('/feedback-rating');
  }
}
