import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/feedback_rating_controller.dart';
import '../widgets/star_rating.dart';

class FeedbackRatingView extends StatelessWidget {
  const FeedbackRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackRatingController controller = Get.put(FeedbackRatingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback & Rating',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Obx(
              () => StarRating(
                rating: controller.rating.value,
                onRatingSelected: (value) => controller.setRating(value),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Feedback', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your feedback here',
              ),
              onChanged: (text) => controller.setFeedbackText(text),
              controller: TextEditingController(text: controller.feedbackText.value),
            ),
            const SizedBox(height: 10),
            Obx(
              () => ElevatedButton(
                onPressed: controller.toggleSpeechToText,
                child: Text(controller.isListening.value ? 'Stop Listening' : 'Start Listening'),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Video Feedback', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.videoPath.value.isNotEmpty) {
                return GestureDetector(
                  onTap: controller.playPauseVideo,
                  child: Column(
                    children: [
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
                                aspectRatio: controller.videoPlayerController!.value.aspectRatio,
                                child: VideoPlayer(controller.videoPlayerController!),
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(height: 10),
                      Text(controller.isVideoPlaying.value ? 'Tap to pause video' : 'Tap to play video'),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: controller.recordVideo,
                          child: const Text('Record Video'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: controller.pickVideoFromGallery,
                          child: const Text('Pick Video from Gallery'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('No video selected yet.'),
                  ],
                );
              }
            }),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: controller.submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
