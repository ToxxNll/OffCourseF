import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/widgets/payment.dart';

import '../models/course2.dart';
import '../pages/nav_pages/main_page.dart';

class CourseDetail extends StatelessWidget {
  final assetPath, teacher, name;

  var selectedCourse;

  CourseDetail(
      {Key? key,
      required this.selectedCourse,
      this.assetPath,
      this.teacher,
      this.name})
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
        title: Text(name,
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
        ListView(children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532))),
          ),
          SizedBox(height: 15.0),
          Hero(
              tag: name,
              child: Image.asset(assetPath,
                  height: 150.0, width: 100.0, fit: BoxFit.contain)),
          SizedBox(height: 20.0),
          Center(
            child: SizedBox(
              height:
                  100.0, // Specify a fixed height for the ListView container
              child: ListView.builder(
                itemCount: teacher.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    course.teachers[index],
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  );
                },
              ),
            ),
            // Text(teacher,
            //     style: TextStyle(
            //         fontFamily: 'Varela',
            //         fontSize: 22.0,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.mainColor)),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(name,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                  'An excellent course that we recommend everyone to take. You will gain a ton of knowledge and also strengthen the existing knowledge.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))),
            ),
          )
        ]),
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
                padding: EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width,
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Color(0xFFF17532),
      //   child: Icon(Icons.fastfood),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
