import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Obx(() {
        final profile = controller.profile.value;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: controller.updateProfileImage, 
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: profile.profileImage != null
                      ? FileImage(File(profile.profileImage!))
                      : const NetworkImage('https://via.placeholder.com/150') as ImageProvider,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: 'User Name'),
                onChanged: controller.updateUserName,
                controller: TextEditingController(text: profile.userName),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: controller.updateEmail,
                controller: TextEditingController(text: profile.email),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                onChanged: controller.updatePhoneNumber,
                controller: TextEditingController(text: profile.phoneNumber),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {    
                  Get.back(); 
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        );
      }),
    );
  }
}