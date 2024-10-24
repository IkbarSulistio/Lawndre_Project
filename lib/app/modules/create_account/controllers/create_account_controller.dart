import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  // Track if the password is visible
  var isPasswordVisible = false.obs;

  // Inisialisasi FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Fungsi untuk membuat akun menggunakan Firebase
  Future<void> createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Cek apakah email dan password sudah diisi
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;

      // Membuat akun dengan Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Berhasil membuat akun
      Get.snackbar("Success", "Account created successfully",
          snackPosition: SnackPosition.BOTTOM);

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;

      // Menangani error dari Firebase Authentication
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already in use. Please use a different one.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak. Please choose a stronger password.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is invalid. Please check again.';
      } else {
        errorMessage = 'Failed to create account. Please try again.';
      }

      Get.snackbar("Error", errorMessage,
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }
}
