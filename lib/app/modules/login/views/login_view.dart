import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart'; // Import LoginController

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController()); // Inisialisasi LoginController

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: screenWidth * 0.9, // Sesuaikan ukuran dengan layar
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 3), // shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Title
              const Text(
                'Welcome back',
                style: TextStyle(
                  color: Color.fromRGBO(90, 90, 93, 1),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Login to your account',
                style: TextStyle(
                  color: Color.fromRGBO(16, 24, 40, 1),
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 32),

              // Email Input
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'youremail@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),

              // Password Input
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              Obx(() {
                return SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null // Disable button when loading
                        : () {
                            controller.login(); // Call login function
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromRGBO(227, 242, 241, 1),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                  ),
                );
              }),
              const SizedBox(height: 16),

              // Sign Up Button
              TextButton(
                onPressed: () {
                  print('Sign up clicked');
                },
                child: const Text(
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
