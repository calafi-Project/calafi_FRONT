import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WeightDatabase {
  static Future<Database> getDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'weight.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE weight (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT UNIQUE,
            weight REAL  
          )
        ''');
      },
    );
  }
}
