class WaterData {
  final int id;
  final String lastDate;
  final int total;
  final int goal;
  final int step;

  WaterData({
    required this.id,
    required this.lastDate,
    required this.total,
    required this.goal,
    required this.step,
  });

  factory WaterData.fromMap(Map<String, dynamic> map) {
    return WaterData(
      id: map['id']??0,
      lastDate: map['last_date']??'',
      total: map['total']??0,
      goal: map['goal']??1500,
      step: map['step']??150,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'last_date': lastDate,
      'total': total,
      'goal': goal,
      'step': step,
    };
  }
}
