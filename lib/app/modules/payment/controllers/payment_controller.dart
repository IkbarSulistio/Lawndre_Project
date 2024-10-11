// payment_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PaymentController extends GetxController {
  // Function to show a confirmation alert dialog
  void showConfirmationDialog(BuildContext context, String method) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Text('Are you sure you want to pay with $method?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add payment confirmation logic here
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
