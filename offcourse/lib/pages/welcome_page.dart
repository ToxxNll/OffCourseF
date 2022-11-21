import 'package:flutter/material.dart';
import 'package:offcourse/widgets/app_text.dart';
import 'package:offcourse/widgets/applarge_text.dart';
import 'package:offcourse/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcomeImg.png", "welcomeImg.png", "welcomeImg.png"];

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: ((context, index) {
          return Stack(children: <Widget>[
            Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargreText(text: "Welcome to OffCourse"),
                        AppText(
                            text:
                                "Here you can find Loreum ipsium asdasdjn kjasndkansd kjsad")
                      ],
                    )
                  ],
                )),
            Container(
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
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: ResponsiveButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  height:
                                      MediaQuery.of(context).size.width * 0.20,
                                  text: "Каталог",
                                )),
                          ),
                          Expanded(
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: ResponsiveButton(
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    height: MediaQuery.of(context).size.width *
                                        0.20,
                                    text: "Войти",
                                  )))
                        ],
                      ),
                    )))
          ]);
        }),
      ),
    );
  }
}
