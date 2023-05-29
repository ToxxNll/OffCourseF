import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/uiTestFiles/models/CourseCategory.dart';
import '../additional/colors.dart';
import 'course_details.dart';

List<CourseCategory> fetchCourseCategory() {
  List<CourseCategory> categoryList = [];
  String description =
      "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy";
  categoryList.add(CourseCategory(
      count: "3",
      image: '../img/javascript.jpg',
      info: "",
      tag: "Math",
      title: "Math"));
  categoryList.add(CourseCategory(
      count: "1",
      image: '../img/unity.jpg',
      info: "",
      tag: "English",
      title: "English"));
  categoryList.add(CourseCategory(
      count: "30",
      image: '../img/spring.jpg',
      info: "",
      tag: "History",
      title: "History"));
  categoryList.add(CourseCategory(
      count: "5",
      image: '../img/php.jpg',
      info: "",
      tag: "Geography",
      title: "Geography"));
  categoryList.add(CourseCategory(
      count: "5",
      image: '../img/laravel.jpeg',
      info: "",
      tag: "Economics",
      title: "Economics"));
  return categoryList;
}

class CoursePageV2 extends StatelessWidget {
  final CourseController courseController = CourseController();
  Future<List<CourseModel>> courses = CourseController().getCourses();
  List<CourseCategory> coursesCategory = fetchCourseCategory();

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
                childAspectRatio: 2,
                children: List.generate(coursesCategory.length, (index) {
                  CourseCategory coursesCat = coursesCategory[index];
                  return _buildCard(
                    coursesCat,
                    coursesCat.title,
                    coursesCat.tag,
                    coursesCat.image,
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

  Widget _buildCard(
      course, String name, String teacher, String imgPath, context) {
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
                  Hero(
                      tag: name,
                      child: Container(
                          height: 150.0,
                          width: 150 * 5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  Text(teacher,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontFamily: 'Varela',
                          fontSize: 24.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                ]))));
  }
}
