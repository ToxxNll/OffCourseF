import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import '../additional/colors.dart';
import 'course_details.dart';

class EnrolledCoursePage extends StatelessWidget {
  final CourseController courseController = CourseController();
  // Stream<List<CourseModel>> getEnrolledCoursesStream() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .collection('enrolledCourses')
  //       .snapshots()
  //       .map((querySnapshot) {
  //     print('Query snapshot size: ${querySnapshot.size}');
  //     return querySnapshot.docs
  //         .map((doc) => CourseModel.fromMap(doc.data()))
  //         .toList();
  //   });
  // }
  Stream<List<CourseModel>> getEnrolledCoursesStream() {
    final user = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .map((documentSnapshot) {
      List<dynamic> data = documentSnapshot.data()!['enrolledCourses'];
      return data.map((course) => CourseModel.fromMap(course)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: StreamBuilder<List<CourseModel>>(
        stream: getEnrolledCoursesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CourseModel> courses = snapshot.data!;
            print(courses);
            return Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
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
                          height: 75.0,
                          width: 75.0,
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
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: AppColors.mainColor, size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: AppColors.mainColor,
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.shopping_basket,
                                  color: AppColors.mainColor, size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: AppColors.mainColor,
                                      fontSize: 12.0)),
                            ]
                          ]))
                ]))));
  }
}
