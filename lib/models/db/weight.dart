class WeightData {
  final int? id;
  final String date;
  final double weight;

  WeightData({this.id, required this.date, required this.weight});

  factory WeightData.fromMap(Map<String, dynamic> map) {
    return WeightData(
      id: map['id']??0,
      date: map['date']??'',
      weight: map['weight']??70,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'weight': weight,
    };
  }
}
