// import 'package:mobile_programming_project/Data/helper.dart';
// import 'package:mobile_programming_project/Screen/home_screen.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';

import 'package:mobile_programming_project/Data/kpu_model.dart';
import 'package:mobile_programming_project/Data/helper.dart'; // untuk class DatabaseHelper
import 'package:mobile_programming_project/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:mobile_programming_project/Screen/detail_screen.dart';

/// Halaman form untuk penambahan data calon pemilih
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Global key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk inputan teks
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nomorhpController = TextEditingController();
  // Data pilihan pengguna
  String selectedDate = '';
  String? selectedGender;

  // final TextEditingController _addressController = TextEditingController();
  // Image picker dan file gambar yang dipilih
  // final ImagePicker _picker = ImagePicker();
  // File? _imageFile;

  /// Fungsi validasi dan submit form
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (selectedGender == null) {
        _showSnackbar("Jenis kelamin wajib dipilih");
        return;
      }
      if (selectedDate.isEmpty) {
        _showSnackbar("Tanggal wajib diisi");
        return;
      }

      final newPemilih = Pemilih(
        nik: _nikController.text,
        name: _nameController.text,
        phone: _nomorhpController.text,
        gender: selectedGender!,
        date: selectedDate,
      );

      // ✅ Simpan data ke SQLite
      await DatabaseHelper.instance.insertPemilih(newPemilih);

      _showSnackbar("Data berhasil disimpan!");

      // Navigasi ke DetailScreen (opsional)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailScreen(pemilih: newPemilih)),
      );
    }
  }

  /// Fungsi menampilkan snackbar error
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: AppColors.neutralColor,
          ),
        ),
        title: const Text(
          'Form Penambahan Data',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Input NIK
              const SizedBox(height: 20),
              const Text('NIK', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildInputField(
                controller: _nikController,
                hintText: "Masukkan NIK Anda",
                keyboardType: TextInputType.number,
                validatorMessage: "NIK tidak boleh kosong",
              ),

              /// Input Nama
              const SizedBox(height: 20),
              const Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
              _buildInputField(
                controller: _nameController,
                hintText: "Masukkan Nama Anda",
                validatorMessage: "Nama tidak boleh kosong",
              ),

              /// Input Nomor Handphone
              const SizedBox(height: 20),
              const Text(
                'No Handphone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _buildInputField(
                controller: _nomorhpController,
                hintText: "Masukkan Nomor Handphone",
                keyboardType: TextInputType.phone,
                validatorMessage: "Nomor HP tidak boleh kosong",
              ),

              /// Input Jenis Kelamin
              const SizedBox(height: 20),
              const Text(
                'Jenis Kelamin',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Laki-laki',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio<String>(
                        value: 'Laki-Laki',
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Perempuan',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio<String>(
                        value: 'Perempuan',
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              /// Input Tanggal
              const SizedBox(height: 20),
              const Text(
                'Tanggal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate =
                          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    });
                  }
                },
                child: Container(
                  height: size.height * 0.09,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.greenSecobdColor,
                    border: Border.all(
                      color: AppColors.greySecondColor,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate.isNotEmpty
                            ? selectedDate
                            : 'Masukkan Tanggal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: selectedDate.isNotEmpty
                              ? FontWeight.bold
                              : FontWeight.w200,
                          color: selectedDate.isNotEmpty
                              ? AppColors.neutralColor
                              : AppColors.greySixColor,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: AppColors.neutralColor,
                      ),
                    ],
                  ),
                ),
              ),

              /// Tombol Simpan
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text("Simpan"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget untuk membuat field input dengan validasi.
  ///
  /// [controller] mengatur inputan teks.
  /// [hintText] sebagai petunjuk teks.
  /// [keyboardType] menentukan jenis input (default: text).
  /// [validatorMessage] ditampilkan jika input kosong.
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    required String validatorMessage,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: AppColors.greenSecobdColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 20, top: 4),
      child: TextFormField(
        controller: controller, // Menghubungkan dengan controller
        keyboardType: keyboardType, // Tipe input (angka, teks, dll)
        validator: (value) =>
            value == null || value.trim().isEmpty ? validatorMessage : null,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 12,
            color: AppColors.greySixColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
