/// An array of different sized versions of the video.
class VideoFiles {
  /// The id of the video_file.
  int? id;

  /// The width of the video_file in pixels.
  int? width;

  /// The height of the video_file in pixels.
  int? height;

  /// The number of frames per second of the video_file.
  double? fps;

  /// The video quality of the video_file.
  String? quality;

  /// The video format of the video_file
  String? fileType;

  /// A link to where the video_file is hosted.
  String? link;

  /// Named Constructors[VideoFiles] with required params
  VideoFiles(
      {required this.id,
      required this.quality,
      required this.fileType,
      required this.width,
      required this.height,
      required this.fps,
      required this.link});

  /// [VideoFiles.fromJson] Mapping object to [VideoFiles]
  factory VideoFiles.fromJson(Map<String, dynamic> json) {
    /// Return [VideoFiles]
    return VideoFiles(
        id: json['id'] as int?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        fps: json['fps'] as double?,
        quality: json['quality'] as String?,
        fileType: json['file_type'] as String?,
        link: json['link'] as String?);
  }
}
