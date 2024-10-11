import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';
import '../widgets/order_item.dart';


class HistoryView extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFE3F2F1),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Transaksi',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
              ),
      ],
      )
    );
  }
}