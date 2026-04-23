import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_colors.dart';
import '../data/courses_data.dart';
import '../widgets/section_title.dart';
import '../widgets/course_card.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 80,
      ),
      color: AppColors.surfaceAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Courses Taught'),
          FadeInUp(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 2.5 : 3,
              ),
              itemCount: coursesList.length,
              itemBuilder: (_, i) => CourseCard(course: coursesList[i]),
            ),
          ),
        ],
      ),
    );
  }
}
