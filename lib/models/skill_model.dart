class Skill {
  final String name;
  final double level; // 0.0 to 1.0
  final String category; // 'language' | 'framework' | 'tool'

  const Skill({
    required this.name,
    required this.level,
    required this.category,
  });
}
