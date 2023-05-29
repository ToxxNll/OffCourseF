import 'package:flutter/material.dart';
import 'package:offcourse/uiTestFiles/models/CourseCategory.dart';
import 'Product.dart';
import '_payment_cart_model.dart';

class Res {
  static List<Product> fetchProducts() {
    List<Product> productList = [];
    String description =
        "A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they’re compelled to buy";
    productList.add(Product(
        color: Colors.amber.shade900,
        count: "3",
        description: description,
        image: 'img/flutter.jpg',
        info: "",
        price: "5000",
        size: "23/56",
        tag: "",
        title: "Flutter & Dart"));
    productList.add(Product(
        color: Colors.amber.shade900,
        count: "1",
        description: description,
        image: 'img/unity.jpg',
        info: "",
        price: "4000",
        size: "43/506",
        tag: "",
        title: "Unity 3d Game"));
    productList.add(Product(
        color: Colors.amber.shade900,
        count: "30",
        description: description,
        image: 'img/spring.jpg',
        info: "",
        price: "500",
        size: "23/56",
        tag: "",
        title: "Spring Framework"));
    productList.add(Product(
        color: Colors.amber.shade900,
        count: "5",
        description: description,
        image: 'img/php.jpg',
        info: "",
        price: "500",
        size: "23/56",
        tag: "",
        title: "Php , mySql"));
    productList.add(Product(
        color: Colors.amber.shade900,
        count: "5",
        description: description,
        image: 'img/Laravel.jpeg',
        info: "",
        price: "500",
        size: "23/56",
        tag: "",
        title: "Laravel"));
    return productList;
  }

  static List<PayCard> getPaymentTypes() {
    List<PayCard> cards = [];
    cards.add(PayCard(
        title: "Net Banking",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    cards.add(PayCard(
        title: "Credit Card",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    cards.add(PayCard(
        title: "Debit Card",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    cards.add(PayCard(
        title: "Wallet pay",
        description: "Pay bill using card",
        image: "assets/images/paycard.png"));
    return cards;
  }
}
