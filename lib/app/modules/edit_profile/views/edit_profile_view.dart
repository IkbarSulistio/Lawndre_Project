import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: controller.updateProfileImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: profile.profileImage != null
                        ? FileImage(File(profile.profileImage!))
                        : const NetworkImage('https://via.placeholder.com/150')
                            as ImageProvider,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'User Name'),
                  onChanged: controller.updateUserName,
                  controller: controller.userNameController,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: controller.updateEmail,
                  controller: controller.emailController,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  onChanged: controller.updatePhoneNumber,
                  controller: controller.phoneNumberController,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                if (controller.videoPath.isNotEmpty)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: controller.videoPlayerController != null &&
                            controller.videoPlayerController!.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: controller.videoPlayerController!.value
                                .aspectRatio,
                            child: VideoPlayer(controller.videoPlayerController!),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await controller.saveUserProfile();
                    Get.back();
                    Get.snackbar(
                      "Success",
                      "Success edit profile",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Text('Save Changes'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await controller.deleteUserData();
                    Get.back();
                    Get.snackbar(
                      "Success",
                      "Success delete profile",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Delete Profile'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}