class Publication {
  final String title;
  final String journal;
  final String year;
  final String authors;
  final String doi;
  final String type; // 'journal' | 'conference' | 'book'

  const Publication({
    required this.title,
    required this.journal,
    required this.year,
    required this.authors,
    required this.doi,
    required this.type,
  });
}
