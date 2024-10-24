import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/profile/views/bottom_nav_bar_view.dart';

import '../controllers/history_controller.dart';
import '../widgets/order_item.dart';


class HistoryView extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());

  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Riwayat Pesanan',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.orderHistory.length,
            itemBuilder: (context, index) {
              var order = controller.orderHistory[index];
              return OrderItemWidget(
                orderId: order['orderId'] as String,
                date: order['date'] as String,
                amount: order['amount'] as String,
                isCompleted: order['status'] as bool,
              );

            },
          );
        }),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}