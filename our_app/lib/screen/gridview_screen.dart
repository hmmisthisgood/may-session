import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  // crossAxisSize= aspectRatio * mainAxisSize
  /// veritcal= 3main

  List icons = [Icons.calendar_month, Icons.camera];
  List colors = [Colors.white, Colors.blue];
  List names = ["Calendar"];

  List<List> combinedList = [
    [Icons.camera, Colors.white, "Calendar"],
    [Icons.camera, Colors.white, "Calendar"],
    [Colors.white, Icons.camera, "Calendar"],
  ];

  List<Map<String, dynamic>> data = [
    {"color": Colors.red, "icon": Icons.home, "title": "Cal"},
    {"icon": Icons.camera_alt, "title": "Camera", "color": Colors.purple},
    {"color": Colors.blue, "icon": Icons.alarm, "title": "Clock"},
    {"color": Colors.black, "icon": Icons.contact_support, "title": "Contacts"},
    {"color": Colors.orange, "icon": Icons.file_copy_sharp, "title": "Files"},
    {"color": Colors.blue, "icon": Icons.flutter_dash, "title": "first_app"},
    {"color": Colors.green, "icon": Icons.browse_gallery, "title": "Gallery"},
    {"color": Colors.grey, "icon": Icons.location_on, "title": "Maps"},
    {"color": Colors.yellow, "icon": Icons.message, "title": "Messaging"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {
      "color": Color.fromRGBO(255, 235, 59, 1),
      "icon": Icons.settings,
      "title": "Settings"
    },
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
    {"color": Colors.yellow, "icon": Icons.settings, "title": "Settings"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid view")),
      body: GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1 // 0.6 , 0.033, 3
            // maxCrossAxisExtent: 70,
            ),
        itemBuilder: (context, index) {
          final item = data[index];
          final bgColor = item["color"];
          final title = item['title'];
          final iconName = item['icon'];

          return Container(
            // height: 50,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            // color: Colors.green,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: bgColor),
                child: Icon(
                  iconName,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Icons.home,
              Text(title),
              // Text("I am home"),
            ]),
          );
        },
      ),
    );
  }
}
