import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:offcourse/models/teachers.dart';

class CourseModel2 {
  String _id;
  String _name;
  List<dynamic> _teachers;
  // List<teacherModel> _teachers;
  String _img;
  String _about;
  String _audience;
  String _duration;
  String _language;
  String _requirements;
  CourseModel2(
    this._id,
    this._name,
    this._teachers,
    this._img,
    this._about,
    this._audience,
    this._duration,
    this._language,
    this._requirements,
  );

  String get id => _id;
  String get name => _name;
  List get teachers => _teachers;
  String get img => _img;
  String get about => _about;
  String get audience => _audience;
  String get duration => _duration;
  String get language => _language;
  String get requirements => _requirements;

  factory CourseModel2.fromMap(Map<String, dynamic> map) {
    return CourseModel2(
      map['id'],
      map['name'],
      map['teachers'],
      map['img'],
      map['about'],
      map['audience'],
      map['duration'],
      map['language'],
      map['requirements'],
    );
  }
  Map<String, dynamic> toMap() {
    // updated toMap() method
    return {
      'id': _id,
      'name': _name,
      'teachers': _teachers,
      'img': _img,
      'about': _about,
      'audience': _audience,
      'duration': _duration,
      'language': _language,
      'requirements': _requirements
    };
  }
}

class CourseController2 {
  final DocumentReference _coursesCollection = FirebaseFirestore.instance
      .collection('Courses')
      .doc('hr5CVJHw0jUXA2GeECbJ');
  late CollectionReference _courseCatalogCollection;

  Future<void> initializeCourseCatalogCollection() async {
    _courseCatalogCollection = _coursesCollection.collection('course_catalog');
  }

  Future<List<CourseModel2>> getCourses() async {
    await initializeCourseCatalogCollection();
    final QuerySnapshot querySnapshot = await _courseCatalogCollection.get();
    List<CourseModel2> courses = [];
    querySnapshot.docs.forEach((doc) {
      courses.add(CourseModel2(
          doc.get('id'),
          doc.get('name'),
          doc.get('teachers'),
          doc.get('img'),
          doc.get('about'),
          doc.get('audience'),
          doc.get('duration'),
          doc.get('language'),
          doc.get('requirements')));
    });
    return courses;
  }

  List<String>? teachersList(List<dynamic>? teacher) {
    List<String> teachers = [];
    for (var teacher in teachers) {
      if (teacher is String) {
        teachers.add(teacher);
      }
    }
    return teachers;
  }

  Future<void> addCourse(CourseModel2 course) async {
    await _courseCatalogCollection.add({
      'name': course.name,
      'teacher': course.teachers,
      'img': course.img,
    });
  }

  Future<void> updateCourse(CourseModel2 course) async {
    await _courseCatalogCollection.doc(course.name).update({
      'teacher': course.teachers,
      'img': course.img,
    }).catchError((error) => print('Failed to update course: $error'));
  }

  Future<void> deleteCourse(String name) async {
    await _courseCatalogCollection
        .doc(name)
        .delete()
        .catchError((error) => print('Failed to delete course: $error'));
  }
}
