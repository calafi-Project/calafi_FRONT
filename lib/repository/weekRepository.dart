
import 'package:calafi/db/weekDb.dart';
import 'package:calafi/models/db/weekData.dart';

class ExerciseWeekRepository {
  Future<void> updateState(int day, int state) async {
    final db = await ExerciseWeekDB.getDB();
    await db.update(
      'exercise_week',
      {'state': state},
      where: 'day = ?',
      whereArgs: [day],
    );
  }

  Future<List<ExerciseDay>> getAllStates() async {
    final db = await ExerciseWeekDB.getDB();
    final result = await db.query('exercise_week', orderBy: 'day ASC');
    return result.map((e) => ExerciseDay.fromMap(e)).toList();
  }

  Future<void> resetWeek() async {
    final db = await ExerciseWeekDB.getDB();
    for (int i = 0; i < 7; i++) {
      await db.update(
        'exercise_week',
        {'state': 3},
        where: 'day = ?',
        whereArgs: [i],
      );
    }
  }
}
