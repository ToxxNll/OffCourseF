import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offcourse/additional/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

Future<String?> _getUserName() async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final DocumentSnapshot userDoc = await users.doc(user.uid).get();
    final String? userName = userDoc.get('name');
    return userName;
  }
  return null;
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser!;

  // @override
  // Future<void> initState() async {
  //   super.initState();
  //   if (user != null) {
  //     final CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');
  //     final DocumentSnapshot userDoc = await users.doc(user?.uid).get();
  //     final String? userName = userDoc.get('name');
  //     print('User name: $userName');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String?>(
              future: _getUserName(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.hasData) {
                  return Text("Hello! ${snapshot.data}");
                } else {
                  return Text("Loading...");
                }
              },
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: AppColors.mainColor,
              child: Text(
                "Sign Out",
                style: TextStyle(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
