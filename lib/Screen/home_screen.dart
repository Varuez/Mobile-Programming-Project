// home_screen.dart
//
// Halaman utama setelah login berhasil. Berisi navigasi ke fitur-fitur aplikasi:
// - Informasi Pemilu
// - Formulir Entry Data
// - Melihat Data
// - Logout kembali ke halaman login

import 'package:crud_new1/Screen/form_screen.dart';
import 'package:crud_new1/Screen/informasi_screen.dart';
import 'package:crud_new1/Screen/view_data_screen.dart';
import 'package:crud_new1/Screen/login_page.dart'; // Import LoginPage untuk logout
import 'package:crud_new1/Utils/colors.dart'; // Warna kustom aplikasi
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk akses SystemNavigator (opsional)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              // Logo KPU
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/kpu_logo.png'),
                ),
              ),
              const SizedBox(height: 20),

              // Navigasi ke InformasiScreen
              _buildMenuCard(
                icon: Icons.info,
                title: 'Informasi',
                subtitle: 'Informasi Pemilihan umum',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InformasiScreen()),
                ),
              ),

              // Navigasi ke FormScreen
              _buildMenuCard(
                icon: Icons.edit_document,
                title: 'Form Entry',
                subtitle: 'Form entri data calon pemilih',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FormScreen()),
                ),
              ),

              // Navigasi ke ViewDataScreen
              _buildMenuCard(
                icon: Icons.view_list,
                title: 'Lihat Data',
                subtitle: 'Informasi Data Sudah Di Input',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ViewDataScreen()),
                ),
              ),

              // Tombol Logout kembali ke LoginPage
              _buildMenuCard(
                icon: Icons.exit_to_app,
                title: 'Keluar',
                subtitle: '',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Konfirmasi Keluar"),
                      content: const Text(
                        "Apakah Anda yakin ingin keluar dari aplikasi?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigasi ke LoginPage (bukan keluar app)
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text("Keluar"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu menu
  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size.height * 0.15,
          width: size.width,
          decoration: BoxDecoration(
            color: AppColors.chart02,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(icon, color: Colors.white, size: 75),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
