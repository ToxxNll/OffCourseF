import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/models/category.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/models/teachers.dart';
import 'package:offcourse/uiTestFiles/components/_action_bar.dart';
import 'package:offcourse/uiTestFiles/components/constant.dart';
import 'package:offcourse/widgets/course_detail_card.dart';
import 'package:offcourse/widgets/course_details.dart';
import 'package:offcourse/widgets/course_page_upd.dart';
import 'package:offcourse/widgets/payment.dart';

import '../models/course2.dart';
import '../pages/nav_pages/main_page.dart';
import '../uiTestFiles/components/_search_filter_view.dart';

class CategoryToCourseDetail extends StatelessWidget {
  final assetPath, name, category_courses;

  var selectedCategory;

  final CourseController2 courseController = CourseController2();
  Future<List<CourseModel2>> courses = CourseController2().getCourses();

  CategoryToCourseDetail(
      {Key? key,
      required this.selectedCategory,
      this.assetPath,
      this.name,
      this.category_courses})
      : super(key: key);

  late categoryModel category = selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: ListView(padding: EdgeInsets.only(left: 10.0), children: <
                Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                buildActionBar('Catalog'),
                const SizedBox(height: kSpace),
                buildSearchRow(),
                const SizedBox(height: kSpace),
              ]),
              Expanded(
                  child: Container(
                height:
                    MediaQuery.of(context).size.height, // Set the height here
                child: FutureBuilder<List<CourseModel2>>(
                  future: courseController.getCourseById(category_courses),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CourseModel2> courses = snapshot.data!;
                      print(
                          '-----------------------------------------------------');
                      print(courses);
                      return ListView(
                          padding: EdgeInsets.only(right: 5.0),
                          children: [
                            Column(
                              children: List.generate(courses.length, (index) {
                                CourseModel2 course = courses[index];

                                print(course.teachers);
                                return _buildCard(
                                  course,
                                  course.name,
                                  course.teachers,
                                  course.img,
                                  course.about,
                                  course.audience,
                                  course.language,
                                  course.requirements,
                                  course.duration,
                                  context,
                                );
                              }),
                            ),
                          ]);
                    } else if (snapshot.hasError) {
                      throw snapshot.error!;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ))
            ])));
  }

  Widget _buildCard(
    course,
    String name,
    String teachers,
    String imgPath,
    String about,
    String audience,
    String language,
    String requirements,
    String duration,
    context,
  ) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 0.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetail(
                      selectedCourse: course,
                      assetPath: imgPath,
                      teacher: teachers,
                      about: about,
                      duration: duration,
                      language: language,
                      audience: audience,
                      requirements: requirements,
                      name: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.1),
                          spreadRadius: 1.0,
                          blurRadius: 2.0)
                    ], color: AppColors.accentColor1),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                          tag: name,
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(imgPath),
                                      fit: BoxFit.contain)))),
                      Padding(
                          padding: EdgeInsets.only(left: 4.0, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Varela',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  )),
                              SizedBox(height: 5.0),
                              Container(
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Duration ',
                                          style: TextStyle(
                                              color: AppColors.pressableText,
                                              fontFamily: 'Varela',
                                              fontSize: 14.0),
                                          children: [
                                    TextSpan(
                                      text: duration,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Varela',
                                          fontSize: 14.0),
                                    )
                                  ]))),
                              SizedBox(height: 5.0),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  // height:
                                  //     MediaQuery.of(context).size.width * 0.035,
                                  child: Text(textShrink(about, 70),
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Varela',
                                          fontSize: 14.0))),
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                      color: Color(0xFFEBEBEB), height: 1.0)),
                            ],
                          ))
                    ]))));
  }
}

Future<bool?> checkUserSubscription() async {
  final User user = FirebaseAuth.instance.currentUser!;
  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

  final doc = await userRef.get();
  if (doc.exists) {
    return doc.data()?['isSubscriber'];
  }

  return null;
}

addUserCourse(CourseModel2 course) {
  final User user =
      FirebaseAuth.instance.currentUser!; // get current user object
  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
  userRef.get().then((doc) async {
    if (doc.exists) {
      bool isSubscriber = doc.data()!['isSubscriber'];
      if (isSubscriber) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'enrolledCourses': FieldValue.arrayUnion([course.toMap()]),
        });
      }

      return isSubscriber;
    }
  });
}
