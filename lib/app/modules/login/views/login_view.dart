import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/cuci_lipat/views/cuci_lipat_view.dart';
import 'package:lawndre_project/app/modules/lipat_item/views/lipat_item_view.dart';
import 'package:lawndre_project/app/modules/profile/views/profile_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Variables to hold email and password input values
    String email = '';
    String password = '';

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 3), // shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Title
              Text(
                'Welcome back',
                style: TextStyle(
                  color: Color.fromRGBO(90, 90, 93, 1),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              Text(
                'Login to your account',
                style: TextStyle(
                  color: Color.fromRGBO(16, 24, 40, 1),
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 32),

              // Email Input
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'youremail@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              SizedBox(height: 16),

              // Password Input
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              SizedBox(height: 24),

              // Login Button
              Positioned(
                top: screenHeight * 0.73,
                left: screenWidth * 0.1,
                child: SizedBox(
                  width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(LipatItemView()),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(55, 94, 97, 1),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
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
              SizedBox(height: 16),

              // Sign Up Button
              TextButton(
                onPressed: () {
                  print('Sign up clicked');
                },
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(
                    color: Color.fromRGBO(55, 97, 88, 1),
                    fontSize: 16,
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
