import 'dart:async';
import 'package:mobile_programming_project/Data/kpu_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('form_data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE form_data (
        id $idType,
        nik $textType,
        name $textType,
        phone $textType,
        gender $textType,
        date $textType
      )
    ''');
  }

  Future<void> insertPemilih(Pemilih pemilih) async {
    final db = await instance.database;
    await db.insert('form_data', pemilih.toMap());
  }

  Future<List<Pemilih>> fetchAllPemilih() async {
    final db = await instance.database;
    final result = await db.query('form_data');
    return result.map((json) => Pemilih.fromMap(json)).toList();
  }

  Future<int> deletePemilih(int id) async {
    final db = await instance.database;
    return await db.delete('form_data', where: 'id = ?', whereArgs: [id]);
  }
}
