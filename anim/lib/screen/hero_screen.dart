import 'package:anim/screen/hero2.dart';
import 'package:anim/util/constants.dart';
import 'package:flutter/material.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Hero2Screen()),
              );
            },
            child: Hero(tag: "this is tag", child: Image.network(image)),
          ),
        ],
      ),
    );
  }
}
