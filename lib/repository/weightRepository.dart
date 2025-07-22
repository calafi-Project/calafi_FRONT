import 'package:calafi/db/weightDB.dart';
import 'package:calafi/models/db/weight.dart';

class WeightRepository {
  Future<void> upsertWeight(double weight) async {
    final db = await WeightDatabase.getDB();
    final date = DateTime.now().toIso8601String().split('T')[0];

    final existing = await db.query('weight', where: 'date = ?', whereArgs: [date]);

    if (existing.isEmpty) {
      await db.insert('weight', {'date': date, 'weight': weight});
    } else {
      await db.update('weight', {'weight': weight}, where: 'date = ?', whereArgs: [date]);
    }
  }

  Future<List<WeightData>> getAllWeights() async {
    final db = await WeightDatabase.getDB();
    final result = await db.query('weight', orderBy: 'date ASC');
    return result.map((e) => WeightData.fromMap(e)).toList();
  }
}
