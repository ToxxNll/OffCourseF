import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../additional/colors.dart';
import 'course_details.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(children: <Widget>[
        StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("Courses").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final snap = snapshot.data!.docs;

                return Container(
                    padding: EdgeInsets.only(right: 15.0),
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - 50.0,
                    child: GridView.count(
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        ListView.builder(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
                          itemCount: snap.length,
                          itemBuilder: (context, index) {
                            return _buildCard(
                                snap[index]['name'],
                                snap[index]['teacher'],
                                snap[index]['img'],
                                snap[index]['added'],
                                snap[index]['isFavourite'],
                                context);
                          },
                        )
                      ],
                    ));
              } else {
                return const SizedBox();
              }
            })
      ]),
    );
  }
  //   body: ListView(
  //     children: <Widget>[
  //       SizedBox(height: 15.0),
  //       Container(
  //           padding: EdgeInsets.only(right: 15.0),
  //           width: MediaQuery.of(context).size.width - 30.0,
  //           height: MediaQuery.of(context).size.height - 50.0,
  //           child: GridView.count(
  //             crossAxisCount: 2,
  //             primary: false,
  //             crossAxisSpacing: 10.0,
  //             mainAxisSpacing: 15.0,
  //             childAspectRatio: 0.8,
  //             children: <Widget>[
  //               StreamBuilder<QuerySnapshot>(
  //                   stream: FirebaseFirestore.instance
  //                       .collection("Courses")
  //                       .snapshots(),
  //                   builder: (BuildContext context,
  //                       AsyncSnapshot<QuerySnapshot> snapshot) {
  //                     if (snapshot.hasData) {
  //                       final snap = snapshot.data!.docs;

  //                       return ListView.builder(
  //                         padding: EdgeInsets.only(
  //                             top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
  //                         itemCount: snap.length,
  //                         itemBuilder: (context, index) {
  //                           return _buildCard(
  //                               snap[index]['name'],
  //                               snap[index]['teacher'],
  //                               snap[index]['img'],
  //                               snap[index]['added'],
  //                               snap[index]['isFavourite'],
  //                               context);
  //                         },
  //                       );
  //                     } else {
  //                       return const SizedBox();
  //                     }
  //                   })
  //               // _buildCard('Course Sample', 'Teacher1',
  //               //     'img/course_sample.jpg', false, false, context),
  //               // _buildCard('Course Sample1', 'Teacher2',
  //               //     'img/course_sample.jpg', false, false, context),
  //               // _buildCard('Course Sample2', 'Teacher3',
  //               //     'img/course_sample.jpg', false, false, context),
  //               // _buildCard('Course Sample3', 'Teacher4',
  //               //     'img/course_sample.jpg', false, false, context)
  //             ],
  //           )),
  //       SizedBox(height: 15.0)
  //     ],
  //   ),
  // );

  Widget _buildCard(String name, String teacher, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetail(
                      assetPath: imgPath, teacher: teacher, name: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite_border,
                                    color: AppColors.mainColor)
                                : Icon(Icons.favorite,
                                    color: AppColors.mainColor)
                          ])),
                  Hero(
                      tag: name,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(teacher,
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: AppColors.mainColor, size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: AppColors.mainColor,
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.shopping_basket,
                                  color: AppColors.mainColor, size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: AppColors.mainColor,
                                      fontSize: 12.0)),
                            ]
                          ]))
                ]))));
  }
}
