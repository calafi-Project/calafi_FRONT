class Worklist {
  final String name;
  final int set;

  Worklist({required this.name, required this.set});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'set': set,
    };
  }
}
