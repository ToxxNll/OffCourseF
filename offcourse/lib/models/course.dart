import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  String _name;
  String _teacher;
  String _img;
  bool _added;
  bool _isFavourite;

  CourseModel(
      this._name, this._teacher, this._img, this._added, this._isFavourite);

  String get name => _name;
  String get teacher => _teacher;
  String get img => _img;
  bool get added => _added;
  bool get isFavourite => _isFavourite;
}

class CourseController {
  final CollectionReference _coursesCollection =
      FirebaseFirestore.instance.collection('Courses');

  Future<List<CourseModel>> getCourses() async {
    final QuerySnapshot querySnapshot = await _coursesCollection.get();
    List<CourseModel> courses = [];
    querySnapshot.docs.forEach((doc) {
      courses.add(CourseModel(doc.get('name'), doc.get('teacher'),
          doc.get('img'), doc.get('added'), doc.get('isFavourite')));
    });
    return courses;
  }

  Future<void> addCourse(CourseModel course) async {
    await _coursesCollection.add({
      'name': course.name,
      'teacher': course.teacher,
      'img': course.img,
      'added': course.added,
      'isFavourite': course.isFavourite
    });
  }

  Future<void> updateCourse(CourseModel course) async {
    await _coursesCollection.doc(course.name).update({
      'teacher': course.teacher,
      'img': course.img,
      'added': course.added,
      'isFavourite': course.isFavourite
    }).catchError((error) => print('Failed to update course: $error'));
  }

  Future<void> deleteCourse(String name) async {
    await _coursesCollection
        .doc(name)
        .delete()
        .catchError((error) => print('Failed to delete course: $error'));
  }
}
