import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/pages/authentification/authentificate.dart';
import 'package:offcourse/pages/authentification/registration_login.dart';
import 'package:offcourse/pages/nav_pages/main_page.dart';
import 'package:offcourse/uiTestFiles/components/_action_bar.dart';
import 'package:offcourse/uiTestFiles/components/_search_filter_view.dart';
import 'package:offcourse/uiTestFiles/components/constant.dart';
import 'package:offcourse/widgets/payment.dart';
import 'package:offcourse/widgets/paymentWithoutCourse.dart';

import '../../widgets/enrolledCourse_page.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  State<MyCoursesPage> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCoursesPage> {
  bool _isSignedIn = false;
  bool _isSubscribed = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _isSignedIn = user != null;
      });
      if (_isSignedIn) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map<String, dynamic> data =
                documentSnapshot.data() as Map<String, dynamic>;
            setState(() {
              _isSubscribed = data['isSubscriber'];
            });
          }
        }).catchError((error) {
          print(error);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isSignedIn) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.accentColor1, Colors.white],
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('img/mycourses.png'),
                SizedBox(height: 20.0),
                Text(
                  'Sign up or sign in to enroll for courses',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Authentificate(),
                          maintainState: false),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text('Authorize',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Varela',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () async {
                //     final isSubscriber =
                //         await checkUserSubscription(); // check if the user is a subscriber
                //     if (isSubscriber != null) {
                //       if (isSubscriber) {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(builder: (context) => MainPage()),
                //         );
                //       } else {
                //         // navigate to payment details page to complete payment
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => PaymentDetailsWC(),
                //           ),
                //         );
                //       }
                //     }
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(10),
                //     width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.height * 0.07,
                //     decoration: BoxDecoration(
                //         color: AppColors.mainColor,
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Center(
                //       child: Text('Enroll',
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontFamily: 'Varela',
                //               fontSize: 25.0,
                //               fontWeight: FontWeight.bold)),
                //     ),
                //   ),
                // ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );
    } else if (_isSubscribed) {
      return Scaffold(
          body: ListView(
              padding: EdgeInsets.only(left: 20.0, top: 50),
              children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // buildActionBar('Catalog'),
                // const SizedBox(height: kSpace),
                // buildSearchRow(),
                // const SizedBox(height: kSpace),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.1),
                              spreadRadius: 1.0,
                              blurRadius: 2.0)
                        ], color: AppColors.offWhite),
                    child: Text('The courses you participate in',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))),
                SizedBox(height: 15.0),
                Container(
                  height: MediaQuery.of(context).size.height - 150.0,
                  child: EnrolledCoursePage(),
                ),
              ],
            )
          ]));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('My Courses'),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.accentColor1, Colors.white],
              ),
            ),
            child: Center(
              child: Card(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('img/mycourses.png'),
                    SizedBox(height: 20.0),
                    Text(
                      'Sign up or sign in to enroll for courses',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () async {
                        final isSubscriber =
                            await checkUserSubscription(); // check if the user is a subscriber
                        if (isSubscriber != null) {
                          if (isSubscriber) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                            );
                          } else {
                            // navigate to payment details page to complete payment
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentDetailsWC(),
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
                          child: Text('Authorize',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () async {
                    //     final isSubscriber =
                    //         await checkUserSubscription(); // check if the user is a subscriber
                    //     if (isSubscriber != null) {
                    //       if (isSubscriber) {
                    //         Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(builder: (context) => MainPage()),
                    //         );
                    //       } else {
                    //         // navigate to payment details page to complete payment
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => PaymentDetailsWC(),
                    //           ),
                    //         );
                    //       }
                    //     }
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.all(10),
                    //     width: MediaQuery.of(context).size.width,
                    //     height: MediaQuery.of(context).size.height * 0.07,
                    //     decoration: BoxDecoration(
                    //         color: AppColors.mainColor,
                    //         borderRadius: BorderRadius.circular(12)),
                    //     child: Center(
                    //       child: Text('Enroll',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontFamily: 'Varela',
                    //               fontSize: 25.0,
                    //               fontWeight: FontWeight.bold)),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ));
    }
  }
}



















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/enrolledCourse_page.dart';

// class MyCoursesPage extends StatefulWidget {
//   const MyCoursesPage({Key? key}) : super(key: key);

//   @override
//   State<MyCoursesPage> createState() => _MyCoursesState();
// }

// class _MyCoursesState extends State<MyCoursesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Courses'),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseAuth.instance.currentUser != null
//             ? FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(FirebaseAuth.instance.currentUser!.uid)
//                 .get()
//             : Future.value(null),
//         builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('You are not signed in.'));
//           } else {
//             bool isSubscribed = snapshot.data!.get('isSubscriber');
//             return isSubscribed
//                 ? ListView(
//                     padding: EdgeInsets.only(left: 20.0),
//                     children: <Widget>[
//                         SizedBox(height: 20),
//                         EnrolledCoursePage(),
//                       ],
//                   )
//                 : Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // open paywall here
//                       },
//                       child: Text('Subscribe to unlock courses'),
//                     ),
//                   );
//           }
//         },
//       ),
//     );
//   }
// }
