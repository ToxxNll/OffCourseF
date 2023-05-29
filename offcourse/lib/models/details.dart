import 'package:cloud_firestore/cloud_firestore.dart';

class detailModel {
  String _id;
  String _about;
  String _audience;
  String _teacher;
  String _course;
  String _duration;
  String _language;
  String _requirements;

  detailModel(this._id, this._about, this._audience, this._teacher,
      this._course, this._duration, this._language, this._requirements);

  String get id => _id;
  String get about => _about;
  String get audience => _audience;
  String get teacher => _teacher;
  String get course => _course;
  String get duration => _duration;
  String get language => _language;
  String get requirements => _requirements;

  factory detailModel.fromMap(Map<String, dynamic> map) {
    return detailModel(
      map['id'],
      map['about'],
      map['audience'],
      map['teacher'],
      map['course'],
      map['duration'],
      map['language'],
      map['requirements'],
    );
  }
  Map<String, dynamic> toMap() {
    // updated toMap() method
    return {
      'id': _id,
      'about': _about,
      'audience': _audience,
      'teacher': _teacher,
      'course': _course,
      'duration': _duration,
      'language': _language,
      'requirements': _requirements
    };
  }
}

class CourseController {
  final DocumentReference _coursesCollection = FirebaseFirestore.instance
      .collection('Courses')
      .doc('hr5CVJHw0jUXA2GeECbJ');
  late CollectionReference _courseCatalogCollection;

  Future<void> initializeDetailsCollection() async {
    _courseCatalogCollection = _coursesCollection.collection('Details');
  }

  Future<List<detailModel>> getDetails() async {
    await initializeDetailsCollection();
    final QuerySnapshot querySnapshot = await _courseCatalogCollection.get();
    List<detailModel> courses = [];
    querySnapshot.docs.forEach((doc) {
      courses.add(detailModel(
          doc.get('id'),
          doc.get('about'),
          doc.get('teacher'),
          doc.get('course'),
          doc.get('duration'),
          doc.get('language'),
          doc.get('added'),
          doc.get('requirements')));
    });
    return courses;
  }

  Future<void> addDetail(detailModel detail) async {
    await _courseCatalogCollection.add({
      'id': detail.id,
      'about': detail.about,
      'audience': detail.audience,
      'teacher': detail.teacher,
      'course': detail.course,
      'duration': detail.duration,
      'language': detail.language,
      'requirements': detail.requirements
    });
  }

  // Future<void> updateCourse(detailModel detail) async {
  //   await _coursesCollection.doc(course.name).update({
  //     'teacher': course.teacher,
  //     'img': course.img,
  //     'added': course.added,
  //     'isFavourite': course.isFavourite
  //   }).catchError((error) => print('Failed to update course: $error'));
  // }

  // Future<void> deleteCourse(String name) async {
  //   await _coursesCollection
  //       .doc(name)
  //       .delete()
  //       .catchError((error) => print('Failed to delete course: $error'));
  // }
}
