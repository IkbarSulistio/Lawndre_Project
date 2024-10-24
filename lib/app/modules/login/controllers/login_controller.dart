import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawndre_project/app/modules/home_page/views/home_page_view.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  final emailController = TextEditingController(); // Email input controller
  final passwordController = TextEditingController(); // Password input controller

  var isLoading = false.obs; // Loading state observable

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Login function
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Cek apakah email dan password sudah diisi
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true; // Set loading true saat login diproses

      // Login pengguna dengan Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Jika login berhasil
      Get.snackbar("Success", "Login successful",
          snackPosition: SnackPosition.BOTTOM);

      // Pindah ke halaman HomePageView setelah login sukses
      Get.offAll(HomePageView());

    } on FirebaseAuthException catch (e) {
      isLoading.value = false; // Set loading false jika gagal login

      // Tangani error login
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is invalid.';
      } else {
        errorMessage = 'Login failed. Please try again.';
      }

      Get.snackbar("Login Error", errorMessage,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } finally {
      isLoading.value = false; // Selalu reset loading ke false
    }
  }
}
