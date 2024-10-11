import 'package:get/get.dart';

import '../controllers/feedback_rating_controller.dart';

class FeedbackRatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackRatingController>(
      () => FeedbackRatingController(),
    );
  }
}
