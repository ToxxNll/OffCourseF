import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "uid";
  static const EMAIL = "email";

  late String _id;
  late String _email;

//  getters
  String get email => _email;
  String get id => _id;

  // UserModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   _email = snapshot.data()['Identifier'];
  //   // _id = snapshot.data()];
  // }
}
