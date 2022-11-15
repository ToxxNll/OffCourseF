import 'package:flutter/material.dart';
import 'package:offcourse/widgets/applarge_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcomeImg.png", "welcomeImg.png", "welcomeImg.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Row(children: [
      //   Column(
      //     children: const [
      //       OutlinedButton(
      //           onPressed: null,
      //           child: Text(
      //             "Зарегистрироваться",
      //             style: TextStyle(
      //               color: Colors.black54,
      //             ),
      //           )),
      //     ],
      //   ),
      // ]),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: ((context, index) {
          return Container(
              alignment: Alignment.bottomCenter,
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Visibility(
                  visible: (index == images.length - 1),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.20,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: AppLargreText(
                                text: "Каталог",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8.0),
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: AppLargreText(
                                text: "Войти",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
              // Container(
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //       Column(children: const [
              //         OutlinedButton(
              //             onPressed: null,
              //             child: Text(
              //               "Каталог курсов",
              //               style: TextStyle(
              //                 color: Colors.black54,
              //               ),
              //             ))
              //       ]),
              //       Column(
              //         children: const [
              //           OutlinedButton(
              //               onPressed: null,
              //               child: Text(
              //                 "Зарегистрироваться",
              //                 style: TextStyle(
              //                   color: Colors.black54,
              //                 ),
              //               )),
              //         ],
              //       )
              //     ]))
              );
        }),
      ),
    );
  }
}
