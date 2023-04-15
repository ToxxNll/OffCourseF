import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:offcourse/pages/nav_pages/home_page.dart';

Row buildActionBar() {
  return Row(
    children: [
      const Text(
        'Discover',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () => Get.to(const HomePage()),
        child: const Icon(
          CupertinoIcons.profile_circled,
          size: 45,
        ),
      ),
    ],
  );
}
