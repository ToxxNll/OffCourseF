import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offcourse/pages/welcome_page.dart';
import 'package:offcourse/uiTestFiles/components/_body.dart';
import 'package:offcourse/uiTestFiles/models/_res_files.dart';

import '../../models/category.dart';
import '../../models/course2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CourseController2 courseController = CourseController2();
  Future<List<CourseModel2>> courses = CourseController2().getCourses();

  final CategoryController categoryController = CategoryController();
  Future<List<categoryModel>> categories = CategoryController().getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder<List<categoryModel>>(
        future: categoryController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<categoryModel> categories = snapshot.data!;
            print('-----------------------------------------------------');
            print(categories);
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: detailBody(categories, context),
              ),
            );

            // ListView(padding: EdgeInsets.only(right: 5.0), children: [
            //   Column(
            //     children: List.generate(categories.length, (index) {
            //       CourseModel2 course = courses[index];

            //       print(course.teachers);
            //       return _buildCard(
            //         course,
            //         course.name,
            //         course.teachers,
            //         course.img,
            //         course.about,
            //         course.audience,
            //         course.language,
            //         course.requirements,
            //         course.duration,
            //         context,
            //       );
            //     }),
            //   ),
            // ]);
          } else if (snapshot.hasError) {
            throw snapshot.error!;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
