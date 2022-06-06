import 'package:flutter/material.dart';
import 'package:our_app/screen/gridview_screen.dart';

class ListViewScreen extends StatelessWidget {
  final image =
      "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg";

  List students = [
    "Madan Bhandari",
    "Prasiddha Chand",
    "Rahul Kumar Thakuri",
    "sujan Bhandari",
    "Madan Bhandari",
    "Prasiddha Chand",
    "Rahul Kumar Thakuri",
    "sujan Bhandari" "Madan Bhandari",
    "Prasiddha Chand",
    "Rahul Kumar Thakuri",
    "sujan Bhandari" "Madan Bhandari",
    "Prasiddha Chand",
    "Rahul Kumar Thakuri",
    "sujan Bhandari",
    "Madan Bhandari",
  ];

  // Map person = {
  //   "nickanmes": [],
  //   "name": "ram bahadur",
  // };

  Widget buildNormalListView() {
    return ListView(
      // scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      // padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
        Image.network(image),
        Image.asset("assets/image/wall.jpg"),
        Image.asset("assets/image/it.jpg"),
        Image.asset("assets/image/captca.png"),
      ],
    );
  }

  Widget buildListViewWithBuilder() {
    return ListView.builder(
      itemCount: students.length, //10
      // scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final std = students[index];
        print(index);
        print(std);
        return InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (con) => GridViewScreen()));
          },
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/image/wall.jpg",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${index + 1}"),
                    SizedBox(height: 10),
                    Text(std),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      // separatorBuilder: (BuildContext context, int index) {
      //   return Divider(
      //     thickness: 5,
      //     color: Colors.green,
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.pink,
        // appBar: AppBar(),
        body: buildListViewWithBuilder()
        // buildNormalListView(),
        );
  }
}




/// ListView 
/// ListView.builder
/// ListView.separated