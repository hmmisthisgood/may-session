import 'package:flutter/material.dart';

import '../clippers/traiangle_clipper.dart';

class CCliperScreen extends StatelessWidget {
  const CCliperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            // MaterialButton(
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (_) {
            //           return Material(
            //             child: ClipPath(
            //               clipper: TClipper(),
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Container(
            //                     height: 300,
            //                     width: width,
            //                     color: Colors.green,
            //                     child: Text("Somthing"),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         });
            //   },
            //   child: Text("Show Clipped dialog"),
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipPath(
                clipper: TClipper(),
                child: Container(
                  height: 300,
                  width: width,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/// CustomClipper 
//// 1. ClipPath
///