import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/edit_profile/views/edit_profile_view.dart';
import '../views/bottom_nav_bar_view.dart';

class ProfileView extends GetView {

  const ProfileView({Key? key}) : super(key: key);

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
                            SizedBox(height: 4),Text('user@example.com'),
                            SizedBox(height: 4),Text('+1234567890'),
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
                children: const [
                  MenuItem(title: 'Aktivitas', icon: FontAwesomeIcons.chartBar),
                  MenuItem(title: 'Pilih Bahasa', icon: Icons.language),
                  MenuItem(title: 'Promo', icon: Icons.discount),
                  MenuItem(title: 'Pusat Bantuan', icon: Icons.help),
                  MenuItem(title: 'Alamat', icon: FontAwesomeIcons.locationDot),
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

// Menu Item Widget
class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon; // Add icon property

  const MenuItem({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon), // Display the icon on the left
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle menu item tap
        print('Tapped on $title');
      },
    );
  }
}
