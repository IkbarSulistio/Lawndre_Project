import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  // Track if the password is visible
  var isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void createAccount() {
    isLoading.value = true;

    // Simulate a delay for the account creation process
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false; // Reset loading state
      // Implement actual account creation logic here
      Get.snackbar("Success", "Account created successfully",
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
