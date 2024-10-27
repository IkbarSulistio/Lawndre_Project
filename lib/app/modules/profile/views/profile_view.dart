import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:lawndre_project/app/modules/profile/views/bottom_nav_bar_view.dart';
import '../controllers/profile_controller.dart';
import '../widgets/menu_item.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Obx(() {
                    // Determine if the profile image is a local file or a network image
                    String imagePath = controller.profileImage.value;

                    // Check if imagePath is a valid URL
                    bool isNetworkImage = imagePath.startsWith('http') || imagePath.startsWith('https');

                    return CircleAvatar(
                      radius: 60,
                      backgroundImage: isNetworkImage 
                          ? NetworkImage(imagePath) 
                          : FileImage(File(imagePath)) as ImageProvider, // Use FileImage for local images
                      onBackgroundImageError: (error, stackTrace) {
                        print("Error loading image: $error");
                      },
                    );
                  }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                              controller.userName.value,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(height: 4),
                            Obx(() => Text(controller.email.value)),
                            const SizedBox(height: 4),
                            Obx(() => Text(controller.phoneNumber.value)),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            Get.to(() => EditProfileView());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.green, thickness: 2),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  MenuItem(
                      title: 'Aktivitas',
                      icon: FontAwesomeIcons.chartBar,
                      onTap: () => controller.onMenuItemTap('Aktivitas')),
                  MenuItem(
                      title: 'Pilih Bahasa',
                      icon: Icons.language,
                      onTap: () => controller.onMenuItemTap('Pilih Bahasa')),
                  MenuItem(
                      title: 'Promo',
                      icon: Icons.discount,
                      onTap: () => controller.onMenuItemTap('Promo')),
                  MenuItem(
                      title: 'Pusat Bantuan',
                      icon: Icons.help,
                      onTap: () => controller.onMenuItemTap('Pusat Bantuan')),
                  MenuItem(
                      title: 'Alamat',
                      icon: FontAwesomeIcons.locationDot,
                      onTap: () => controller.onMenuItemTap('Alamat')),
                  MenuItem(
                    title: 'Logout',
                    icon: FontAwesomeIcons.signOutAlt,
                    onTap: () => controller.onMenuItemTap('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarView(),
    );
  }
}
