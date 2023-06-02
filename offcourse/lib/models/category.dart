import 'package:cloud_firestore/cloud_firestore.dart';

import 'course2.dart';

class categoryModel {
  String _name;
  String _img;
  List<dynamic> _courses;

  categoryModel(this._name, this._img, this._courses);

  String get name => _name;
  String get img => _img;
  List<dynamic> get courses => _courses;

  factory categoryModel.fromMap(Map<String, dynamic> map) {
    return categoryModel(
      map['name'],
      map['img'],
      map['courses'],
    );
  }
  Map<String, dynamic> toMap() {
    // updated toMap() method
    return {
      'name': _name,
      'img': _img,
      'courses': _courses,
    };
  }
}

class CategoryController {
  final DocumentReference _coursesCollection = FirebaseFirestore.instance
      .collection('Courses')
      .doc('hr5CVJHw0jUXA2GeECbJ');
  late CollectionReference _categoryCollection;

  Future<void> initializeCourseCatalogCollection() async {
    _categoryCollection = _coursesCollection.collection('category');
  }

  Future<List<categoryModel>> getCategories() async {
    await initializeCourseCatalogCollection();
    final QuerySnapshot querySnapshot = await _categoryCollection.get();
    List<categoryModel> category_course = [];
    querySnapshot.docs.forEach((doc) {
      category_course.add(
          categoryModel(doc.get('name'), doc.get('img'), doc.get('courses')));
    });
    return category_course;
  }

  void initializeCourse(categoryModel? selectedCategory) {
    categoryModel? category = selectedCategory;
    List<CourseModel2>? teachers_str =
        CategoryController().courseList(category?.courses);
  }

  List<CourseModel2>? courseList(dynamic? teacher) {
    List<CourseModel2> courses = [];
    for (var course in courses) {
      if (course is String) {
        courses.add(course);
      }
    }
    return courses;
  }
  // Future<categoryModel> getTeacherById(
  //     String teacherId, CourseModel2? selectedCourse) async {
  //   initializeCourse(selectedCourse);
  //   final DocumentSnapshot snapshot =
  //       await _categoryCollection.doc(teacherId).get();
  //   if (snapshot.exists) {
  //     return categoryModel(
  //       snapshot.get('name'),
  //       snapshot.get('img'),
  //     );
  //   } else {
  //     throw Exception('Teacher not found');
  //   }
  // }

  // Future<categoryModel> getTeacherById(String teacherId) async {
  //   final DocumentSnapshot snapshot =
  //       await _categoryCollection.doc(teacherId).get();
  //   if (snapshot.exists) {
  //     return categoryModel(
  //         snapshot.get('name'), snapshot.get('img'), snapshot.get('courses'));
  //   } else {
  //     throw Exception('Teacher not found');
  //   }
  // }

  Future<void> addCourse(categoryModel teacher) async {
    await _categoryCollection.add({
      'name': teacher.name,
      'img': teacher.img,
    });
  }

  Future<void> updateCourse(categoryModel teacher) async {
    await _categoryCollection.doc(teacher.name).update({
      'img': teacher.img,
    }).catchError((error) => print('Failed to update course: $error'));
  }

  Future<void> deleteCourse(String name) async {
    await _categoryCollection
        .doc(name)
        .delete()
        .catchError((error) => print('Failed to delete course: $error'));
  }
}
