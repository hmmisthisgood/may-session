import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screen/gridview_screen.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:our_app/screen/listview_screen.dart';
import 'package:our_app/screen/page_view_screen.dart';
import 'package:our_app/screen/profile_screen.dart';
import 'package:our_app/screen/row_and_columns_screen.dart';
import 'package:our_app/utils/my_custom_icons.dart';

class IgProfileScreen extends StatefulWidget {
  @override
  State<IgProfileScreen> createState() => _IgProfileScreenState();
}

class _IgProfileScreenState extends State<IgProfileScreen> {
  // TabController tabController = TabController(length: 4, vsync: this);
  int currentTab = 0;

  int _activeIndex = 0;

  Widget buildBody() {
    if (_activeIndex == 0) {
      return PageViewScreen();
    }
    if (_activeIndex == 1) {
      return RowAndColumnScreen();
    }
    return ProfileScreen();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              print("active index is : $_activeIndex");
              setState(() {
                _activeIndex = index;
              });
            },
            currentIndex: _activeIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Discover"),
              BottomNavigationBarItem(
                  icon: Icon(MyCustomIcons.user), label: "Profile"),
            ],
          ),
          body: buildBody()),
    );
  }
}

// DefaultTabController
// TabBar
// TabBarView
