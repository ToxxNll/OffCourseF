import 'package:cloud_firestore/cloud_firestore.dart';

class teacherModel {
  String _id;
  String _name;
  String _info;

  teacherModel(
    this._id,
    this._name,
    this._info,
  );

  String get id => _id;
  String get name => _name;
  String get info => _info;

  factory teacherModel.fromMap(Map<String, dynamic> map) {
    return teacherModel(
      map['id'],
      map['name'],
      map['teacher'],
    );
  }
  Map<String, dynamic> toMap() {
    // updated toMap() method
    return {
      'id': _id,
      'name': _name,
      'info': _info,
    };
  }
}

class CourseController {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('Teachers');

  Future<List<teacherModel>> getTeacher() async {
    final QuerySnapshot querySnapshot = await _coursesCollection.get();
    List<teacherModel> courses = [];
    querySnapshot.docs.forEach((doc) {
      courses
          .add(teacherModel(doc.get('id'), doc.get('name'), doc.get('info')));
    });
    return courses;
  }

  Future<void> addCourse(teacherModel teacher) async {
    await _coursesCollection.add({
      'name': teacher.name,
      'info': teacher.info,
    });
  }

  Future<void> updateCourse(teacherModel teacher) async {
    await _coursesCollection.doc(teacher.name).update({
      'info': teacher.info,
    }).catchError((error) => print('Failed to update course: $error'));
  }

  Future<void> deleteCourse(String name) async {
    await _coursesCollection
        .doc(name)
        .delete()
        .catchError((error) => print('Failed to delete course: $error'));
  }
}
