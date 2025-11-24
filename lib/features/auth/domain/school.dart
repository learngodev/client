class School {
  const School({required this.id, required this.name});

  final String id;
  final String name;

  factory School.fromJson(Map<String, dynamic> json) {
    return School(id: json['id'] as String, name: json['name'] as String);
  }
}
