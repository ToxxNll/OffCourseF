import 'package:flutter/material.dart';

class StickyLabel extends StatelessWidget {
  final String text;
  const StickyLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 24.0,
        top: 16.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black12,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
