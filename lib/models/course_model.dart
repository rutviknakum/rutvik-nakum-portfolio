class Course {
  final String name;
  final String code;
  final String semester;
  final String level; // 'UG' | 'PG'
  final String year;

  const Course({
    required this.name,
    required this.code,
    required this.semester,
    required this.level,
    required this.year,
  });
}
