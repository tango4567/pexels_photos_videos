///[Src] hold different type of image sizes
class Src {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  Src(
      {required this.original,
      required this.large2x,
      required this.large,
      required this.medium,
      required this.small,
      required this.portrait,
      required this.landscape,
      required this.tiny});

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
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
