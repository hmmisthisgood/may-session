import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  final PageController pageController = PageController();
  final netImage =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  final List<String> images = [
    "assets/image/wall.jpg",
    "assets/image/it.jpg",
    "assets/image/captca.png",
    "assets/image/wall.jpg",
    "assets/image/it.jpg",
    "assets/image/captca.png",
    "assets/image/wall.jpg",
    "assets/image/it.jpg",
    "assets/image/captca.png",
  ];
  Widget buildNormalPageView() {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.vertical,
      // physics: BouncingScrollPhysics(),
      children: [
        Container(
          color: Colors.green,
          child: MaterialButton(
            onPressed: () {
              // pageController.nextPage(
              //     duration: Duration(seconds: 5), curve: Curves.ease);
              // pageController.animateToPage(4,
              //     duration: Duration(seconds: 5), curve: Curves.ease);
              pageController.jumpToPage(4);
            },
            child: Text("Press me"),
          ),
        ),
        Container(color: Colors.red),
        Container(color: Colors.purple),
        Container(color: Colors.yellow),
        Container(color: Colors.orange),
        Container(color: Colors.blue),
      ],
    );
  }

  Widget pageViewWithBuilder() {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final currentImage = images[index];
          return
              //  index % 2 == 0
              //     ? Container(
              //         color: Colors.purple,
              //       )
              //     :
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: FadeInImage(
                    image: AssetImage(currentImage),
                    imageErrorBuilder: (context, e, s) {
                      return Center(child: Text("Could not load image"));
                    },
                    placeholder: NetworkImage(netImage),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 2),
                  )
                  //   Image.asset(
                  //   currentImage,
                  //   fit: BoxFit.cover,
                  //   alignment: Alignment.centerLeft,
                  // ),
                  );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pageViewWithBuilder());
  }
}


/// PageView
/// PageView.builder
/// PageView.custom
/// 
/// 

/// Image: 
/// FadeInImage
/// ImageProvider: 
/// - AssetImage 
/// - NetworkImage
/// - Me