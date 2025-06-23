/// Model data untuk calon pemilih
class Pemilih {
  final int? id; // Tambahkan ID jika ingin mendukung edit/hapus di SQLite
  final String nik;
  final String name;
  final String phone;
  final String gender;
  final String date;

  Pemilih({
    this.id, // opsional, bisa null saat insert
    required this.nik,
    required this.name,
    required this.phone,
    required this.gender,
    required this.date,
  });

  // Ubah object menjadi Map untuk insert ke SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nik': nik,
      'name': name,
      'phone': phone,
      'gender': gender,
      'date': date,
    };
  }

  // Buat factory untuk ubah Map menjadi object Pemilih
  factory Pemilih.fromMap(Map<String, dynamic> map) {
    return Pemilih(
      id: map['id'],
      nik: map['nik'],
      name: map['name'],
      phone: map['phone'],
      gender: map['gender'],
      date: map['date'],
    );
  }
}
