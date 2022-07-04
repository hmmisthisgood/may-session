import 'package:bloc_app/model/video_qualitites.dart';

final data = {
  "id": 19627,
  "pageURL": "https://pixabay.com/videos/id-19627/",
  "type": "film",
  "tags": "street, traffic, cars",
  "duration": 17,
  "picture_id":
      "744034014-81fd7fd828ec99c50f3f8cf006a942bc3bd1586e9b4770939bf55dac76f69ef5-d",
  "videos": {
    "large": {
      "url":
          "https://player.vimeo.com/external/304735769.hd.mp4?s=a60812db50c3b8aae17f3f1a6843f79698b2bb08&profile_id=172",
      "width": 3840,
      "height": 2160,
      "size": 34933926
    },
    "medium": {
      "url":
          "https://player.vimeo.com/external/304735769.hd.mp4?s=a60812db50c3b8aae17f3f1a6843f79698b2bb08&profile_id=170",
      "width": 2560,
      "height": 1440,
      "size": 16028004
    },
    "small": {
      "url":
          "https://player.vimeo.com/external/304735769.hd.mp4?s=a60812db50c3b8aae17f3f1a6843f79698b2bb08&profile_id=175",
      "width": 1920,
      "height": 1080,
      "size": 9911185
    },
    "tiny": {
      "url":
          "https://player.vimeo.com/external/304735769.hd.mp4?s=a60812db50c3b8aae17f3f1a6843f79698b2bb08&profile_id=174",
      "width": 1280,
      "height": 720,
      "size": 4684024
    }
  },
  "views": 332179,
  "downloads": 159803,
  "likes": 704,
  "comments": 210,
  "user_id": 10829809,
  "user": "JoteF",
  "userImageURL":
      "https://cdn.pixabay.com/user/2018/11/28/11-24-12-474_250x250.jpg"
};

class Video {
  final int id, duration, view, downloads, likes, comments;

  final String pageUrl, tags, user, userImageUrl;
  final VideoQualities qualities;

  Video(
      {required this.id,
      required this.duration,
      required this.view,
      required this.downloads,
      required this.likes,
      required this.comments,
      required this.pageUrl,
      required this.tags,
      required this.user,
      required this.userImageUrl,
      required this.qualities});

  static Video convertFromJson(Map json) {
    return Video(
      id: json['id'],
      duration: json['duration'],
      view: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      pageUrl: json['pageURL'],
      tags: json['tags'],
      user: json['user'],
      userImageUrl: json['userImageURL'],
      qualities: VideoQualities.fromJson(json['videos']),
    );
  }

  static List<Video> fromList(List data) {
    return data.map<Video>((e) => Video.convertFromJson(e)).toList();
  }
}
