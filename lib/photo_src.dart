/// [PhotoSrc] hold different type of image sizes
class PhotoSrc {
  /// The image without any size changes.
  /// It will be the same as the [width] and [height] attributes.
  String? original;

  /// The image resized W 940px X H 650px DPR 2
  String? large2x;

  /// The image resized to W 940px X H 650px DPR 1.
  String? large;

  /// The image scaled proportionally so that it's new height is 350px.
  String? medium;

  /// The image scaled proportionally so that it's new height is 130px.
  String? small;

  /// The image cropped to W 800px X H 1200px.
  String? portrait;

  /// The image cropped to W 1200px X H 627px.
  String? landscape;

  /// The image cropped to W 280px X H 200px.
  String? tiny;

  /// Named Constructors[PhotoSrc] with required params
  PhotoSrc(
      {required this.original,
      required this.large2x,
      required this.large,
      required this.medium,
      required this.small,
      required this.portrait,
      required this.landscape,
      required this.tiny});

  /// [Src.fromJson]Mapping Json object
  factory PhotoSrc.fromJson(Map<String, dynamic> json) {
    ///[Src] Object mapping
    return PhotoSrc(
        original: json['original'] as String?,
        large2x: json['large2x'] as String?,
        large: json['large'] as String?,
        medium: json['medium'] as String?,
        small: json['small'] as String?,
        portrait: json['portrait'] as String?,
        landscape: json['landscape'] as String?,
        tiny: json['tiny'] as String?);
  }
}
