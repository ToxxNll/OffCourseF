import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/models/course2.dart';
import 'package:offcourse/uiTestFiles/components/constant.dart';
import 'package:offcourse/uiTestFiles/models/Product.dart';
import 'package:offcourse/uiTestFiles/components/_star_rating.dart'
    show showStarRating;

buildCard(CourseModel2 course) {
  return
      // IntrinsicHeight(child:
      Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
      elevation: 4,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GridTile(
          header: Padding(
            padding: const EdgeInsets.all(12),
            child: imageIcon(course),
          ),
          footer: _buildPriceRating(course),
          child: Container(),
        ),
      ),
    ),
  );
  // );
}

Text textShrink(String text, int characters) {
  if (text.length > characters) {
    text = text.substring(0, characters) + "..";
  }

  return Text(text);
}

Padding _buildPriceRating(CourseModel2 course) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(course),
        const SizedBox(height: 8),
        showStarRating(3.0, AppColors.pressableText)
      ],
    ),
  );
}

Text description(CourseModel2 course) {
  return textShrink(course.about, 20);
}

// Column _title(CourseModel2 course) {
//   return Column(
//     children: [
//       Text(
//         course.name,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const Spacer(),
//       Text(
//         course.duration,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.blue,
//         ),
//       )
//     ],
//   );
// }

Row _title(CourseModel2 course) {
  return Row(
    children: [
      Text(
        course.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      Text(
        '10000',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      )
    ],
  );
}

Image imageIcon(CourseModel2 course) {
  return Image.asset(
    course.img,
    fit: BoxFit.cover,
    height: 100,
    width: 100,
  );
}
