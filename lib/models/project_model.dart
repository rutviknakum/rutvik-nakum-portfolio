class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String githubUrl;
  final String liveUrl;
  final String imageAsset;
  final String type; // 'academic' | 'personal'

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl = '',
    this.liveUrl = '',
    this.imageAsset = '',
    required this.type,
  });
}
