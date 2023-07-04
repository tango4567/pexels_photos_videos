///[PhotoSrc] hold different type of image sizes
class PhotoSrc {
  /// [original] full sized image
  String? original;

  /// [large2x] Dpr = 2
  String? large2x;

  /// [large] size of the file
  String? large;

  /// [medium] Based on display you can use
  String? medium;

  /// [small] It can be use in display
  String? small;

  /// [portrait] best for portrait view
  String? portrait;

  /// [landscape] best for landscape view
  String? landscape;

  /// [tiny] It can be used in thumbnails
  String? tiny;

  ///Named Constructors[PhotoSrc]
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
