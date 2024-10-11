import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/login/views/login_view.dart';
import '../controllers/create_account_controller.dart';
import '../views/widgets/custom_button.dart';
import '../views/widgets/custom_text_field.dart';

class CreateAccountView extends StatelessWidget {
  final CreateAccountController controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(  
            child: Text(
              'Create an account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
            SizedBox(height: 20),
            Text('Email'),
            CustomTextField(
              controller: controller.emailController,
              hintText: 'youremail@gmail.com',
            ),
            SizedBox(height: 20),
            Text('Password'),
            Obx(() => CustomTextField(
              controller: controller.passwordController,
              hintText: 'Enter your password',
              obscureText: !controller.isPasswordVisible.value, // Toggle visibility
              suffixIcon: IconButton(
                icon: Icon(controller.isPasswordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: () {
                  controller.togglePasswordVisibility(); // Toggle the password visibility
                },
              ),
            )),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Logic for 'Forgot?'
                },
                child: Text('Forgot?', style: TextStyle(color: Color.fromRGBO(55, 94, 97, 1))),
              ),
            ),
            SizedBox(height: 20),
            Obx(() => CustomButton(
              text: controller.isLoading.value ? 'Creating...' : 'Create account',
              onPressed: controller.isLoading.value
                  ? null // Disable button while loading
                  : () {
                      controller.createAccount(); // Call account creation logic
                    },
            )),
            SizedBox(height: 10),
            CustomButton(
              text: 'Continue with Google',
              onPressed: () {
                // Logic for Google login
              },
              backgroundColor: Color.fromRGBO(227, 242, 241, 1),
              textColor: Colors.black,
              icon: Image.asset('assets/images/google.png', height: 24), // Optional icon
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  // Logic for navigating to login
                  Get.off(LoginView()); // Adjust the route name as needed
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already Have An Account ? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(color: Color.fromRGBO(55, 94, 97, 1), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
