import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/uiTestFiles/models/CourseCategory.dart';
import 'package:offcourse/widgets/categoryToCourse.dart';
import '../additional/colors.dart';
import '../models/category.dart';
import 'course_details.dart';
import 'dart:math' as math;

class CategoryPage extends StatefulWidget {
  final TextEditingController searchController;
  final List<categoryModel> categories;

  const CategoryPage(
      {Key? key, required this.searchController, required this.categories})
      : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CourseController courseController = CourseController();
  Future<List<CourseModel>> courses = CourseController().getCourses();
  final CategoryController categoryController = CategoryController();
  // Future<List<categoryModel>> categories = CategoryController().getCategories();
  late Future<List<categoryModel>> categories;
  late List<categoryModel> allCourses;
  late List<categoryModel> filteredCourses;
  late Color randomColor;

  @override
  void initState() {
    super.initState();
    randomColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(0.80);
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color(0xFFFCFAF8),
  //     body: FutureBuilder<List<categoryModel>>(
  //       future: categoryController.getCategories(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           List<categoryModel> categories = snapshot.data!;

  //           return Container(
  //               width: MediaQuery.of(context)
  //                   .size
  //                   .width, // Adjust the width as per your requirement
  //               height: MediaQuery.of(context).size.height,
  //               child: GridView.count(
  //                 // childAspectRatio: 0.8,
  //                 crossAxisCount: 3,
  //                 padding: EdgeInsets.all(5.0),
  //                 children: List.generate(categories.length, (index) {
  //                   categoryModel category = categories[index];
  //                   return
  //                 }),
  //               ));
  //         } else if (snapshot.hasError) {
  //           throw snapshot.error!;
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(5.0),
              children: List.generate(
                widget.categories.length,
                (index) {
                  categoryModel category = widget.categories[index];
                  return _buildCard(
                    // itemCount: widget.categories.length,
                    // itemBuilder: (context, index) {
                    //   categoryModel category = widget.categories[index];

                    category,
                    category.name,
                    category.img,
                    category.category_courses,
                    context,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(category, String name, String imgPath,
      List<dynamic> category_courses, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: Container(
            // width: 200, // Adjust the width as per your requirement
            // height: 100,
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
                    child: Card(
                  elevation: 8,
                  color: randomColor.withOpacity(0.80),
                  child: GridTile(
                    child: Column(
                      children: [
                        _imageIcon(imgPath),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _title(name),
                        ),
                      ],
                    ),
                  ),
                )))));
  }
}

Container _imageIcon(String imgPath) {
  return Container(
    height: 90,
    width: 120,
    padding: const EdgeInsets.all(10),
    child: Image.asset(
      imgPath,
      fit: BoxFit.cover,
      height: 90,
      width: 120,
    ),
  );
}

Text _title(String name) {
  return Text(
    name,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}
