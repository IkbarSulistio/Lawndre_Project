// widgets/service_card.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final int price;
  final RxInt quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  ServiceCard({
    required this.title,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Total : Rp. ${quantity.value * price}", style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onDecrement,
                  icon: Icon(Icons.remove, color: Color.fromRGBO(55, 94, 97, 1)),
                ),
                Text(quantity.value.toString(), style: TextStyle(fontSize: 16)),
                IconButton(
                  onPressed: onIncrement,
                  icon: Icon(Icons.add, color: Color.fromRGBO(55, 94, 97, 1)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
