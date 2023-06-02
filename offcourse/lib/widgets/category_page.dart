import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/uiTestFiles/models/CourseCategory.dart';
import 'package:offcourse/widgets/categoryToCourse.dart';
import '../additional/colors.dart';
import '../models/category.dart';
import 'course_details.dart';

class CategoryPage extends StatelessWidget {
  final CourseController courseController = CourseController();
  Future<List<CourseModel>> courses = CourseController().getCourses();
  final CategoryController categoryController = CategoryController();
  Future<List<categoryModel>> categories = CategoryController().getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: FutureBuilder<List<categoryModel>>(
        future: categoryController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<categoryModel> categories = snapshot.data!;

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
                children: List.generate(categories.length, (index) {
                  categoryModel category = categories[index];
                  return _buildCard(
                    category,
                    category.name,
                    category.img,
                    category.category_courses,
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

  Widget _buildCard(category, String name, String imgPath,
      List<dynamic> category_courses, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryToCourseDetail(
                      selectedCategory: category,
                      assetPath: imgPath,
                      category_courses: category_courses,
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
