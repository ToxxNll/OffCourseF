import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:offcourse/pages/nav_pages/home_page.dart';

Row buildActionBar(String text) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      // GestureDetector(
      //   onTap: () => Get.to(const HomePage()),
      //   child: const Icon(
      //     CupertinoIcons.profile_circled,
      //     size: 45,
      //   ),
      // ),
    ],
  );
}
