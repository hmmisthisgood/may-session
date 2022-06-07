import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: 300,
      child: Stack(
        children: [
          Image.asset("assets/image/it.jpg"),
          Container(color: Colors.red.withOpacity(0.5)),
          Container(color: Colors.black.withOpacity(0.5)),
          // Container(color: Colors.black),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4), shape: BoxShape.circle),
              child: Icon(FontAwesome.photo, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("1/10",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white, fontSize: 20))),
            ),
          )
        ],
      ),
    );
  }
}

/// Positioned = absolute
/// Align= relative position