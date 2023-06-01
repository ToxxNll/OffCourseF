import 'package:cloud_firestore/cloud_firestore.dart';

import 'course2.dart';

class teacherModel {
  String _name;
  String _info;

  teacherModel(
    this._name,
    this._info,
  );

  String get name => _name;
  String get info => _info;

  factory teacherModel.fromMap(Map<String, dynamic> map) {
    return teacherModel(
      map['name'],
      map['teacher'],
    );
  }
  Map<String, dynamic> toMap() {
    // updated toMap() method
    return {
      'name': _name,
      'info': _info,
    };
  }
}

class TeacherController {
  final CollectionReference _teachersCollection =
      FirebaseFirestore.instance.collection('Teachers');

  Future<List<teacherModel>> getTeacher() async {
    final QuerySnapshot querySnapshot = await _teachersCollection.get();
    List<teacherModel> teachers = [];
    querySnapshot.docs.forEach((doc) {
      teachers.add(teacherModel(doc.get('name'), doc.get('info')));
    });
    return teachers;
  }

  void initializeCourse(CourseModel2? selectedCourse) {
    CourseModel2? course = selectedCourse;
    List<String>? teachers_str =
        CourseController2().teachersList(course?.teachers);
  }

  // Future<teacherModel> getTeacherById(
  //     String teacherId, CourseModel2? selectedCourse) async {
  //   initializeCourse(selectedCourse);
  //   final DocumentSnapshot snapshot =
  //       await _teachersCollection.doc(teacherId).get();
  //   if (snapshot.exists) {
  //     return teacherModel(
  //       snapshot.get('name'),
  //       snapshot.get('info'),
  //     );
  //   } else {
  //     throw Exception('Teacher not found');
  //   }
  // }

  Future<teacherModel> getTeacherById(String teacherId) async {
    final DocumentSnapshot snapshot =
        await _teachersCollection.doc(teacherId).get();
    if (snapshot.exists) {
      return teacherModel(
        snapshot.get('name'),
        snapshot.get('info'),
      );
    } else {
      throw Exception('Teacher not found');
    }
  }

  Future<void> addCourse(teacherModel teacher) async {
    await _teachersCollection.add({
      'name': teacher.name,
      'info': teacher.info,
    });
  }

  Future<void> updateCourse(teacherModel teacher) async {
    await _teachersCollection.doc(teacher.name).update({
      'info': teacher.info,
    }).catchError((error) => print('Failed to update course: $error'));
  }

  Future<void> deleteCourse(String name) async {
    await _teachersCollection
        .doc(name)
        .delete()
        .catchError((error) => print('Failed to delete course: $error'));
  }
}
