import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/create_account/views/create_account_view.dart';
import 'package:lawndre_project/app/modules/detail/views/detail_view.dart';
import 'package:lawndre_project/app/modules/login/views/login_view.dart';
import '../controllers/landing_controller.dart';

class LandingView extends StatelessWidget {
  final LandingController controller = Get.put(LandingController());

  LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(252, 252, 253, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.6,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 242, 241, 1),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.82,
            left: screenWidth * 0.1,
            child: SizedBox(
              width: screenWidth * 0.8,
            child: ElevatedButton(
              onPressed: () => Get.to(CreateAccountView()), // Navigate to Create Account
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(55, 94, 97, 1), // Button background color
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Button shape
                ),
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  color: Color.fromRGBO(227, 242, 241, 1), // Button text color
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              ),
            )
          ),

          Positioned(
            top: screenHeight * 0.73,
            left: screenWidth * 0.1,
            child: SizedBox(
              width: screenWidth * 0.8,
            child: ElevatedButton(
              onPressed: () => Get.to(LoginView()),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color.fromRGBO(227, 242, 241, 1),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ),
          
          Positioned(
            top: screenHeight * 0.50,
            left: screenWidth * 0.72,
            child: SizedBox(
              width: screenWidth * 0.25,
            child: ElevatedButton(
              onPressed: () => Get.to(DetailView()), // Add functionality later
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Details',
                style: TextStyle(
                  color: Color.fromRGBO(227, 242, 241, 1),
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
              ),
            ),
          ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.1,
            child: SizedBox(
              width: screenWidth * 0.7,
              height: screenHeight * 0.07,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang di Lawndre',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Solusi Tepat Bagi Yang Tidak Sempat',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 248,
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/images/Castiron1.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
