// edit_profile_controller.dart
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/model/profile_model.dart';

class EditProfileController extends GetxController {
  var profile = ProfileModel(
    userName: 'User Name',
    email: 'user@example.com',
    phoneNumber: '+1234567890',
  ).obs;

  final ImagePicker _picker = ImagePicker();

  void updateProfileImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profile.update((val) {
          val!.profileImage = pickedFile.path;
        });
      } else {
        print('No image selected.');
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
}