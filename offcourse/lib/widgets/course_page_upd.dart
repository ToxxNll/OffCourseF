import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/models/course2.dart';
import '../additional/colors.dart';
import 'course_details.dart';

String textShrink(String text, int characters) {
  if (text.length > characters) {
    text = text.substring(0, characters) + "..";
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
            return ListView(padding: EdgeInsets.only(right: 5.0), children: [
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
    );
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
