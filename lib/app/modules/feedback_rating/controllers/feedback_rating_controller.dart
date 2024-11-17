import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class FeedbackRatingController extends GetxController {
  var rating = 0.obs;
  var feedbackText = ''.obs;
  var videoPath = ''.obs;
  VideoPlayerController? videoPlayerController;
  var isVideoPlaying = false.obs;

  final ImagePicker _picker = ImagePicker();
  final GetStorage _storage = GetStorage();

  stt.SpeechToText _speech = stt.SpeechToText();
  var isListening = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadVideoPath();
  }

  void setRating(int value) {
    rating.value = value;
  }

  void setFeedbackText(String text) {
    feedbackText.value = text;
  }

  Future<void> recordVideo() async {
    final XFile? pickedVideo = await _picker.pickVideo(source: ImageSource.camera);
    if (pickedVideo != null) {
      videoPath.value = pickedVideo.path;
      _storage.write('videoPath', pickedVideo.path);

      videoPlayerController = VideoPlayerController.file(File(pickedVideo.path))
        ..initialize().then((_) {
          videoPlayerController!.play();
          isVideoPlaying.value = true;
          update();
        });
    } else {
      Get.snackbar("Error", "No video recorded");
    }
  }

  // Method to pick video from gallery
  Future<void> pickVideoFromGallery() async {
    final XFile? pickedVideo = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      videoPath.value = pickedVideo.path;
      _storage.write('videoPath', pickedVideo.path);

      videoPlayerController = VideoPlayerController.file(File(pickedVideo.path))
        ..initialize().then((_) {
          videoPlayerController!.play();
          isVideoPlaying.value = true;
          update();
        });
    } else {
      Get.snackbar("Error", "No video selected from gallery");
    }
  }

  void playPauseVideo() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isVideoPlaying.value = false;
      } else {
        videoPlayerController!.play();
        isVideoPlaying.value = true;
      }
      update();
    }
  }

  void submitFeedback() {
    if (rating.value == 0) {
      Get.snackbar("Error", "Please select a rating");
      return;
    }

    print("Rating: ${rating.value}");
    print("Feedback: ${feedbackText.value}");
    if (videoPath.value.isNotEmpty) {
      print("Video Path: ${videoPath.value}");
    } else {
      print("No video submitted.");
    }

    Get.snackbar("Success", "Feedback submitted successfully!");

    rating.value = 0;
    feedbackText.value = '';
    videoPath.value = '';
    videoPlayerController?.dispose();
    videoPlayerController = null;
    isVideoPlaying.value = false;

    _storage.remove('videoPath');
  }

  void loadVideoPath() {
    String? storedVideoPath = _storage.read('videoPath');
    if (storedVideoPath != null && storedVideoPath.isNotEmpty) {
      videoPath.value = storedVideoPath;
    }
  }

  // Start/Stop Speech-to-Text
  Future<void> toggleSpeechToText() async {
    if (isListening.value) {
      _speech.stop();
      isListening.value = false;
    } else {
      bool available = await _speech.initialize();
      if (available) {
        _speech.listen(onResult: (result) {
          // Update feedbackText in real-time as speech is recognized
          feedbackText.value = result.recognizedWords;
          update();  // Force UI update
        });
        isListening.value = true;
      } else {
        Get.snackbar("Error", "Speech recognition not available");
      }
    }
  }
}
