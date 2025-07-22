import 'package:calafi/models/db/weight.dart';
import 'package:calafi/repository/weightRepository.dart';
import 'package:get/get.dart';

class WeightController extends GetxController {
  final WeightRepository repo = WeightRepository();
  var weights = <WeightData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWeights();
  }

  Future<void> loadWeights() async {
    weights.value = await repo.getAllWeights();
  }

  Future<void> saveWeight(double weight) async {
    await repo.upsertWeight(weight);
    await loadWeights();
  }

  List<double> get weightValues => weights.map((e) => e.weight).toList();

  List<String> get weightDates =>
      weights.map((e) => e.date.substring(5)).toList(); // MM-DD
}
