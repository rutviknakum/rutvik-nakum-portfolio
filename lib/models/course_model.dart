class Course {
  final String name;
  final String code;
  final String semester;
  final String level;
  final String year;
  final String description;
  final List<String> topics;
  final String driveUrl;
  final String interviewBitUrl; // ← NEW
  final String gfgUrl;
  final List<YoutubePlaylist> youtubePlaylists; // ← String ની જગ્યાએ List

  const Course({
    required this.name,
    required this.code,
    required this.semester,
    required this.level,
    required this.year,
    this.description = '',
    this.topics = const [],
    this.driveUrl = '',
    this.interviewBitUrl = '', // ← NEW
    this.gfgUrl = '',
    this.youtubePlaylists = const [], // ← NEW
  });
}

// ← NEW Class
class YoutubePlaylist {
  final String title;
  final String url;

  const YoutubePlaylist({required this.title, required this.url});
}
