import 'package:flutter/material.dart';
import 'package:offcourse/models/course2.dart';
import 'package:offcourse/uiTestFiles/details/detail_page.dart';
import 'package:get/get.dart';

import '../../models/teachers.dart';
import '../../widgets/course_details.dart';
import '_build_category_card.dart';
import '_build_popular_card.dart';

ListView category(categories) {
  return ListView.builder(
      padding: const EdgeInsets.only(left: 0),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        print(
            'CategoryCategoryCategoryCategoryCategoryCategoryCategoryCategoryCategory');
        print(category.runtimeType);
        return GestureDetector(
          onTap: () => {Get.to(ProductDetail)},
          child: buildPopularCard(categories[index]),
        );
      });
}

class mostPopularCategory extends StatelessWidget {
  final CourseController2 courseController = CourseController2();
  Future<List<CourseModel2>> courses = CourseController2().getCourses();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<CourseModel2>>(
            future: courseController.getCourses(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CourseModel2> courses = snapshot.data!;
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(courses.length, (index) {
                    CourseModel2 course = courses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CourseDetail(
                                selectedCourse: course,
                                assetPath: course.img,
                                teacher: course.teachers,
                                about: course.about,
                                duration: course.duration,
                                language: course.language,
                                audience: course.audience,
                                requirements: course.requirements,
                                name: course.name)));
                      },
                      child: buildCard(courses[index]),
                    );
                  }),
                );
              } else if (snapshot.hasError) {
                throw snapshot.error!;
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
