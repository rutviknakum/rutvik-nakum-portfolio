import '../models/project_model.dart';

final List<Project> projectsList = [
  Project(
    title: 'iEducation',
    description:
        'A scalable College Management System built with Flutter and Firebase. '
        'Features role-based access control for Admin, Faculty and Students '
        'with real-time data handling and seamless user experience.',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    githubUrl: 'https://github.com/rutviknakum',
    liveUrl: '',
    imageAsset: 'assets/images/project1.png',
    type: 'academic',
  ),

  Project(
    title: 'We Split',
    description:
        'A shared expense management app that simplifies group expense '
        'tracking. Designed with clean system architecture and '
        'user-friendly workflows for splitting bills effortlessly.',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    githubUrl: 'https://github.com/rutviknakum',
    liveUrl: '',
    imageAsset: 'assets/images/project2.png',
    type: 'personal',
  ),

  Project(
    title: 'Discussion Forum',
    description:
        'A database-driven discussion platform designed for academic '
        'communities. Optimized PostgreSQL queries for fast performance '
        'and efficient data retrieval.',
    technologies: ['PostgreSQL', 'SQL'],
    githubUrl: 'https://github.com/rutviknakum',
    liveUrl: '',
    imageAsset: 'assets/images/project3.png',
    type: 'academic',
  ),
];
