class ExerciseSearchModel {
  final int id;
  final String name,imageurl;
  final String need;

  ExerciseSearchModel({
    required this.id,
    required this.name,
    required this.imageurl,
    required this.need,
  });

  factory ExerciseSearchModel.fromJson(Map<String, dynamic> json) {
    return ExerciseSearchModel(
      id: json['id']??0,
      name: json['name']??'',
      need: json['need']??'',
      imageurl: json['image_url']??'assets/images/exer.jpg',
    );
  }
}
