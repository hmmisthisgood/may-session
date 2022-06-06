import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/my_custom_icons.dart';
import 'gridview_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.allura(
            textStyle: TextStyle(color: Colors.black),
          ),
          // style: TextStyle(color: Colors.black, fontFamily: "Allura"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.settings,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.black.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TabBar(
              indicatorColor: Colors.red,
              indicatorWeight: 0.00001,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              // isScrollable: true,
              tabs: [
                // Text("Home"),
                // Text("Games"),
                // Text("Movies"),
                // Text("Home"),
                // Text("Games"),
                // Text("Movies"),
                // Text("Home"),
                // Text("Games"),
                Icon(
                  Fontisto.nav_icon_grid_a,
                  size: 35,
                ),
                Icon(
                  Icons.menu_outlined,
                  size: 35,
                ),
                Icon(
                  MyCustomIcons.apps,
                  size: 35,
                ),
                Icon(
                  MyCustomIcons.user,
                  size: 35,
                ),
              ],
              onTap: (index) {
                print("tab $index pressed");
                // currentTab = index;
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                GridViewScreen(),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Color.fromRGBO(100, 100, 150, 1),
                ),
                Container(
                  color: Color(0xffd2c4df),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
