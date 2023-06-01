import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/models/teachers.dart';
import 'package:offcourse/widgets/course_detail_card.dart';
import 'package:offcourse/widgets/course_page_upd.dart';
import 'package:offcourse/widgets/payment.dart';

import '../models/course2.dart';
import '../pages/nav_pages/main_page.dart';

class CourseDetail extends StatelessWidget {
  final assetPath,
      teacher,
      name,
      about,
      duration,
      language,
      audience,
      requirements;

  var selectedCourse;

  final TeacherController teacherController = TeacherController();
  Future<teacherModel> teachers = TeacherController().getTeacherById('');

  // Stream<List<teacherModel>> getCourseTeachersStream(String id) {
  //   return FirebaseFirestore.instance
  //       .collection('Teachers')
  //       .doc(id)
  //       .snapshots()
  //       .map((documentSnapshot) {
  //     List<dynamic> data = documentSnapshot.data()!['teachers'];
  //     return data.map((teacher) => teacherModel.fromMap(teacher)).toList();
  //   });
  // }

  CourseDetail(
      {Key? key,
      required this.selectedCourse,
      this.assetPath,
      this.teacher,
      this.name,
      this.about,
      this.duration,
      this.language,
      this.audience,
      this.requirements})
      : super(key: key);

  late CourseModel2 course = selectedCourse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(textShrink(name, 25),
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: ListView(children: [
              IntrinsicHeight(
                  child: Hero(
                      tag: name,
                      child: Image.asset(assetPath, fit: BoxFit.contain))),
              SizedBox(height: 20.0),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                  child: Column(children: [
                    IntrinsicHeight(
                        child: Center(
                      child: Text(name,
                          style: TextStyle(
                              color: AppColors.black,
                              fontFamily: 'Varela',
                              fontSize: 24.0)),
                    )),
                    SizedBox(height: 20.0),
                    IntrinsicHeight(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: AppColors.offWhite,
                          borderRadius: BorderRadius.circular(12.5),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(10, 20),
                                blurRadius: 10,
                                spreadRadius: 0,
                                color: AppColors.accentColor2.withOpacity(.05)),
                          ],
                        ),
                        child: Text(about,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 18.0,
                                color: AppColors.black)),
                      ),
                    )
                  ])),
              SizedBox(height: 10.0),
              SizedBox(
                //Teacher
                height: 50,
                child: Container(
                  height: 100,
                  child: Builder(
                    // itemCount: teacher.length,
                    // itemBuilder: (BuildContext context, int index) {
                    builder: (BuildContext context) {
                      return Scaffold(
                          body: FutureBuilder<teacherModel>(
                              future:
                                  teacherController.getTeacherById(teacher[0]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  teacherModel teachers_data = snapshot.data!;
                                  print(
                                      '9999999999999999999999999999999999999999999999999999999999999999999999');
                                  print(teacher[0]);
                                  print(teachers_data.runtimeType);
                                  return Container(
                                      //TeacherLine
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15.0),
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CourseDetail(
                                                          selectedCourse:
                                                              course,
                                                          assetPath: assetPath,
                                                          teacher: teachers,
                                                          about: about,
                                                          duration: duration,
                                                          language: language,
                                                          audience: audience,
                                                          requirements:
                                                              requirements,
                                                          name: name)));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 75,
                                          padding: const EdgeInsets.all(15.0),
                                          decoration: BoxDecoration(
                                            color: AppColors.offWhite,
                                            borderRadius:
                                                BorderRadius.circular(12.5),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(10, 20),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  color: AppColors.accentColor2
                                                      .withOpacity(.05)),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Lenturer',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              const Spacer(),
                                              Text(teachers_data.name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ));
                                } else if (snapshot.hasError) {
                                  throw snapshot.error!;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }));

                      //
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              detailLine(text1: 'Language', text2: language),
              SizedBox(height: 5.0),
              detailLine(text1: 'Audience', text2: audience),
              SizedBox(height: 5.0),
              detailLine(text1: 'Requirements', text2: requirements),
              // IntrinsicHeight(
              //     child: Container(
              //   padding: const EdgeInsets.only(
              //     left: 15.0,
              //     right: 15.0,
              //   ),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     padding: const EdgeInsets.only(
              //       left: 15.0,
              //       right: 15.0,
              //     ),
              //     decoration: BoxDecoration(
              //       color: AppColors.offWhite,
              //       borderRadius: BorderRadius.circular(12.5),
              //       boxShadow: [
              //         BoxShadow(
              //             offset: const Offset(10, 20),
              //             blurRadius: 10,
              //             spreadRadius: 0,
              //             color: AppColors.accentColor2.withOpacity(.05)),
              //       ],
              //     ),
              //     child: Column(
              //       children: [
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         const Text(
              //           'Requirements',
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //               color: Colors.black87,
              //               fontWeight: FontWeight.w900,
              //               fontSize: 18),
              //         ),
              //         SizedBox(height: 5.0),
              //         Text(requirements,
              //             textAlign: TextAlign.start,
              //             style: TextStyle(
              //                 fontFamily: 'Varela',
              //                 fontSize: 18.0,
              //                 color: AppColors.black)),
              //       ],
              //     ),
              //   ),
              // )),
              SizedBox(height: 5.0),
              detailLine(text1: 'Duration', text2: duration),
            ])),
        SizedBox(height: 20.0),
        Positioned(
          left: 0,
          right: 0,
          bottom: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () async {
                final isSubscriber =
                    await checkUserSubscription(); // check if the user is a subscriber
                if (isSubscriber != null) {
                  if (isSubscriber) {
                    final updatedUser = await addUserCourse(
                        course); // add course to user's enrolled courses
                    // navigate to course details page with updated user data
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  } else {
                    // navigate to payment details page to complete payment
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentDetails(
                          selectedCourse: course,
                        ),
                      ),
                    );
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('Enroll',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Varela',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Future<bool?> checkUserSubscription() async {
    final User user = FirebaseAuth.instance.currentUser!;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    final doc = await userRef.get();
    if (doc.exists) {
      return doc.data()?['isSubscriber'];
    }

    return null;
  }

  addUserCourse(CourseModel2 course) {
    final User user =
        FirebaseAuth.instance.currentUser!; // get current user object
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
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
}
