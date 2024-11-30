import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/nota_pemesanan/views/nota_pemesanan_view.dart';
import '../controllers/location_controller.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.put(LocationController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Location Finder',
          style: TextStyle(color: Colors.white), // Header text color
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(55, 94, 97, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
                  onChanged: (value) => controller.searchQuery.value = value,
                  decoration: InputDecoration(
                    labelText: 'Search Location',
                    labelStyle: TextStyle(color: Color.fromRGBO(55, 94, 97, 1)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(55, 94, 97, 1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(55, 94, 97, 1)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Color.fromRGBO(55, 94, 97, 1)),
                      onPressed: () =>
                          controller.searchLocation(controller.searchQuery.value),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Display Coordinates and Address
                Obx(() => Text(
                      'Latitude: ${controller.latitude.value}',
                      style: TextStyle(fontSize: 16),
                    )),
                Obx(() => Text(
                      'Longitude: ${controller.longitude.value}',
                      style: TextStyle(fontSize: 16),
                    )),
                Obx(() => Text(
                      'Address: ${controller.address.value}',
                      style: TextStyle(fontSize: 16),
                    )),
                const SizedBox(height: 20),
                
                // Buttons positioned near the header
                ElevatedButton(
                  onPressed: controller.getCurrentLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(55, 94, 97, 1),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  ),
                  child: Text(
                    'Get Current Location',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.openGoogleMaps,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(55, 94, 97, 1),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                  ),
                  child: Text(
                    'Open in Google Maps',
                    style: TextStyle(color: Colors.white), // Button text color
                  ),
                ),
              ],
            ),
          ),
          // Spacer to push the "Pick Up Now" button to the bottom
          const Spacer(),

          // "Pick Up Now" Button at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => NotaPemesananView()); // Navigate to NotaPemesananView
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(55, 94, 97, 1),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
              child: Text(
                'Pick Up Now',
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
