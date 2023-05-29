// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class CourseController extends GetxController {
//   final firebaseInstance = FirebaseFirestore.instance;
//   Map courseData = {
//     'name': '',
//     'teacher': '',
//     'img': '',
//     'added': '',
//     'isFavourite': ''
//   };  
//   void onReady() {
//     super.onReady();
//     getCourseData();
  

//   Future<void> getCourseData() async {
//     try {
//       var response = await firebaseInstance.collection('Courses').get();

//       if (response.docs.length > 0) {
//         courseData['name'] = response.docs[0]['name'];
//         courseData['teacher'] = response.docs[0]['teacher'];
//         courseData['img'] = response.docs[0]['img'];
//         courseData['added'] = response.docs[0]['added'];
//         courseData['isFavourite'] = response.docs[0]['isFavourite'];
//       }
//       print(courseData);
//     } on FirebaseException catch (e) {
//       print(e);
//     } catch (error) {
//       print(error);
//     }
//   }
// }

// class CourseModel {
//   static const ID = "uid";
//   static const EMAIL = "email";

//   String _name;
//   String _teacher;
//   String _img;
//   bool _added;
//   bool _isFavorite;

// //  getters
//   String get name => _name;
//   String get teacher => _teacher;
//   String get img => _img;
//   bool get added => _added;
//   bool get isFavorite => _isFavorite;

//   Query courseRef = FirebaseDatabase.instance.reference().child('courses');

//   courseRef.onValue.listen((event) {
//     DataSnapshot snapshot = event.snapshot;
//     if (snapshot.value != null) {
//       Map<dynamic, dynamic> values = snapshot.value;
//       List<Course> courses = values.values.map((value) => Course.fromSnapshot(value)).toList();
//       // Do something with the list of courses
//     }
//   }) {
//   // TODO: implement listen
//   throw UnimplementedError();
//   }


//   CourseModel.fromSnapshot(DocumentSnapshot snapshot) {
//     _name = snapshot.data()['name'];
//     _teacher = snapshot.data()['teacher'];
//     _img = snapshot.data()['img'];
//     // _id = snapshot.data()];
//   }
// }
// }