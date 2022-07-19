import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../util/constants.dart';

class Hero2Screen extends StatelessWidget {
  const Hero2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: "this is tag", child: Image.network(image)),
    );
  }
}
