class Course {
  final String name;
  final String code;
  final String semester;
  final String level;
  final String year;
  final String description; // ← NEW
  final List<String> topics; // ← NEW
  final String driveUrl; // ← NEW

  const Course({
    required this.name,
    required this.code,
    required this.semester,
    required this.level,
    required this.year,
    this.description = '',
    this.topics = const [],
    this.driveUrl = '',
  });
}
