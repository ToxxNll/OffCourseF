import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import '../additional/colors.dart';
import 'course_details.dart';

class CoursePageV2 extends StatelessWidget {
  final CourseController courseController = CourseController();
  Future<List<CourseModel>> courses = CourseController().getCourses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: FutureBuilder<List<CourseModel>>(
        future: courseController.getCourses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CourseModel> courses = snapshot.data!;

            return Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 100.0,
              child: GridView.count(
                crossAxisCount: 1,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: List.generate(courses.length, (index) {
                  CourseModel course = courses[index];
                  return _buildCard(
                    course,
                    course.name,
                    course.teacher,
                    course.img,
                    course.added,
                    course.isFavourite,
                    context,
                  );
                }),
              ),
            );
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

  Widget _buildCard(course, String name, String teacher, String imgPath,
      bool added, bool isFavourite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetail(
                      selectedCourse: course,
                      assetPath: imgPath,
                      teacher: teacher,
                      name: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavourite
                                ? Icon(Icons.favorite_border,
                                    color: AppColors.mainColor)
                                : Icon(Icons.favorite,
                                    color: AppColors.mainColor)
                          ])),
                  Hero(
                      tag: name,
                      child: Container(
                          height: 150.0,
                          width: 150 * 1.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(teacher,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                ]))));
  }
}
