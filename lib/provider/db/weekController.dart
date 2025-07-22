import 'package:calafi/db/weekDb.dart';
import 'package:get/get.dart';

class ExerciseWeekController extends GetxController {
  final weekStates = List<int>.filled(7, 3).obs; // 기본값은 3

  @override
  void onInit() {
    super.onInit();
    loadWeekStates();
  }

  Future<void> loadWeekStates() async {
    final db = await ExerciseWeekDB.getDB();
    final result = await db.query('exercise_week', orderBy: 'day');
    for (var row in result) {
      weekStates[row['day'] as int] = row['state'] as int;
    }
  }

  Future<void> updateState(int day, int state) async {
    final db = await ExerciseWeekDB.getDB();
    await db.update(
      'exercise_week',
      {'state': state},
      where: 'day = ?',
      whereArgs: [day],
    );
    weekStates[day] = state;
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
      weekStates[i] = 3;
    }
  }
}
