import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'veiculos.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_veiculos);
  }

  String get _veiculos => '''
    CREATE TABLE IF NOT EXISTS veiculos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      descricao TEXT,
      placa TEXT,
      identificacao TEXT
    );
  ''';
}
