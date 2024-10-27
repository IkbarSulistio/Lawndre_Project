// edit_profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/model/profile_model.dart';

class EditProfileController extends GetxController {
  // Initialize TextEditingControllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  var profile = ProfileModel(
    userName: 'User Name',
    email: 'user@example.com',
    phoneNumber: '+1234567890',
  ).obs;

  final ImagePicker _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      final docSnapshot =
          await _firestore.collection('users').doc(user.uid).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        profile.update((val) {
          val!.userName = data['userName'] ?? '';
          val.email = data['email'] ?? '';
          val.phoneNumber = data['phoneNumber'] ?? '';
          val.profileImage = data['profileImage'] ?? '';
        });

        userNameController.text = profile.value.userName;
        emailController.text = profile.value.email;
        phoneNumberController.text = profile.value.phoneNumber;
      }
    }
  }

  void updateProfileImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profile.update((val) {
          val!.profileImage = pickedFile.path;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void updateUserName(String name) {
    profile.update((val) {
      val!.userName = name;
    });
  }

  void updateEmail(String email) {
    profile.update((val) {
      val!.email = email;
    });
  }

  void updatePhoneNumber(String phone) {
    profile.update((val) {
      val!.phoneNumber = phone;
    });
  }

  Future<void> saveUserProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'userName': profile.value.userName,
        'email': profile.value.email,
        'phoneNumber': profile.value.phoneNumber,
        'profileImage': profile.value.profileImage,
      });
    }
  }

  Future<void> deleteUserData() async {
    try {
      final userId = _auth.currentUser?.uid; // Get current user ID
      if (userId != null) {

        final userDocRef = _firestore.collection('users').doc(userId);

        // Delete the document in Firestore
        await userDocRef.delete();

      } else {
        Get.snackbar("Error", "No user found to delete data",
            snackPosition: SnackPosition.BOTTOM,);
      }
    } catch (e) {

      Get.snackbar("Error", "Failed to delete user data",
          snackPosition: SnackPosition.BOTTOM);
      print("Error deleting user data: $e");
    }
  }
}
