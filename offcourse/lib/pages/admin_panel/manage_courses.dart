import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../additional/colors.dart';

class ManageCourses extends StatelessWidget {
  const ManageCourses({super.key});

  static const String id = 'manage-course-page';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Manage Courses',
        style: TextStyle(fontSize: 30, color: AppColors.mainColor),
      ),
    );
  }
}
