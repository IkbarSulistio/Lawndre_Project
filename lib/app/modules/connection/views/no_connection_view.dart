import 'package:flutter/material.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ukuran sesuai konten
        children: [
          const Icon(
            Icons.wifi_off,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          const Text(
            'No Internet Connection',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10),
          const Text(
            'Please check your connection and try again.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Menutup pop-up
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
