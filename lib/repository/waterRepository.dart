import 'package:calafi/db/waterDB.dart';
import 'package:calafi/models/db/waterData.dart';

class WaterRepository {
  Future<void> checkAndResetIfNeeded() async {
    final db = await WaterDatabase.getDB();
    final today = DateTime.now().toIso8601String().split('T')[0];

    final result = await db.query('water', where: 'id = ?', whereArgs: [1]);

    if (result.isEmpty) {
      await db.insert('water', {
        'id': 1,
        'last_date': today,
        'total': 0,
        'goal': 1500,
        'step': 150,
      });
    } else {
      final data = WaterData.fromMap(result.first);
      if (data.lastDate != today) {
        await db.update(
          'water',
          {
            'total': 0,
            'last_date': today,
          },
          where: 'id = ?',
          whereArgs: [1],
        );
      }
    }
  }

  Future<void> addWater() async {
    final db = await WaterDatabase.getDB();

    final result = await db.query('water', where: 'id = ?', whereArgs: [1]);
    if (result.isEmpty) return;

    final data = WaterData.fromMap(result.first);
    final newTotal = data.total + data.step;

    await db.update(
      'water',
      {'total': newTotal},
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<WaterData?> getWaterData() async {
    final db = await WaterDatabase.getDB();
    final result = await db.query('water', where: 'id = ?', whereArgs: [1]);
    if (result.isEmpty) return null;
    return WaterData.fromMap(result.first);
  }

  Future<void> updateGoalStep(int goal, int step) async {
    final db = await WaterDatabase.getDB();
    await db.update(
      'water',
      {'goal': goal, 'step': step},
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}
