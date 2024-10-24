import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/selimut_carpet/views/selimut_carpet_view.dart';
import '../controllers/selimut_carpet_item_controller.dart';

class SelimutCarpetItemView extends StatelessWidget {
  final SelimutCarpetItemController cuciSelimutKarpetController = Get.put(SelimutCarpetItemController());

  SelimutCarpetItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cuci Selimut dan Karpet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Pilih Layanan:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16), // Add space between the title and list view
            Expanded(
              child: Obx(() {
                return ListView(
                  children: [
                    // Generate list of services dynamically
                    ...cuciSelimutKarpetController.items.map((service) {
                      int index =
                          cuciSelimutKarpetController.items.indexOf(service);
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Service name
                              Expanded(
                                child: Text(
                                  service.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Value display
                              Row(
                                children: [
                                  // Decrease button
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    color: const Color.fromRGBO(55, 94, 97, 1),
                                    onPressed: () => cuciSelimutKarpetController
                                        .decreaseValue(index),
                                  ),
                                  // Value text
                                  Obx(() => Text(
                                        '${service.value.value}', // Access value using .value
                                        style: const TextStyle(fontSize: 18),
                                      )),
                                  // Increase button
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    color: const Color.fromRGBO(55, 94, 97, 1),
                                    onPressed: () => cuciSelimutKarpetController
                                        .increaseValue(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    // Total items display directly below the ListView items
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(227, 242, 241, 1), // Change color as needed
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Item:',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Obx(() => Text(
                                '${cuciSelimutKarpetController.totalItems}', // Display total items
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(
              width: double.infinity, // Make the button full-width
              child: ElevatedButton(
                onPressed: () => Get.to(const SelimutCarpetView()),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16), // Increase button height
                  backgroundColor: const Color.fromRGBO(55, 94, 97, 1), // Button color
                  foregroundColor: Colors.white, // Force the text color to white
                  textStyle: const TextStyle(fontSize: 18), // Button text style
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
