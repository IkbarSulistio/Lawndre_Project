import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';  
import '../controllers/webview_controller.dart';

class WebviewView extends StatelessWidget {
  const WebviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WebviewController>();

    // Initialize the WebViewController
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(controller.url.value)); // Load the initial URL

    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview'),
      ),
      body: Obx(() {
        // Return WebViewWidget with updated URL when the observable changes
        return WebViewWidget(
          controller: webViewController
            ..loadRequest(Uri.parse(controller.url.value)), // Load updated URL
        );
      }),
    );
  }
}
 