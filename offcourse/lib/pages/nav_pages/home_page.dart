import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Course App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display courses
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Courses',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Display course cards
                  // Replace this with your own code to display course cards
                  Text('Course Cards'),
                ],
              ),
            ),

            // Display speculative news/trends
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Speculative News/Trends',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Display news/trend cards
                  // Replace this with your own code to display news/trend cards
                  Text('News/Trend Cards'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
