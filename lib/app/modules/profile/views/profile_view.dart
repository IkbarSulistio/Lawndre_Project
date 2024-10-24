import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/edit_profile/views/edit_profile_view.dart';
import '../controllers/profile_controller.dart';
import '../views/bottom_nav_bar_view.dart';
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
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text('user@example.com'),
                            SizedBox(height: 4),
                            Text('+1234567890'),
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

                  // Tambahkan menu untuk Logout
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
