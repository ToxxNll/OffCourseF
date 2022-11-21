import 'package:flutter/material.dart';
import 'package:offcourse/additional/colors.dart';
import 'package:offcourse/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double? height;
  String text;
  Icon icon;

  ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.width = 48.0,
      this.height = 48.0,
      this.text = '',
      this.icon = const Icon(Icons.settings)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x00F05D40),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          // border: Border.all(),
        ),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: 48.0,
                    height: height,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Align(alignment: Alignment.center, child: icon)),
                Expanded(
                  child: Center(child: AppText(text: text)),
                ),
              ],
            ),
            SizedBox.expand(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );

    // Stack(
    //   children: <Widget>[
    //     Row(children: <Widget>[
    //       Container(
    //           width: width,
    //           height: height,
    //           alignment: Alignment.centerLeft,
    //           decoration: BoxDecoration(
    //             color: AppColors.mainColor,
    //             borderRadius: BorderRadius.all(
    //               Radius.circular(10),
    //             ),
    //           ),
    //           child: Align(alignment: Alignment.center, child: icon)),
    //       Expanded(
    //         child: Center(
    //             child:
    //                 Text(text, style: Theme.of(context).textTheme.headline6)),
    //       ),
    //     ])
    //   ],
    // );

    // Stack(Row(children: <Widget>[
    //   Container(
    //     width: width,
    //     height: height,
    //     alignment: Alignment.centerLeft,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: AppColors.mainColor),
    //     child: Align(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [Image.asset("img/search-alt.svg")],
    //     ),
    //     Expanded(
    //         child: Center(
    //       child: Text("Hellow world",
    //           style: Theme.of(context)
    //               .textTheme
    //               .headline6
    //               .copyWith(color: Colors.black)),
    //     )),
    //   )
    // ]));
  }
}
