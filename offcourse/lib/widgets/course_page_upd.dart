import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/models/course2.dart';
import 'package:offcourse/uiTestFiles/components/_search_filter_view.dart';
import 'package:offcourse/widgets/course_details.dart';

String textShrink(String text, int characters) {
  if (text.length > characters) {
    text = text.substring(0, characters) + "..";
  }

  return text;
}

class CoursePageUPD extends StatefulWidget {
  final TextEditingController searchController;
  final List<CourseModel2> courses;

  const CoursePageUPD(
      {Key? key, required this.searchController, required this.courses})
      : super(key: key);

  @override
  State<CoursePageUPD> createState() => _CoursePageUPDState();
}

class _CoursePageUPDState extends State<CoursePageUPD> {
  final CourseController2 courseController = CourseController2();
  late Future<List<CourseModel2>> courses;
  late List<CourseModel2> allCourses;
  late List<CourseModel2> filteredCourses;

  @override
  void initState() {
    super.initState();
    courses = courseController.getCourses();
  }

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
            child: ListView.builder(
              padding: EdgeInsets.only(top: 5.0, bottom: 0),
              itemCount: widget.courses.length,
              itemBuilder: (context, index) {
                CourseModel2 course = widget.courses[index];
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
              },
            ),
          ),
        ],
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
    return Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 10.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseDetail(
                selectedCourse: course,
                assetPath: imgPath,
                teacher: teachers,
                about: about,
                duration: duration,
                language: language,
                audience: audience,
                requirements: requirements,
                name: name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 2.0,
              ),
            ],
            color: AppColors.accentColor1,
          ),
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
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Varela',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          text: 'Duration ',
                          style: TextStyle(
                            color: AppColors.pressableText,
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                          ),
                          children: [
                            TextSpan(
                              text: duration,
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Varela',
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        textShrink(about, 70),
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Varela',
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        color: Color(0xFFEBEBEB),
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String textShrink(String text, int characters) {
    if (text.length > characters) {
      text = text.substring(0, characters) + "..";
    }
    return text;
  }
}
