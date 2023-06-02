import 'package:flutter/material.dart';
import 'package:offcourse/uiTestFiles/details/detail_page.dart';
import 'package:get/get.dart';

import '_build_category_card.dart';
import '_build_popular_card.dart';

ListView category(categories) {
  return ListView.builder(
      padding: const EdgeInsets.only(left: 0),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        print(
            'CategoryCategoryCategoryCategoryCategoryCategoryCategoryCategoryCategory');
        print(category.runtimeType);
        return GestureDetector(
          onTap: () => {Get.to(ProductDetail)},
          child: buildPopularCard(categories[index]),
        );
      });
}

// GridView mostPopularCategory(context, categories) {
//   return GridView.count(
//     crossAxisCount: 2,
//     children: List.generate(categories.length, (index) {
//       return GestureDetector(
//         onTap: () => Get.to(ProductDetail(product: categories[index])),
//         child: buildCard(categories[index]),
//       );
//     }),
//   );
// }
