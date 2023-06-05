import 'package:flutter/material.dart';
import 'package:offcourse/models/category.dart';
import 'package:offcourse/models/course2.dart';
import 'package:offcourse/uiTestFiles/components/_search_filter_view.dart';
import 'package:offcourse/widgets/course_page.dart';
import 'package:offcourse/widgets/category_page.dart';
import 'package:offcourse/widgets/course_page_upd.dart';

import '../../additional/colors.dart';
import '../../uiTestFiles/components/_action_bar.dart';
import '../../uiTestFiles/components/constant.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  late Future<List<CourseModel2>> courseFuture;
  late Future<List<CourseModel2>> filteredCourses;
  late Future<List<categoryModel>> categoryFuture;
  late Future<List<categoryModel>> filteredCategories;
  late TabController _tabController;
  TextEditingController searchController = TextEditingController();

  void _filterCoursesAndCategories(String query) {
    setState(() {
      filteredCategories = categoryFuture.then((categories) {
        return categories.where((category) {
          final name = category.name.toLowerCase();
          final searchQuery = query.toLowerCase();
          return name.contains(searchQuery);
        }).toList();
      });
    });
    filteredCourses = courseFuture.then((courses) {
      return courses.where((course) {
        final title = course.name.toLowerCase();
        final author = course.duration.toLowerCase();
        final searchQuery = query.toLowerCase();
        return title.contains(searchQuery) || author.contains(searchQuery);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    courseFuture = CourseController2().getCourses();
    categoryFuture = CategoryController().getCategories();
  }

  @override
  void dispose() {
    searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor: AppColors.white,
                title: Text(
                  'Catalog',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                pinned: true,
                floating: true,
                // Add any other SliverAppBar properties as needed
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: kSpace),
                    SearchField(
                      searchController: searchController,
                      onSearchTextChanged: _filterCoursesAndCategories,
                    ),
                    const SizedBox(height: kSpace),
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      labelColor: AppColors.mainColor,
                      isScrollable: false,
                      labelPadding: EdgeInsets.only(right: 45.0),
                      unselectedLabelColor: Color(0xFFCDCDCD),
                      tabs: [
                        Tab(
                          child: Text(
                            'Catalog',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FutureBuilder<List<CourseModel2>>(
                        future: courseFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<CourseModel2> courses = snapshot.data!;
                            List<CourseModel2> filteredCourses = courses;
                            if (searchController.text.isNotEmpty) {
                              filteredCourses = courses.where((course) {
                                final title = course.name.toLowerCase();
                                final author = course.duration.toLowerCase();
                                final searchQuery =
                                    searchController.text.toLowerCase();
                                return title.contains(searchQuery) ||
                                    author.contains(searchQuery);
                              }).toList();
                            }
                            print(filteredCourses.runtimeType);
                            return CoursePageUPD(
                              searchController: searchController,
                              courses: filteredCourses,
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      FutureBuilder<List<categoryModel>>(
                        future: categoryFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<categoryModel> categories = snapshot.data!;
                            List<categoryModel> filteredCategories = categories;
                            if (searchController.text.isNotEmpty) {
                              filteredCategories = categories.where((category) {
                                final title = category.name.toLowerCase();
                                final searchQuery =
                                    searchController.text.toLowerCase();
                                return title.contains(searchQuery);
                              }).toList();
                            }
                            return CategoryPage(
                                categories: filteredCategories,
                                searchController: searchController);
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
