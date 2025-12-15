class TimeSlot {
  final String id;
  final String name;
  final String startTime;
  final String endTime;
  final int sortOrder;

  const TimeSlot({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.sortOrder,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['id'] as String,
      name: json['name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }

  String get timeRange => '$startTime - $endTime';
}
