import '../models/project_model.dart';

final List<Project> projectsList = [
  Project(
    title: 'Smart AgroCare',
    description:
        'An AI-based crop disease detection and weather advisory system designed '
        'to assist farmers in making data-driven decisions. The application allows '
        'users to upload crop leaf images, where a trained machine learning model '
        'analyzes and detects diseases with suggested treatments. It also integrates '
        'real-time weather data to provide actionable insights such as irrigation timing, '
        'pest control alerts, and crop planning recommendations. The system improves '
        'agricultural productivity by enabling early detection and preventive measures.',
    technologies: [
      'Flutter',
      'React.js',
      'Node.js',
      'Firebase',
      'MongoDB',
      'TensorFlow',
      'Keras',
      'OpenCV',
      'Weather API',
    ],
    githubUrl: 'https://github.com/rutviknakum/smart_agrocare.git',
    liveUrl: '',
    imageAsset: 'assets/images/project2.png',
    type: 'academic',
  ),

  Project(
    title: 'iEducation',
    description:
        'A scalable College Management System built with Flutter and Firebase. '
        'Features role-based access control for Admin, Faculty and Students. '
        'Admin can manage users, departments, and timetables. Faculty can upload '
        'assignments, mark attendance, and post announcements. Students get '
        'real-time updates on results, notices, and schedules. '
        'Built with clean architecture and seamless UX.',
    technologies: ['Flutter', 'Dart', 'Firebase', 'Firestore', 'Firebase Auth'],
    githubUrl: 'https://github.com/rutviknakum/iEducation',
    liveUrl: '',
    imageAsset: 'assets/images/project1.png',
    type: 'academic',
  ),

  Project(
    title: 'We Split',
    description:
        'A shared expense management app that simplifies group bill splitting. '
        'Users can create groups, add members, and log shared expenses. '
        'The app automatically calculates who owes whom and shows a clear '
        'settlement summary. Designed with clean system architecture, '
        'real-time sync via Firebase, and user-friendly workflows.',
    technologies: ['Flutter', 'Dart', 'Firebase', 'Firestore'],
    githubUrl: 'https://github.com/rutviknakum/we_spilit',
    liveUrl: '',
    imageAsset: 'assets/images/project2.png',
    type: 'personal',
  ),

  Project(
    title: 'Num To Words',
    description:
        'A Flutter-based mobile application that converts numeric input '
        'into words in three languages — English, Gujarati, and Hindi. '
        'Supports real-time conversion as the user types, voice recognition '
        'via speech_to_text package for hands-free input, and handles '
        'large numbers including crores and billions. '
        'Clean UI with multi-language toggle.',
    technologies: ['Flutter', 'Dart', 'speech_to_text', 'Multilingual'],
    githubUrl: 'https://github.com/rutviknakum/Num_To_Words',
    liveUrl: '',
    imageAsset: 'assets/images/project3.png',
    type: 'personal',
  ),

  Project(
    title: 'Discussion Forum',
    description:
        'A database-driven discussion platform built for academic communities. '
        'Students and faculty can post questions, reply to threads, and '
        'upvote helpful answers. Features include category-based filtering, '
        'search functionality, and user authentication. '
        'Optimized PostgreSQL queries with indexing for fast data retrieval '
        'even under high load.',
    technologies: ['PostgreSQL', 'SQL', 'Database Design', 'Indexing'],
    githubUrl: '', // GitHub repo ન હોય તો blank રાખો
    liveUrl: '',
    imageAsset: 'assets/images/project4.png',
    type: 'academic',
  ),
];
