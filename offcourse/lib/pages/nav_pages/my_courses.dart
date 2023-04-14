import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      return Container();
    } else if (_isSubscribed) {
      return Scaffold(
          appBar: AppBar(
            title: Text('My Courses'),
          ),
          body: ListView(
            padding: EdgeInsets.only(left: 20.0),
            children: <Widget>[
              SizedBox(height: 15.0),
              Text('The courses you participate in',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 15.0),
              Container(
                height: MediaQuery.of(context).size.height - 150.0,
                child: EnrolledCoursePage(),
              ),
            ],
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Courses'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // open paywall here
            },
            child: Text('Subscribe to unlock courses'),
          ),
        ),
      );
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
