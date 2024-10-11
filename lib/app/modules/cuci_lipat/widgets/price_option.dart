// widgets/price_option.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cuci_lipat_controller.dart';

class PriceOption extends StatelessWidget {
  final int weight;
  final int regularPrice;
  final int expressPrice;

  PriceOption({
    required this.weight,
    required this.regularPrice,
    required this.expressPrice,
  });

  @override
  Widget build(BuildContext context) {
    final CuciLipatController controller = Get.find<CuciLipatController>();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$weight Kg', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPriceButton(
                label: 'Regular',
                price: regularPrice,
                onPressed: () => controller.goToRegularPage(weight),
              ),
              SizedBox(height: 8),
              _buildPriceButton(
                label: 'Express',
                price: expressPrice,
                onPressed: () => controller.goToExpressPage(weight),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceButton({required String label, required int price, required VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        backgroundColor: Color.fromRGBO(55, 94, 97, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          SizedBox(width: 8),
          Text('Rp.$price', style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
