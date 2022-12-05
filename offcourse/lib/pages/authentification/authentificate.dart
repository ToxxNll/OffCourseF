import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:offcourse/pages/authentification/login_page.dart';
import 'package:offcourse/pages/authentification/registration_login.dart';

import '../nav_pages/profile.dart';

class Authentificate extends StatelessWidget {
  const Authentificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ProfilePage();
          } else {
            return RegLog();
          }
        }),
      ),
    );
  }
}
