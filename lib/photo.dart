import 'photo_src.dart';

/// The [Photo] resource is a JSON formatted version of a Pexels photo.
/// The [Photo] API endpoints respond with the photo data formatted in this shape.
class Photo {
  ///Photo like status true or false
  bool liked;

  /// The id of the photographer.
  int? id;

  /// The real width of the photo in pixels.
  int? width;

  /// The real height of the photo in pixels.
  int? height;

  /// The id of the photographer.
  int? photographerId;

  /// The Pexels URL where the photo is located.
  String? url;

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

  /// Named Constructors[Photo] with require params
  Photo(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      required this.src,
      required this.liked,
      required this.alt});

  /// [PexelsResult.fromJson] Mapping data to [Photo]
  factory Photo.fromJson(Map<String, dynamic> json) {
    /// [PexelsResult] Mapping object
    return Photo(
        id: json['id'] as int?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        photographerId: json['photographerId'] as int?,
        url: json['url'] as String?,
        photographer: json['photographer'] as String?,
        photographerUrl: json['photographerUrl'] as String?,
        avgColor: json['avgColor'] as String?,
        src: PhotoSrc.fromJson(json['src']),
        liked: json['liked'] as bool,
        alt: json['alt'] as String?);
  }
}
