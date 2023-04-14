// ignore: depend_on_referenced_packages
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:offcourse/models/course.dart';
import 'package:offcourse/pages/nav_pages/success.dart';
import 'package:offcourse/widgets/defaultAppBar.dart';
import 'package:offcourse/widgets/stickyLabel.dart';

import '../additional/colors.dart';

class PaymentDetails extends StatefulWidget {
  var selectedCourse;
  PaymentDetails({Key? key, required this.selectedCourse}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late CourseModel course;
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "John Travolta",
      bankName = "ICICI Bank",
      cvv = "456";

  @override
  void initState() {
    super.initState();
    course = widget.selectedCourse;
    print(course);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Payment",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            StickyLabel(text: "Card Information"),
            SizedBox(height: 8.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: Color(0xFF808080),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Perosnal Card",
                            style: TextStyle(fontSize: 18.0)),
                        Container(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color: Color(0xFFFF8084), size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF808080),
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF808080),
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF808080),
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF808080),
                                ),
                              ),
                              Text(
                                cvv,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        backgroundColor: Color(0xFF303030).withOpacity(0.2),
                      ),
                      child: Text(
                        "Edit Detail",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () => print("Edit Detail"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Success(selectedCourse: course),
                    ),
                  );
                  //Add course to users array of courses
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('28.789 Tenge',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )),
            // child: ListView.separated(
            //   shrinkWrap: true,
            //   itemCount: paymentDetailList.length,
            //   itemBuilder: (context, index) {
            //     return Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           paymentDetailList[index].date,
            //           style: TextStyle(
            //             fontSize: 16.0,
            //             color: Color(0xFF808080),
            //           ),
            //         ),
            //         Container(
            //           width: 190.0,
            //           child: Text(
            //             paymentDetailList[index].details,
            //             style: TextStyle(fontSize: 16.0),
            //           ),
            //         ),
            //         Container(
            //           width: 70.0,
            //           child: Text(
            //             "\$ ${paymentDetailList[index].amount}",
            //             style: TextStyle(
            //               fontSize: 16.0,
            //               color: paymentDetailList[index].textColor,
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            //   separatorBuilder: (context, index) {
            //     return Divider(
            //       thickness: 0.5,
            //       color: Color(0xFF808080),
            //     );
            //   },
            // ),

            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
