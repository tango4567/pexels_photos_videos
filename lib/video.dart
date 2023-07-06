import 'package:pexels_photos_videos/video_files.dart';
import 'package:pexels_photos_videos/video_pictures.dart';
import 'package:pexels_photos_videos/video_user.dart';

/// The [Video] resource is a JSON formatted version of a Pexels video.
/// The [Video] API endpoints respond with the video data formatted in this shape.
class Video {
  /// The id of the video.
  int? id;

  /// The real width of the video in pixels.
  int? width;

  /// The real height of the video in pixels
  int? height;

  /// The duration of the video in seconds.
  int? duration;

  /// The Pexels URL where the video is located.
  String? url;

  /// URL to a screenshot of the video.
  String? image;

  /// The videographer who shot the video.
  User? user;

  /// An array of different sized versions of the video.
  List<VideoFiles>? videoFiles;

  /// An array of preview pictures of the video.
  List<VideoPictures>? videoPictures;

  /**
   * In current version we are getting following
   * variable with null
   * Null? avgColor;
   * Null? fullRes;
   * List<void>? tags;
   **/

  ///Named Constructors[Video] with required params
  Video(
      {required this.id,
      required this.width,
      required this.height,
      required this.duration,
      required this.url,
      required this.image,
      required this.user,
      required this.videoFiles,
      required this.videoPictures
      /**
     * required this.tags,
     * required this.avgColor,
     * required this.fullRes,
     * */
      });

  /// [Video.fromJson] Mapping object to [Video]
  factory Video.fromJson(Map<String, dynamic> json) {
    /// Return [Video]
    return Video(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        duration: json['duration'],
        url: json['url'],
        image: json['image'],
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        videoFiles: _videoFileList(json['video_files'] as List<dynamic>?),
        videoPictures:
            _videoPictureList(json['video_pictures'] as List<dynamic>?));
    /**
     *   if (json['tags'] != null) {
     *   tags = <Null>[];
     *   json['tags'].forEach((v) {
     *   tags!.add(new Null.fromJson(v));
     *   });
     *   }
     *   fullRes: json['full_res'],
     *   avgColor: json['avg_color'],
     */
  }

  /// [_videoFileList] Converting dynamic list to [VideoFiles] list
  static List<VideoFiles> _videoFileList(List<dynamic>? vF) {
    return vF!.map((videoFile) => VideoFiles.fromJson(videoFile)).toList();
  }

  /// [_videoPictureList] Converting dynamic list to [VideoPictures] list
  static List<VideoPictures> _videoPictureList(List<dynamic>? vP) {
    return vP!
        .map((videoPictures) => VideoPictures.fromJson(videoPictures))
        .toList();
  }
}
