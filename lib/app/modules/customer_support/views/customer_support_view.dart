// views/support_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/customer_support_controller.dart';
import '../widgets/support_option.dart';

class CustomerSupportView extends StatelessWidget {
  const CustomerSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerSupportController controller = Get.put(CustomerSupportController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SupportOption(
            icon: Icons.help_outline,
            label: 'FAQ (Frequently Asked Question)',
            onTap: controller.goToFAQ,
          ),
          SupportOption(
            icon: Icons.question_answer,
            label: 'QnA (Question and Answer)',
            onTap: controller.goToQnA,
          ),
          SupportOption(
            icon: Icons.email_outlined,
            label: 'Email Support',
            onTap: controller.goToEmailSupport,
          ),
          SupportOption(
            icon: Icons.phone_in_talk_outlined,
            label: 'Call Center',
            onTap: controller.goToCallCenter,
          ),
          SupportOption(
            icon: Icons.thumb_up_outlined,
            label: 'Feedback & Rating',
            onTap: controller.goToFeedback,
          ),
        ],
      ),
    );
  }
}
