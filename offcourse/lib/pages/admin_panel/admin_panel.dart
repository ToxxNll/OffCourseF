import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:offcourse/pages/admin_panel/admin_page.dart';
import 'package:offcourse/pages/admin_panel/dashboard_page.dart';
import 'package:offcourse/pages/admin_panel/manage_courses.dart';
import 'package:offcourse/pages/admin_panel/manage_users.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});
  static const String id = 'admin-panel';

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  Widget _selectedWidget = DashboardPage();

  currentPage(item) {
    switch (item.route) {
      case DashboardPage.id:
        setState(() {
          _selectedWidget = DashboardPage();
        });
        break;
      case ManageCourses.id:
        setState(() {
          _selectedWidget = ManageCourses();
        });
        break;
      case ManageUsers.id:
        setState(() {
          _selectedWidget = ManageUsers();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: const Text('Admin Panel')),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardPage.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Manage Users',
            route: ManageUsers.id,
            icon: Icons.person,
          ),
          AdminMenuItem(
            title: 'Manage Courses',
            route: ManageCourses.id,
            icon: Icons.book,
          ),
          AdminMenuItem(
            title: 'Manage Partners',
            route: DashboardPage.id,
            icon: Icons.person_pin,
          ),

          // AdminMenuItem(
          //   title: 'Top Level',
          //   icon: Icons.file_copy,
          //   children: [
          //     AdminMenuItem(
          //       title: 'Second Level Item 1',
          //       route: '/secondLevelItem1',
          //     ),
          //     AdminMenuItem(
          //       title: 'Second Level Item 2',
          //       route: '/secondLevelItem2',
          //     ),
          //     AdminMenuItem(
          //       title: 'Third Level',
          //       children: [
          //         AdminMenuItem(
          //           title: 'Third Level Item 1',
          //           route: '/thirdLevelItem1',
          //         ),
          //         AdminMenuItem(
          //           title: 'Third Level Item 2',
          //           route: '/thirdLevelItem2',
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
        selectedRoute: AdminPanel.id,
        onSelected: (item) {
          currentPage(item);
          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        //   header: Container(
        //     height: 50,
        //     width: double.infinity,
        //     color: const Color(0xff444444),
        //     child: const Center(
        //       child: Text(
        //         'header',
        //         style: TextStyle(
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        //   footer: Container(
        //     height: 50,
        //     width: double.infinity,
        //     color: const Color(0xff444444),
        //     child: const Center(
        //       child: Text(
        //         'footer',
        //         style: TextStyle(
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
      ),
      body: SingleChildScrollView(
        child: _selectedWidget,
        // Container(
        //   alignment: Alignment.topLeft,
        //   padding: const EdgeInsets.all(10),
        //   child: const Text(
        //     'Dashboard',
        //     style: TextStyle(
        //       fontWeight: FontWeight.w700,
        //       fontSize: 36,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
