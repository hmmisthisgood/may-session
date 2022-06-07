import 'package:flutter/material.dart';

class IgProfileGridViewWidget extends StatelessWidget {
  const IgProfileGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 2),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Image.asset(
              "assets/image/wall.jpg",
              fit: BoxFit.cover,
            );
          }),
    );
  }
}
