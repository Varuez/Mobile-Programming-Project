// main.dart
//
// File utama aplikasi Flutter yang berfungsi sebagai entry point.
// Menentukan tampilan awal yaitu LoginPage sebelum menuju halaman HomeScreen.

import 'package:crud_new1/Screen/login_page.dart'; // Import halaman login
import 'package:flutter/material.dart'; // Import pustaka UI Flutter

void main() {
  // Fungsi utama untuk menjalankan aplikasi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Kelas utama aplikasi Flutter
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner "Debug"
      title: 'Sertifikasi Data', // Judul aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Halaman pertama yang ditampilkan
    );
  }
}
