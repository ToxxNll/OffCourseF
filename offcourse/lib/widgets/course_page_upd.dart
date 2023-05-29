import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/models/course2.dart';
import '../additional/colors.dart';
import 'course_details.dart';

String textShrink(String text) {
  if (text.length > 100) {
    text = text.substring(0, 100) + "..";
  }

  return text;
}

class CoursePageUPD extends StatelessWidget {
  final CourseController2 courseController = CourseController2();
  Future<List<CourseModel2>> courses = CourseController2().getCourses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: FutureBuilder<List<CourseModel2>>(
        future: courseController.getCourses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CourseModel2> courses = snapshot.data!;
            print('-----------------------------------------------------');
            print(courses);
            return Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: List.generate(courses.length, (index) {
                  CourseModel2 course = courses[index];
                  return _buildCard(
                    course,
                    course.name,
                    course.teachers,
                    course.img,
                    course.about,
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

  Widget _buildCard(course, String name, List teachers, String imgPath,
      String about, context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetail(
                      selectedCourse: course,
                      assetPath: imgPath,
                      teacher: teachers,
                      name: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ], color: Colors.white),
                child: Row(children: [
                  // Padding(
                  //     padding: EdgeInsets.all(5.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           isFavourite
                  //               ? Icon(Icons.favorite_border,
                  //                   color: AppColors.mainColor)
                  //               : Icon(Icons.favorite,
                  //                   color: AppColors.mainColor)
                  //         ])),
                  Hero(
                      tag: name,
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  // Container(
                  //   height:
                  //       100.0, // Specify a fixed height for the ListView container
                  //   child: ListView.builder(
                  //     itemCount: teachers.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Text(
                  //         course.teachers[index],
                  //         style: TextStyle(
                  //           color: AppColors.mainColor,
                  //           fontFamily: 'Varela',
                  //           fontSize: 14.0,
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.height * 0.4,
                          child: Text(textShrink(about),
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontFamily: 'Varela',
                                  fontSize: 14.0))),
                      Container(
                          child: Text(name,
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontFamily: 'Varela',
                                  fontSize: 14.0))),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Container(color: Color(0xFFEBEBEB), height: 1.0)),
                    ],
                  )
                  // Padding(
                  //     padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           if (!added) ...[
                  //             Icon(Icons.shopping_basket,
                  //                 color: AppColors.mainColor, size: 12.0),
                  //             Text('Add to cart',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: AppColors.mainColor,
                  //                     fontSize: 12.0))
                  //           ],
                  //           if (added) ...[
                  //             Icon(Icons.shopping_basket,
                  //                 color: AppColors.mainColor, size: 12.0),
                  //             Text('Add to cart',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: AppColors.mainColor,
                  //                     fontSize: 12.0)),
                  //           ]
                  //         ]))
                ]))));
  }
}
