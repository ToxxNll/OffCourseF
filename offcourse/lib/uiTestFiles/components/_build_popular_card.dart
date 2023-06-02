import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offcourse/models/category.dart';
import 'package:offcourse/uiTestFiles/details/detail_page.dart';
import 'package:offcourse/uiTestFiles/models/Product.dart';
import 'dart:math' as math;

buildPopularCard(categoryModel category) {
  return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        // onTap: () {
        //   Get.to(ProductDetail(product: product));
        // },
        child: _productCard(category),
      ));
}

Card _productCard(categoryModel category) {
  print(
      'CategoryCategoryCategoryCategoryCategoryCategoryCategoryCategoryCategory');
  print(category.runtimeType);
  return Card(
    elevation: 8,
    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(0.80),
    child: GridTile(
      child: Column(
        children: [
          _imageIcon(category),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _title(category),
          ),
        ],
      ),
    ),
  );
}

Text _title(categoryModel category) {
  return Text(
    category.name,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Container _imageIcon(categoryModel category) {
  return Container(
    height: 90,
    width: 120,
    padding: const EdgeInsets.all(10),
    child: Image.asset(
      category.img,
      fit: BoxFit.cover,
      height: 90,
      width: 120,
    ),
  );
}
