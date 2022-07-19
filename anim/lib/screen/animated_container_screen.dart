import 'dart:io';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimContianerScreen extends StatefulWidget {
  const AnimContianerScreen({Key? key}) : super(key: key);

  @override
  State<AnimContianerScreen> createState() => AnimContianerScreenState();
}

class AnimContianerScreenState extends State<AnimContianerScreen> {
  Color _cColor = Colors.purple;
  double _cH = 100;
  double _cW = 100;
  double _bR = 10;
  double _opacity = 0.0;
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              _cColor = Colors.red;
              _cH = 200;
              _cW = 200;
              _bR = 100;
              // _cShape = BoxShape.circle;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              height: _cH,
              width: _cW,
              decoration: BoxDecoration(
                  color: _cColor, borderRadius: BorderRadius.circular(_bR)),
            ),
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 2000),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.red,
              child: Text("Confirm"),
            ),
          ),
          MaterialButton(
            onPressed: () {
              _opacity = _opacity == 0.5 ? 0 : 0.5;
              _show = !_show;
              setState(() {});
            },
            child: Text("Show Confirm"),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 2000),
            child: _show
                ? const Text(
                    "I am big",
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  )
                : Text("I am text"),
          )
        ]),
      ),
    );
  }
}
