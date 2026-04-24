import '../models/course_model.dart';

final List<Course> coursesList = [
  Course(
    name: 'Object-Oriented Programming (Java)',
    code: 'OOP-101',
    semester: 'Semester 1 & 3',
    level: 'UG',
    year: '2025 – Present',
    description:
        'Introduces the principles of Object-Oriented Programming using Java. '
        'Students learn to design and develop programs using classes, objects, '
        'inheritance, polymorphism, abstraction, and encapsulation. '
        'Emphasizes real-world problem solving through OOP design patterns.',
    topics: [
      'Classes & Objects',
      'Constructors & Methods',
      'Inheritance & Method Overriding',
      'Polymorphism & Abstraction',
      'Interfaces & Packages',
      'Exception Handling',
      'Collections Framework',
      'File I/O in Java',
    ],
    driveUrl: '', // ← Google Drive link અહીં મૂકો
  ),

  Course(
    name: 'Computer Networks',
    code: 'CN-201',
    semester: 'Semester 2 & 4',
    level: 'UG / PG',
    year: '2025 – Present',
    description:
        'Covers the fundamental concepts of computer networking including '
        'network models, protocols, and data communication. '
        'Students gain understanding of how the internet works, '
        'from physical transmission to application-layer protocols like HTTP and DNS.',
    topics: [
      'OSI & TCP/IP Models',
      'Data Link Layer & Framing',
      'IP Addressing & Subnetting',
      'Routing Algorithms (RIP, OSPF)',
      'TCP vs UDP',
      'DNS, HTTP, FTP Protocols',
      'Network Security Basics',
      'Wireless Networks & Wi-Fi',
    ],
    driveUrl: '', // ← Google Drive link અહીં મૂકો
  ),

  Course(
    name: 'Programming Fundamentals',
    code: 'PF-101',
    semester: 'Semester 1',
    level: 'UG',
    year: '2025 – Present',
    description:
        'An introductory course for first-year students covering the basics '
        'of programming logic and problem solving. Uses C language to teach '
        'core concepts like variables, loops, functions, and arrays. '
        'Builds a strong foundation for all future programming courses.',
    topics: [
      'Introduction to Programming & C',
      'Variables, Data Types & Operators',
      'Conditional Statements (if/else, switch)',
      'Loops (for, while, do-while)',
      'Functions & Recursion',
      'Arrays & Strings',
      'Pointers & Memory',
      'Structures & File Handling',
    ],
    driveUrl: '', // ← Google Drive link અહીં મૂકો
  ),

  Course(
    name: 'Mobile App Development',
    code: 'MAD-401',
    semester: 'Semester 7',
    level: 'UG',
    year: '2025 – Present',
    description:
        'Focuses on building cross-platform mobile applications using Flutter. '
        'Students learn Dart programming, UI design with Flutter widgets, '
        'state management, and Firebase integration. '
        'Course includes hands-on mini-projects and a final app submission.',
    topics: [
      'Dart Language Basics',
      'Flutter Widgets & Layouts',
      'Stateful & Stateless Widgets',
      'Navigation & Routing',
      'State Management (Provider/Riverpod)',
      'Firebase Auth & Firestore',
      'REST API Integration',
      'App Deployment (Play Store / Web)',
    ],
    driveUrl: '', // ← Google Drive link અહીં મૂકો
  ),
];
