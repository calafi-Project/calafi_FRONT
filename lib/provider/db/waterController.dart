import 'package:calafi/models/db/waterData.dart';
import 'package:calafi/repository/waterRepository.dart';
import 'package:get/get.dart';

class WaterController extends GetxController {
  final WaterRepository repo = WaterRepository();

  var waterData = Rxn<WaterData>();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    await repo.checkAndResetIfNeeded();
    final data = await repo.getWaterData();
    waterData.value = data;
  }

  Future<void> addWater() async {
    await repo.addWater();
    await loadData();
  }

  Future<void> updateGoalStep(int goal, int step) async {
    await repo.updateGoalStep(goal, step);
    await loadData();
  }
}
