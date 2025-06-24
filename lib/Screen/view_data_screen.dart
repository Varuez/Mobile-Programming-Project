import 'package:flutter/material.dart';
import 'package:mobile_programming_project/Data/kpu_model.dart'; // untuk class Pemilih
import 'package:mobile_programming_project/Data/helper.dart'; // untuk class DatabaseHelper
import 'package:mobile_programming_project/Screen/home_screen.dart';
import 'package:mobile_programming_project/Utils/colors.dart';
import 'detail_screen.dart';

class ViewDataScreen extends StatefulWidget {
  const ViewDataScreen({super.key});

  @override
  _ViewDataScreenState createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  List<Pemilih> _pemilihList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await DatabaseHelper.instance.fetchAllPemilih();
    setState(() {
      _pemilihList = data;
    });
  }

  Future<void> _deleteData(int id) async {
    await DatabaseHelper.instance.deletePemilih(id);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 23,
            color: AppColors.neutralColor,
          ),
        ),
        title: const Text(
          'List Data',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: _pemilihList.isEmpty
          ? const Center(
              child: Text(
                'Belum Ada Data\nSilahkan Input Data Dahulu Pada Form Entry',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _pemilihList.length,
              itemBuilder: (context, index) {
                final item = _pemilihList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text('NIK: ${item.nik}'),
                          Text('Nomor HP: ${item.phone}'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(pemilih: item),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Hapus Data"),
                              content: const Text(
                                "Apakah Anda yakin ingin menghapus data ini?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _deleteData(item.id!);
                                  },
                                  child: const Text("Hapus"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
