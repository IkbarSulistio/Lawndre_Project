import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../views/profile_view.dart';

class BottomNavBarView extends StatelessWidget {
  final BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

  final List<Widget> pages= [
    ProfileView(),
  ];

  BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavBarController.selectedIndex.value,
            onTap: (index) {
              bottomNavBarController.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Histori',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user),
                label: 'Profil',
              ),
            ]
      )
    );
  }
}