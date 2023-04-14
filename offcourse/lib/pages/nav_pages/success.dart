import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offcourse/models/user.dart';
import 'package:offcourse/pages/nav_pages/main_page.dart';
import 'package:offcourse/pages/nav_pages/my_courses.dart';
import 'package:offcourse/widgets/course_details.dart';

import '../../models/course.dart';

class Success extends StatefulWidget {
  var selectedCourse;
  Success({Key? key, required this.selectedCourse}) : super(key: key);
  @override
  _SuccessState createState() => _SuccessState();
}

const String success = 'img/success.gif';

class EmptySection extends StatelessWidget {
  final String emptyImg, emptyMsg;
  const EmptySection({
    Key? key,
    required this.emptyImg,
    required this.emptyMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(emptyImg),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              emptyMsg,
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF303030),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessState extends State<Success> {
  late CourseModel course;
  @override
  void initState() {
    super.initState();
    course = widget.selectedCourse;
    print(course.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: 'img/success.gif',
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          DefaultButton(
              btnText: 'Ok',
              onPressed: () async {
                // Get the selected course from the navigation arguments
                // final CourseModel selectedCourse =
                //     ModalRoute.of(context)!.settings.arguments as CourseModel;

                // print(selectedCourse.toMap());
                // Get the current user
                final User user = FirebaseAuth.instance.currentUser!;
                print(user);
                final courseMap = course.toMap();
                // Update the array of courses in the user object
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .update({
                  'enrolledCourses': FieldValue.arrayUnion([course.toMap()]),
                  'isSubscriber': true,
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    Key? key,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        subTitleText,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  const DefaultButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFF8084),
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
