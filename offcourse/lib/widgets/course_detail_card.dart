import 'package:flutter/material.dart';

import '../additional/colors.dart';

class detailLine extends StatelessWidget {
  final String text1;
  final String text2;

  const detailLine({required this.text1, required this.text2, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      //   child: Container(
      // padding: const EdgeInsets.only(
      //   left: 15.0,
      //   right: 15.0,
      // ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: AppColors.accentColor2.withOpacity(.05)),
            ],
          ),
          child: Row(children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              Icons.accessibility_new_outlined, // Replace with the desired icon
              color: Colors.black87,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  text2,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ])),
      // )
    );
  }
}
