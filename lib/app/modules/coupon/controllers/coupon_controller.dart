import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class CouponController extends GetxController {
  // Holds the index of the selected coupon
  final selectedCoupon = (-1).obs;

  // Instance of AudioPlayer
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Observable for audio source
  final audioSource = ''.obs;

  // Function to set the selected coupon
  void selectCoupon(int index) {
    selectedCoupon.value = index;
  }

  // Function to play confirm sound from the current audio source
  Future<void> playConfirmSound() async {
    try {
      if (audioSource.value.isNotEmpty) {
        if (audioSource.value.startsWith('file://')) {
          // If the source is a local file path, use File and play the sound
          final filePath = audioSource.value.replaceFirst('file://', '');
          final file = File(filePath);
          if (await file.exists()) {
            await _audioPlayer.play(DeviceFileSource(filePath));
          } else {
            print("File does not exist at the path: $filePath");
          }
        } else {
          // For URL or asset, keep the original logic
          await _audioPlayer.play(audioSource.value.startsWith('http')
              ? UrlSource(audioSource.value)
              : AssetSource(audioSource.value));
        }
      } else {
        print("No audio source selected.");
      }
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  // Function to set a new audio source
  void setAudioSource(String source) {
    audioSource.value = source;
  }

  // Function to show the audio source selection dialog
  void showAudioSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Audio Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Open file picker for audio files
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.audio, // Limit file type to audio
                  );

                  if (result != null) {
                    // Get the file path from the picker
                    String? filePath = result.files.single.path;
                    if (filePath != null) {
                      setAudioSource('file://$filePath'); // Set the picked file path
                      Navigator.of(context).pop(); // Close dialog
                    }
                  }
                },
                child: const Text('Pick an Audio File'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Set a default audio file (basic audio)
                  setAudioSource('audio/simple-notification-152054.mp3');
                  Navigator.of(context).pop();
                },
                child: const Text('Set Default Audio'),
              ),
            ],
          ),
        );
      },
    );
  }
}
