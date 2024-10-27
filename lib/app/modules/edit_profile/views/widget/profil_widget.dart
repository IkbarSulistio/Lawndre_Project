// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileWidget extends StatefulWidget {
//   const ProfileWidget({super.key});

//   @override
//   _ProfileWidgetState createState() => _ProfileWidgetState();
// }

// class _ProfileWidgetState extends State<ProfileWidget> {
//   File? _image; // Variable untuk menyimpan gambar yang dipilih

//   Future<void> _pickImage() async {
//     // Menggunakan Image Picker untuk memilih gambar dari galeri
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path); // Menyimpan path gambar yang dipilih
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             // Avatar untuk foto profil
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: _image != null
//                   ? FileImage(_image!) // Menampilkan gambar yang dipilih
//                   : const AssetImage('assets/default_avatar.png') as ImageProvider, // Default Avatar jika belum ada gambar yang dipilih
//             ),
//             // Tombol edit untuk memilih gambar
//             Positioned(
//               bottom: 0,
//               right: 0,
//               child: IconButton(
//                 icon: const Icon(Icons.edit),
//                 onPressed: _pickImage, // Memanggil Image Picker saat tombol ditekan
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text('User_1945', style: TextStyle(fontSize: 18)), // Nama pengguna
//         const Text('User1945@gmail.com', style: TextStyle(fontSize: 14, color: Colors.grey)), // Email pengguna
//         const Text('+6281234684952', style: TextStyle(fontSize: 14, color: Colors.grey)), // Nomor telepon pengguna
//       ],
//     );
//   }
// }