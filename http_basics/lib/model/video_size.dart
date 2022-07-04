import 'dart:convert';

final data = {
  "url":
      "https://player.vimeo.com/external/304735769.hd.mp4?s=a60812db50c3b8aae17f3f1a6843f79698b2bb08&profile_id=170",
  "width": 2560,
  "height": 1440,
  "size": 16028004
};

class VideoSize {
  final String url;
  final int width, height, size;

  VideoSize(
      {required this.url,
      required this.width,
      required this.height,
      required this.size});

  static VideoSize convertVideoJson(Map json) {
    return VideoSize(
        url: json['url'],
        width: json['width'],
        height: json['height'],
        size: json['size']);
  }
}
