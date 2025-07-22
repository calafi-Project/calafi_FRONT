import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WaterDatabase {
  static Future<Database> getDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'water.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE water(
            id INTEGER PRIMARY KEY,
            last_date TEXT,
            total INTEGER,
            goal INTEGER,
            step INTEGER
          )
        ''');
      },
    );
  }
}
