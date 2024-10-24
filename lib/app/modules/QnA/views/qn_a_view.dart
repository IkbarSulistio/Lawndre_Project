import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/qn_a_controller.dart';

class QnAView extends StatelessWidget {
  final QnAController qnaController = Get.put(QnAController());

  QnAView({super.key}); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QnA (Question and Answer)'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the body
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories or topics:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Outer container for padding around the dropdown
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0),
                child: Container(
                  width: double
                      .infinity, 
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue,
                        width: 1.5), 
                    borderRadius: BorderRadius.circular(16.0), // Rounded corners
                  ),
                  child: Obx(() {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: qnaController.selectedCategory.value.isEmpty
                            ? null
                            : qnaController.selectedCategory.value,
                        hint: Container(
                          padding: const EdgeInsets.only(
                              left: 12.0), // Align hint text to start
                          child: const Text('Select a category'),
                        ),
                        onChanged: (newValue) {
                          qnaController.selectedCategory.value = newValue!;
                        },
                        items: qnaController.categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0), // Align dropdown item text
                              child: Text(category),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              // Text area for the question/answer
              const Text(
                'Enter your question:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Outer container for padding around the TextField
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0), // Padding outside the TextField
                child: SizedBox(
                  width: double
                      .infinity, // Set the width to fill the available space
                  child: TextField(
                    controller: qnaController.textController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type your question here',
                      contentPadding: EdgeInsets.only(
                          left: 12.0,
                          top: 12.0), // Align hint text to start
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Spacer(),
              SizedBox(
                width: double.infinity, // Make the button full width
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0), // Padding for the button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    ),
                    onPressed: () 
                    // => Get.off(HomePageView()),
                    {
                      if (qnaController.selectedCategory.value.isNotEmpty) {
                        // Process the question/answer here
                        print(
                            'Selected Category: ${qnaController.selectedCategory.value}');
                        // Here, you could add logic to save or send the input.
                      } else {
                        Get.snackbar('Error', 'Please select a category',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
