import 'package:flutter/material.dart';

import '../additional/colors.dart';

class detailLine extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;

  const detailLine(
      {required this.text1, required this.text2, required this.icon, Key? key})
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
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              icon, // Replace with the desired icon
              color: Colors.black87,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                IntrinsicHeight(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          text1,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ))),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    text2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ])),
      // )
    );
  }
}
