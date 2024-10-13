import 'package:get/get.dart';

class PickupOrderController extends GetxController {
  static const String apiKey = 'c87930a8a28c4c5eb8fe14188919e14b';

  final String tileUrl =
      'https://maps.geoapify.com/v1/tile/carto/{z}/{x}/{y}.png?&apiKey=$apiKey';
}