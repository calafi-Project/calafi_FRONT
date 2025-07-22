import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ExerciseWeekDB {
  static Future<Database> getDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'week.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS exercise_week (
            day INTEGER PRIMARY KEY,
            state INTEGER
          )
        ''');

        // 초기값 삽입
        for (int i = 0; i < 7; i++) {
          await db.insert('exercise_week', {'day': i, 'state': 3});
        }
      },
    );
  }
}
