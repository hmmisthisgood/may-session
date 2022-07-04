import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

import '../model/video.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key, required this.screenTitle}) : super(key: key);
  final String screenTitle;
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  List data = [];
  late List<Video> videosList;

  fetchVideos() async {
    final endpoint =
        "https://pixabay.com/api/videos/?key=24747090-95c20607d87e00f7bea20cb40&q=cars";
    final uri = Uri.parse(endpoint);

    try {
      final response = await httpClient.get(uri);
      final statusCode = response.statusCode; //200, 400, 401, 500

      final body = response.body;

      final decoded = json.decode(body);
      final List hits = decoded['hits'];
      data = hits;
      final List<Video> tempVideos =
          hits.map((e) => Video.convertFromJson(e)).toList();
      // videosList = tempVideos; // 0x1211
      videosList = [...tempVideos]; // ... = spread operator

      // tempVideos.clear();

      // final temp = Video.fromList(hits);
      setState(() {});
      print(hits);
    } catch (e, s) {
      print(e.toString());
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text(widget.screenTitle)),
      body: ListView.builder(
          itemCount: videosList.length,
          itemBuilder: (context, index) {
            Video currentVideo = videosList[index];

            return Image.network(currentVideo.userImageUrl);
          }),
    );
  }
}
