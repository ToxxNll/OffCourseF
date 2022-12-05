import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/pages/authentification/authentificate.dart';
import 'package:offcourse/pages/authentification/login_page.dart';
import 'package:offcourse/pages/nav_pages/catalog_page.dart';
import 'package:offcourse/pages/nav_pages/my_courses.dart';
import 'package:offcourse/pages/nav_pages/profile.dart';

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
}

// class BottomBar extends StatelessWidget {
//   final selectedIndex;

//   final VoidCallback onItem_Tapped;

//   // ignore: non_constant_identifier_names
//   const BottomBar({Key? key, this.selectedIndex, required this.onItem_Tapped})
//       : super(key: key);

//   final primaryColor = const Color(0xff4338CA);
//   final secondaryColor = const Color(0xff6D28D9);
//   final accentColor = const Color(0xffffffff);
//   final backgroundColor = const Color(0xffffffff);
//   final errorColor = const Color(0xffEF4444);

//   static List<Widget> pages = <Widget>[
//     MyHomePage(),
//     CatalogPage(),
//     MyCoursesPage(),
//     ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.white,
//       child: SizedBox(
//         height: 56,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconBottomBar(
//                   text: "Search",
//                   icon: Icons.search_outlined,
//                   selected: false,
//                   onItem_Tapped: onItem_Tapped),
//               IconBottomBar(
//                   text: "Home",
//                   icon: Icons.home,
//                   selected: false,
//                   onItem_Tapped: onItem_Tapped),
//               IconBottomBar(
//                   text: "Cart",
//                   icon: Icons.local_grocery_store_outlined,
//                   selected: false,
//                   onItem_Tapped: onItem_Tapped),
//               IconBottomBar(
//                   text: "Calendar",
//                   icon: Icons.date_range_outlined,
//                   selected: false,
//                   onItem_Tapped: onItem_Tapped)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IconBottomBar extends StatelessWidget {
//   const IconBottomBar(
//       {Key? key,
//       required this.text,
//       required this.icon,
//       required this.selected,
//       required this.onItem_Tapped})
//       : super(key: key);
//   final String text;
//   final IconData icon;
//   final bool selected;
//   final Function() onItem_Tapped;

//   final primaryColor = const Color(0xff4338CA);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: onItem_Tapped,
//           icon: Icon(
//             icon,
//             size: 25,
//             color: selected ? primaryColor : Colors.black54,
//           ),
//         ),
//       ],
//     );
//   }
// }
