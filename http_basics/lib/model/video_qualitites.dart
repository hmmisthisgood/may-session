import 'video_size.dart';

class VideoQualities {
  final VideoSize large, medium, small, tiny;

  VideoQualities(
      {required this.large,
      required this.medium,
      required this.small,
      required this.tiny});

  static VideoQualities fromJson(Map json) {
    return VideoQualities(
      large: VideoSize.convertVideoJson(json['large']),
      medium: VideoSize.convertVideoJson(json['medium']),
      small: VideoSize.convertVideoJson(json['small']),
      tiny: VideoSize.convertVideoJson(json['tiny']),
    );
  }
}
