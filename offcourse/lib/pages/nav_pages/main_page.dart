import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/pages/authentification/authentificate.dart';
import 'package:offcourse/pages/authentification/login_page.dart';
import 'package:offcourse/pages/nav_pages/catalog_page.dart';
import 'package:offcourse/pages/nav_pages/my_courses.dart';
import 'package:offcourse/pages/nav_pages/profile.dart';
import 'package:offcourse/pages/welcome_page.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    HomePage(),
    CatalogPage(),
    MyCoursesPage(),
    Authentificate(),
    // Условия перехода на страницу профиля если юзер залогинин
    // ProfilePage(),
  ];

  void onItem_Tapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        bottomNavigationBar:
            // BottomBar(
            //   selectedIndex: selectedIndex,
            //   onItem_Tapped: onItem_Tapped,
            // ),
            BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Catalog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: 'My Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue[600],
          unselectedItemColor: Colors.black,
          onTap: onItem_Tapped,
        ));
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: IndexedStack(
  //       index: selectedIndex,
  //       children: pages,
  //     ),
  //   );
  // }
}
