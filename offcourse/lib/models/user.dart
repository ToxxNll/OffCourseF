import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/models/course2.dart';

class UserModel {
  static const ID = "uid";
  static const EMAIL = "email";

  late String _id;
  late String _email;
  late String _name;
  late bool _is_Subscriber;
  List<CourseModel2>? _enrolledCourses;

  UserModel(this._id, this._email, this._name, this._is_Subscriber,
      [this._enrolledCourses = const []]);
//  getters
  String get email => _email;
  String get id => _id;
  String get name => _name;
  bool get is_Subscriber => _is_Subscriber;
  List<CourseModel2>? get enrolledCourses => _enrolledCourses;

  // UserModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   _email = snapshot.data()['Identifier'];
  //   // _id = snapshot.data()];
  // }
  Map<String, dynamic> toMap() {
    return {
      ID: _id,
      EMAIL: _email,
      'name': _name,
      'isSubscriber': _is_Subscriber,
      'enrolledCourses': _enrolledCourses,
    };
  }

  Future<List<CourseModel2>?> _getEnrolledCourses() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final DocumentSnapshot userDoc = await users.doc(user.uid).get();
      final List<CourseModel2>? enrolledCourses =
          userDoc.get('enrolledCourses');
      return enrolledCourses;
    }
    return null;
  }

  static Future<String?> _getUserName(User? user) async {
    if (user != null) {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final DocumentSnapshot userDoc = await users.doc(user.uid).get();
      final String? userName = userDoc.get('name');
      return userName;
    }
    return null;
  }

//  static <String?> _getUserName(User? user) async {
//   if (user != null) {
//     final CollectionReference users =
//         FirebaseFirestore.instance.collection('users');
//     final DocumentSnapshot userDoc = await users.doc(user.uid).get();
//     final String? userName = userDoc.get('name');
//     return userName;
//   }
//   return null;
// }

}


//https://www.youtube.com/watch?v=Wsd5gzrrQvA&list=PLmnT6naTGy2SC82FMSCrvZNogg5T1H7iF&index=31
