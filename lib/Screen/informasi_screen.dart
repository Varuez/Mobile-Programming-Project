import 'package:mobile_programming_project/Utils/colors.dart';
import 'package:flutter/material.dart';

class InformasiScreen extends StatefulWidget {
  const InformasiScreen({super.key});

  @override
  State<InformasiScreen> createState() => _InformasiScreenState();
}

class _InformasiScreenState extends State<InformasiScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: AppColors.neutralColor,
          ),
        ),
        title: const Text(
          'Informasi Pemilihan Umum',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset("assets/images/kpu_logo.png"),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(20),
                      height: 380,
                      width: size.width,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Text(
                          'Pemilihan Umum, atau disingkat Pemilu, adalah proses di mana rakyat secara langsung memilih wakil-wakilnya untuk duduk di pemerintahan. '
                          'Pemilu adalah bagian penting dari sistem demokrasi, karena melalui pemilu, '
                          'suara rakyat menentukan siapa yang akan memimpin dan membuat keputusan penting untuk negara.'
                          '\nSetiap warga negara Indonesia yang sudah berusia 17 tahun ke atas atau sudah menikah memiliki hak pilih untuk ikut serta dalam Pemilu',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Ver 1.0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
