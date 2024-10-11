import 'package:get/get.dart';

import '../controllers/qn_a_controller.dart';

class QnABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QnAController>(
      () => QnAController(),
    );
  }
}
