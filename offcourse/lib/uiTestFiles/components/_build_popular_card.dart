import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offcourse/uiTestFiles/details/detail_page.dart';
import 'package:offcourse/uiTestFiles/models/Product.dart';
import 'dart:math' as math;

buildPopularCard(Product product) {
  return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetail(product: product));
        },
        child: _productCard(product),
      ));
}

Card _productCard(Product product) {
  return Card(
    elevation: 8,
    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(0.80),
    child: GridTile(
      child: Column(
        children: [
          _imageIcon(product),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _title(product),
          ),
        ],
      ),
    ),
  );
}

Text _title(Product product) {
  return Text(
    product.title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Container _imageIcon(Product product) {
  return Container(
    height: 90,
    width: 120,
    padding: const EdgeInsets.all(10),
    child: Image.asset(
      product.image,
      fit: BoxFit.cover,
      height: 90,
      width: 120,
    ),
  );
}
