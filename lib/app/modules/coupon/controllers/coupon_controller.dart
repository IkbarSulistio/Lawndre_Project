import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

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
        await _audioPlayer.play(audioSource.value.startsWith('http')
            ? UrlSource(audioSource.value)
            : AssetSource(audioSource.value));
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
}
