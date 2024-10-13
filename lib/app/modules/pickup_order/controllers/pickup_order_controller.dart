import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PickupOrderController extends GetxController {
  static const String apiKey = 'c87930a8a28c4c5eb8fe14188919e14b';

  final String tileUrl =
      'https://maps.geoapify.com/v1/tile/carto/{z}/{x}/{y}.png?&apiKey=$apiKey';
  final String placesUrl =
      'https://api.geoapify.com/v1/geocode/search?apiKey=$apiKey&text=';

  Future<Map<String, dynamic>> searchLocation(String query) async {
    final url = '$placesUrl$query';
    print('Request URL: $url'); // Debugging: Tampilkan URL

    try {
      final response = await http.get(Uri.parse(url));

      print('Response Status Code: ${response.statusCode}'); // Debugging
      print('Response Body: ${response.body}'); // Debugging

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['features'].isNotEmpty) {
          final location = data['features'][0]['geometry']['coordinates'];
          return {
            'lat': location[1],
            'lon': location[0],
          };
        } else {
          return {};
        }
      } else {
        throw Exception('Failed to load location');
      }
    } catch (e) {
      print('Error occurred: $e'); // Debugging: Tampilkan error
      throw Exception('Error: $e');
    }
  }
}