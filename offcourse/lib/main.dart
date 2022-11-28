import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/pages/nav_pages/catalog_page.dart';
import 'package:offcourse/pages/nav_pages/home_page.dart';
import 'package:offcourse/pages/nav_pages/main_page.dart';
import 'package:offcourse/pages/nav_pages/my_courses.dart';
import 'package:offcourse/pages/nav_pages/profile.dart';
import 'package:offcourse/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}
