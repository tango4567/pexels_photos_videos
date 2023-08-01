import 'package:pexels_photos_videos/photo_src.dart';
import 'package:pexels_photos_videos/video_files.dart';
import 'package:pexels_photos_videos/video_pictures.dart';
import 'package:pexels_photos_videos/video_user.dart';

class CollectionMedia {
  String? type;
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

  ///Photo like status true or false
  bool liked;

  /// The id of the photographer.
  int? photographerId;

  /// The name of the photographer who took the photo.
  String? photographer;

  /// The URL of the photographer's Pexels profile.
  String? photographerUrl;

  /// The average color of the photo. Useful for a placeholder while the image loads.
  String? avgColor;

  /// An assortment of different image sizes that can be used to display this [PhotoSrc].
  PhotoSrc? src;

  /// Text description of the photo for use in the [alt] attribute.
  String? alt;

  CollectionMedia(
      {required this.id,
      required this.type,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      required this.src,
      required this.liked,
      required this.alt,
      required this.duration,
      required this.image,
      required this.user,
      required this.videoFiles,
      required this.videoPictures});

  /// [CollectionMedia.fromJson] Mapping data to [CollectionMedia]
  factory CollectionMedia.fromJson(Map<String, dynamic> json) {
    /// [CollectionMedia] Mapping object
    return CollectionMedia(
        id: json['id'] != null ? json['id'] as int? : null,
        type: json['type'] != null ? json['type'] as String? : null,
        width: json['width'] != null ? json['width'] as int? : null,
        height: json['height'] != null ? json['height'] as int? : null,
        duration: json['duration'] != null ? json['duration'] as int? : null,
        url: json['url'] != null ? json['url'] as String? : null,
        image: json['image'] != null ? json['image'] as String? : null,
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        videoFiles: json['video_files'] != null
            ? _videoFileList(json['video_files'] as List<dynamic>?)
            : null,
        videoPictures: json['video_pictures'] != null
            ? _videoPictureList(json['video_pictures'] as List<dynamic>?)
            : null,
        photographerId: json['photographerId'] != null
            ? json['photographerId'] as int?
            : null,
        photographer: json['photographer'] != null
            ? json['photographer'] as String?
            : null,
        photographerUrl: json['photographerUrl'] != null
            ? json['photographerUrl'] as String?
            : null,
        avgColor: json['avgColor'] != null ? json['avgColor'] as String? : null,
        src: json['src'] != null ? PhotoSrc.fromJson(json['src']) : null,
        liked: json['liked'] != null ? json['liked'] as bool : false,
        alt: json['alt'] != null ? json['alt'] as String? : null);
  }

  /// [_videoFileList] Converting dynamic list to [VideoFiles] list
  static List<VideoFiles> _videoFileList(List<dynamic>? vF) {
    /// Return [VideoFiles] in List format
    return vF!.map((videoFile) => VideoFiles.fromJson(videoFile)).toList();
  }

  /// [_videoPictureList] Converting dynamic list to [VideoPictures] list
  static List<VideoPictures> _videoPictureList(List<dynamic>? vP) {
    /// Return [VideoPictures] in List format
    return vP!
        .map((videoPictures) => VideoPictures.fromJson(videoPictures))
        .toList();
  }
}
