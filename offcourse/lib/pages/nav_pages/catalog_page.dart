import 'package:flutter/material.dart';
import 'package:offcourse/widgets/course_page.dart';
import 'package:offcourse/widgets/category_page.dart';
import 'package:offcourse/widgets/course_page_upd.dart';

import '../../additional/colors.dart';
import '../../uiTestFiles/components/_action_bar.dart';
import '../../uiTestFiles/components/_search_filter_view.dart';
import '../../uiTestFiles/components/constant.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: Text('Catalog',
        //       style: TextStyle(
        //           fontFamily: 'Varela',
        //           fontSize: 30.0,
        //           color: Color(0xFF545D68))),
        // ),
        body: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView(
        padding: EdgeInsets.only(left: 10.0),
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            buildActionBar('Catalog'),
            const SizedBox(height: kSpace),
            buildSearchRow(),
            const SizedBox(height: kSpace),
          ]),
          SizedBox(height: 5.0),
          // Text('Categories',
          //     style: TextStyle(
          //         fontFamily: 'Varela',
          //         fontSize: 42.0,
          //         fontWeight: FontWeight.bold)),
          // SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: AppColors.mainColor,
              isScrollable: false,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Catalog',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Categories',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                )
              ]),
          Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                //Тут категорий которые в таббере горизонтальном
                CoursePageUPD(),
                CategoryPage(),
              ]))
        ],
      ),
    ));
  }
}
