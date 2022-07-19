import 'package:flutter/material.dart';

import 'hero_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final List pages = [
    {
      "title": "Hero animation",
      "nav_widget": HeroScreen(),
      "color": Colors.green,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animatiosn"),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];

          return MaterialButton(
            color: page['color'],
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => page["nav_widget"]));
            },
            child: Text(
              page["title"],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
