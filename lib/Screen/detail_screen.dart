// Import library yang dibutuhkan
// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:mobile_programming_project/Screen/form_screen.dart';
import 'package:mobile_programming_project/Screen/home_screen.dart';
import 'package:mobile_programming_project/Utils/colors.dart';
import 'package:mobile_programming_project/Data/kpu_model.dart';
import 'package:mobile_programming_project/Screen/view_data_screen.dart';
import 'package:flutter/material.dart';

/// Halaman DetailScreen menampilkan informasi data pemilih yang telah diinput.
class DetailScreen extends StatelessWidget {
  final Pemilih pemilih; // Data pemilih yang dikirim dari FormScreen

  const DetailScreen({super.key, required this.pemilih});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ViewDataScreen()),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: AppColors.neutralColor,
          ),
        ),
        title: const Text(
          'Detail Data',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // NIK
              const Text(
                'NIK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.greenSecobdColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  child: Text(pemilih.nik),
                ),
              ),

              const SizedBox(height: 10),

              // Nama
              const Text(
                'Nama',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.greenSecobdColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  child: Text(pemilih.name),
                ),
              ),

              const SizedBox(height: 10),

              // Nomor HP
              const Text(
                'Nomor HP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.greenSecobdColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  child: Text(pemilih.phone),
                ),
              ),

              const SizedBox(height: 10),

              // Jenis Kelamin
              const Text(
                'Jenis Kelamin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.greenSecobdColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  child: Text(pemilih.gender),
                ),
              ),

              const SizedBox(height: 10),

              // Tanggal Input
              const Text(
                'Tanggal Input Data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.greenSecobdColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  child: Text(pemilih.date),
                ),
              ),

              const SizedBox(height: 10),
              const SizedBox(height: 30),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text("KEMBALI KE MENU"),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi ini menampilkan gambar penuh di dalam dialog
  // void _showFullImage(BuildContext context, String imagePath) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         backgroundColor: Colors.transparent,
  //         insetPadding: const EdgeInsets.all(10),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             color: Colors.white,
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(12),
  //             child: Image.file(File(imagePath), fit: BoxFit.contain),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
