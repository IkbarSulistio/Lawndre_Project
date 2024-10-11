import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/selimut_carpet_controller.dart';

class PriceOption extends StatelessWidget {
  final String dimensions; // Change from int to String
  final int regularPrice;
  final int expressPrice;

  const PriceOption({
    super.key, 
    required this.dimensions, // Update variable name
    required this.regularPrice,
    required this.expressPrice,
  });

  @override
  Widget build(BuildContext context) {
    final SelimutCarpetController controller = Get.put(SelimutCarpetController());

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
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
          // Display the dimensions instead of weight
          Text(dimensions, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPriceButton(
                label: 'Regular',
                price: regularPrice,
                onPressed: () => controller.goToRegularPage(dimensions),
              ),
              const SizedBox(height: 8),
              _buildPriceButton(
                label: 'Express',
                price: expressPrice,
                onPressed: () => controller.goToExpressPage(dimensions),
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 8),
          Text('Rp.$price', style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
