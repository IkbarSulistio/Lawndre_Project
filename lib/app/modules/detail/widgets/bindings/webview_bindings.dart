import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/detail/widgets/controllers/webview_controller.dart';

class WebviewBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(
      () => WebviewController()
    );
  }
}