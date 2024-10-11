// controllers/support_controller.dart

import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/QnA/views/qn_a_view.dart';
import 'package:lawndre_project/app/modules/feedback_rating/views/feedback_rating_view.dart';

class CustomerSupportController extends GetxController {
  void goToFAQ() {
    Get.toNamed('/faq');
  }

  void goToQnA() {
    Get.to(QnAView());
  }

  void goToEmailSupport() {
    Get.toNamed('/email-support');
  }

  void goToCallCenter() {
    Get.toNamed('/call-center');
  }

  void goToFeedback() {
    Get.to(FeedbackRatingView());
  }
}
