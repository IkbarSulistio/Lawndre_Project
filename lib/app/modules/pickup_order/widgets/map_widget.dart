import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import '../controllers/pickup_order_controller.dart' as local_map_controller;

class MapWidget extends GetView<local_map_controller.PickupOrderController> {
  final TextEditingController _controller = TextEditingController();
  final MapController _mapController = MapController();
  LatLng? _location;
  final List<Marker> _markers = [];

  MapWidget({super.key});

  
  void _searchLocation() async {
    String address = _controller.text;

    try {
     
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        _location = LatLng(location.latitude, location.longitude);
        _mapController.move(_location!, 15.0);
        _addMarker(_location!);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Lokasi tidak ditemukan.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  void _addMarker(LatLng latLng) {
    _markers.add(Marker(
      point: latLng,
      width: 80,
      height: 80,
      child: GestureDetector(
        onTap: () {
       
          showDialog(
            context: Get.context!,
            builder: (context) => AlertDialog(
              title: const Text('Informasi Marker'),
              content: Text('Lokasi: ${latLng.latitude}, ${latLng.longitude}'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Tutup'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.location_on, color: Colors.green, size: 40),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Pencarian'),
        backgroundColor: const Color.fromRGBO(55, 94, 97, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Masukkan nama lokasi',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchLocation,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                onTap: (tapPosition, latLng) {
                  _addMarker(latLng);
                },
                maxZoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://maps.geoapify.com/v1/tile/carto/{z}/{x}/{y}.png?apiKey=${local_map_controller.PickupOrderController.apiKey}',
                  tileProvider: NetworkTileProvider(),
                ),
                MarkerLayer(
                  markers: _markers,
                ),
              ],
            ),
          ),
          if (_location != null)
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(
                'Lokasi ditemukan: ${_location!.latitude}, ${_location!.longitude}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}