import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        // color: Colors.green,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text(
              "Our app is here",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            // Icon(
            //   Icons.home,
            //   color: Colors.green,
            //   size: 40,
            // ),
            // Icon(Icons.send),
            // Icon(Icons.message),
            // Icon(Icons.home),
            // Icon(Icons.home),
            // Icon(Icons.home),
            // Icon(Icons.home),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("I am pressed");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


/// Common widgets 
/// 1. Container = just a box 

//// Layout 
/// - Row = 
/// - Column 
/// - ListView 
/// - GridView 
/// - SingleChildScrollView
/// - PageView 
/// - Center

/// Widgets 
/// - Scaffold 
/// - Text 
/// - Image 
/// - Appbar
/// - Button (MaterialButton ,ElevatedButton)
/// - InkWell, GestureDetector 
/// - Icon , IconButton 
/// SizedBox, Padding 
/// Stack 
/// Positioned , Expanded, Align 