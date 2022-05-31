import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 150,
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        // color: Colors.grey,

        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.green,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mr Jounalist",
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Real Madrid are the European Champions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            // decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     Text("Econmics"),
                        //     SizedBox(width: 15),
                        //     Text("|"),
                        //     SizedBox(width: 15),
                        //     Text("31st May 2022"),
                        //   ],
                        // ),
                        Text(
                          "Economics   |   31 May 2022",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image,
                        width: 100,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]),
            SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}


/// ClipRRect = Clip Rounded rectangle
/// Divider = Draws a line