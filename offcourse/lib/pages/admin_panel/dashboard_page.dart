import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../additional/colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const String id = 'dashboard-page';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Dashboard page',
        style: TextStyle(fontSize: 30, color: AppColors.mainColor),
      ),
    );
  }
}
