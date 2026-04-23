class Achievement {
  final String title;
  final String organization;
  final String year;
  final String description;
  final String icon; // emoji or icon name

  const Achievement({
    required this.title,
    required this.organization,
    required this.year,
    required this.description,
    this.icon = '🏆',
  });
}
