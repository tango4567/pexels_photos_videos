import 'src.dart';

///[PexelsResult] is response from Pexels.com
class PexelsResult {
  ///[liked] photo like status true or false
  bool liked;

  ///[id] photo id
  int? id;

  ///[width] photo width
  int? width;

  ///[height] photo height
  int? height;

  /// [photographerId] photographar Id
  int? photographerId;

  ///[url] photo url
  String? url;

  /// [photographer] photographer name
  String? photographer;

  /// [photographerUrl] photographer url
  String? photographerUrl;

  /// [avgColor] photo average color
  String? avgColor;

  /// [src] Src is collection of url with different size for the same photo
  Src? src;

  ///[alt] Alternate name for the photo.
  String? alt;

  ///Named Constructors[PexelsResult]
  PexelsResult(
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

  /// [PexelsResult.fromJson] Mapping data to [PexelsResult]
  factory PexelsResult.fromJson(Map<String, dynamic> json) {
    return PexelsResult(
        id: json['id'] as int?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        photographerId: json['photographerId'] as int?,
        url: json['url'] as String?,
        photographer: json['photographer'] as String?,
        photographerUrl: json['photographerUrl'] as String?,
        avgColor: json['avgColor'] as String?,
        src: Src.fromJson(json['src']),
        liked: json['liked'] as bool,
        alt: json['alt'] as String?);
  }
}
