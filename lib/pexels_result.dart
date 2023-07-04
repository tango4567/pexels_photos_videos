import 'src.dart';

///[PexelsResult] is response from Pexels.com
class PexelsResult {
  bool liked;

  int? id;
  int? width;
  int? height;
  int? photographerId;

  String? url;
  String? photographer;
  String? photographerUrl;
  String? avgColor;
  Src? src;
  String? alt;

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
