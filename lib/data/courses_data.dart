import '../models/course_model.dart';

final List<Course> coursesList = [
  // ─── Flutter ───────────────────────────────────────────────
  Course(
    name: 'Mobile Application Development Via Flutter',
    code: '-',
    semester: 'Semester 3 / 5',
    level: 'UG',
    year: '2025 – Present',
    description:
        'This course focuses on developing cross-platform mobile applications using '
        'Flutter and Dart. Students learn to build responsive and high-performance '
        'apps with modern UI/UX, state management, API integration, and backend '
        'connectivity. Emphasis is on real-world application development and deployment.',
    topics: [
      'Introduction to Flutter & Dart',
      'Widgets & UI Design (Material & Cupertino)',
      'Layouts & Responsive Design',
      'Navigation & Routing',
      'State Management (Provider / Riverpod)',
      'API Integration & JSON Parsing',
      'Firebase Integration (Auth, Firestore)',
      'Local Storage & Offline Support',
      'App Deployment & Performance Optimization',
    ],
    driveUrl: '',
    gfgUrl: 'https://www.geeksforgeeks.org/flutter-tutorial/',
    interviewBitUrl:
        'https://www.interviewbit.com/flutter-interview-questions/',
    youtubePlaylists: [
      YoutubePlaylist(
        title: 'Flutter Full Course – Rivaan Ranawat',
        url:
            'https://www.youtube.com/playlist?list=PL6yRaaP0WPkVtoeNIGqILtRAgd3h2CNpT',
      ),
      YoutubePlaylist(
        title: 'Flutter Tutorial – Net Ninja',
        url:
            'https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ',
      ),
    ],
  ),

  // ─── Cloud Computing ───────────────────────────────────────
  Course(
    name: 'Cloud Computing',
    code: 'C5360D2',
    semester: 'Semester 3',
    level: 'PG',
    year: '2025-26',
    description:
        'Provides fundamental understanding of cloud computing, virtualization, '
        'and service models. Covers architecture, deployment models, and tools '
        'like CloudSim and VMware for practical implementation.',
    topics: [
      'Cloud Computing Overview & Characteristics',
      'Cloud Architecture & Service Models (SaaS, PaaS, IaaS)',
      'Cloud Deployment Models (Public, Private, Hybrid)',
      'Virtualization & VMware Basics',
      'CloudSim & GreenCloud Simulators',
      'Cloud Security & Challenges',
      'Resource Management & Scalability',
    ],
    driveUrl:
        'https://drive.google.com/drive/folders/1bZCHFFbBlMoLh4oDNqwKwBRNn_t70Bjm?usp=sharing',
    gfgUrl: 'https://www.geeksforgeeks.org/cloud-computing/',
    interviewBitUrl:
        'https://www.interviewbit.com/cloud-computing-interview-questions/',
    youtubePlaylists: [
      YoutubePlaylist(
        title: 'Cloud Computing – Bhanu Priya',
        url:
            'https://www.youtube.com/playlist?list=PLrjkTql3jnm86_Jr9195OaqN-HeiBy49I',
      ),
      YoutubePlaylist(
        title: 'Cloud Computing – Gate Smashers',
        url:
            'https://www.youtube.com/playlist?list=PLxCzCOWd7aiHRHVUtR-O52MsrdUSrzuy4',
      ),
    ],
  ),

  // ─── Artificial Intelligence ───────────────────────────────
  Course(
    name: 'Principles of Artificial Intelligence',
    code: 'C4561C2',
    semester: 'Semester 5',
    level: 'UG',
    year: '2025-26',
    description:
        'This course introduces core concepts of Artificial Intelligence including '
        'problem solving, search techniques, knowledge representation, and NLP. '
        'Students learn how intelligent agents work and how AI systems are designed '
        'to solve real-world problems.',
    topics: [
      'Introduction to AI & Intelligent Agents',
      'Problem Solving & Search Techniques (DFS, BFS, A*)',
      'Heuristic Search & Optimization',
      'Knowledge Representation (Predicate Logic, Semantic Networks)',
      'Natural Language Processing (Parsing, Grammar)',
      'Game Playing (Minimax, Alpha-Beta Pruning)',
      'Planning Systems & Problem Reduction',
    ],
    driveUrl:
        'https://drive.google.com/drive/folders/10__k94eVGy2Y96H7raRJMzWuglp5ZMiT?usp=sharing',
    gfgUrl: 'https://www.geeksforgeeks.org/artificial-intelligence/',
    interviewBitUrl:
        'https://www.interviewbit.com/artificial-intelligence-interview-questions/',
    youtubePlaylists: [
      YoutubePlaylist(
        title: 'AI – Bhanu Priya',
        url:
            'https://www.youtube.com/playlist?list=PLrjkTql3jnm_yol-ZK1QqPSn5YSg0NF9r',
      ),
      YoutubePlaylist(
        title: 'AI – Gate Smashers',
        url:
            'https://www.youtube.com/playlist?list=PLxCzCOWd7aiHRHVUtR-O52MsrdUSrzuy4',
      ),
    ],
  ),

  // ─── Computer Networks ─────────────────────────────────────
  Course(
    name: 'Computer Networks',
    code: 'C5260C3',
    semester: 'Semester 2 (PG) & Semester 4 (UG)',
    level: 'PG, UG',
    year: '2025 – Present',
    description:
        'Covers layered architecture of computer networks including OSI and TCP/IP '
        'models. Students learn about protocols, routing, data transmission, and '
        'network applications like HTTP, DNS, and email systems.',
    topics: [
      'Introduction to Networks & OSI/TCP-IP Models',
      'Physical Layer & Transmission Media',
      'Data Link Layer & Error Detection',
      'MAC Protocols (ALOHA, CSMA/CD)',
      'Routing Algorithms & Network Layer',
      'Transport Layer (TCP/UDP)',
      'Application Layer (DNS, HTTP, Email)',
    ],
    driveUrl:
        'https://drive.google.com/drive/folders/1s2r2n3Icx88U96YSvNmvT5FpPkLsAo8I?usp=sharing',
    gfgUrl: 'https://www.geeksforgeeks.org/computer-network-tutorials/',
    interviewBitUrl:
        'https://www.interviewbit.com/networking-interview-questions/',
    youtubePlaylists: [
      YoutubePlaylist(
        title: 'Computer Networks – Neso Academy',
        url:
            'https://www.youtube.com/playlist?list=PLBlnK6fEyqRgMCUAG0XRw78UA8qnv6jEx',
      ),
      YoutubePlaylist(
        title: 'Computer Networks – Gate Smashers',
        url:
            'https://www.youtube.com/playlist?list=PLxCzCOWd7aiGFBD2-2joCpWOLUrDLvVV_',
      ),
    ],
  ),

  // ─── Java OOP ──────────────────────────────────────────────
  Course(
    name: 'Object-Oriented Programming Using Java',
    code: 'C4361C2',
    semester: 'Semester 3',
    level: 'UG',
    year: '2025-26',
    description:
        'Focuses on core Java programming and OOP concepts such as classes, '
        'inheritance, polymorphism, and exception handling. Includes file handling '
        'and real-world application development using Java.',
    topics: [
      'Java Basics & Data Types',
      'Control Statements & Loops',
      'Classes, Objects & Constructors',
      'Inheritance & Polymorphism',
      'Interfaces & Packages',
      'Exception Handling',
      'File Handling & I/O Streams',
    ],
    driveUrl:
        'https://drive.google.com/drive/folders/1fNeEF-sA56Avpg9ge_r11qIt0sNu7gEA?usp=sharing',
    gfgUrl:
        'https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/',
    interviewBitUrl: 'https://www.interviewbit.com/java-interview-questions/',
    youtubePlaylists: [
      YoutubePlaylist(
        title: 'Java OOP – Apna College',
        url:
            'https://www.youtube.com/playlist?list=PLfqMhTWNBTe3LtFWcvwpqTkUSlB32kJop',
      ),
      YoutubePlaylist(
        title: 'Java Full Course – Telusko',
        url:
            'https://www.youtube.com/playlist?list=PLsyeobzWxl7oZ-fxDYkOToURHhMuWD1BK',
      ),
    ],
  ),
];
