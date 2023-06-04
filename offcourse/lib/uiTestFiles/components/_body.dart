import 'package:flutter/material.dart';
import 'package:offcourse/models/category.dart';
import 'package:offcourse/uiTestFiles/components/constant.dart';
import 'package:offcourse/uiTestFiles/models/Product.dart';

import '_action_bar.dart';
import '_categories.dart';
import '_product_category.dart';
import '_search_filter_view.dart';

Column detailBody(List<categoryModel> categories, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildActionBar('Discovery'),
      const SizedBox(height: kSpace),
      // buildSearchRow(),
      const SizedBox(height: kSpace),
      section('Categories'),
      const SizedBox(height: kSpace),
      SizedBox(
        height: 140,
        child: category(categories),
      ),
      const SizedBox(height: kSpace),
      section('Most popular'),
      const SizedBox(height: kSpace),
      Expanded(child: mostPopularCategory())
    ],
  );
}
