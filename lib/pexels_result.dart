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
  String? src;
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
        id: json['id'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        photographer: json['photographer'],
        photographerUrl: json['photographerUrl'],
        photographerId: json['photographerId'],
        avgColor: json['avgColor'],
        src: json['src'],
        liked: json['liked'],
        alt: json['alt']);
  }
/* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['photographer'] = this.photographer;
    data['photographer_url'] = this.photographerUrl;
    data['photographer_id'] = this.photographerId;
    data['avg_color'] = this.avgColor;
    if (this.src != null) {
      data['src'] = this.src!.toJson();
    }
    data['liked'] = this.liked;
    data['alt'] = this.alt;
    return data;
  }*/
}
//
// class Src {
//   String? original;
//   String? large2x;
//   String? large;
//   String? medium;
//   String? small;
//   String? portrait;
//   String? landscape;
//   String? tiny;
//
//   Src(
//       {required this.original,
//       required this.large2x,
//       required this.large,
//       required this.medium,
//       required this.small,
//       required this.portrait,
//       required this.landscape,
//       required this.tiny});
//
//   Src.fromJson(Map<String, dynamic> json) {
//     original = json['original'] as String?;
//     large2x = json['large2x'] as String?;
//     large = json['large'] as String?;
//     medium = json['medium'] as String?;
//     small = json['small'] as String?;
//     portrait = json['portrait'] as String?;
//     landscape = json['landscape'] as String?;
//     tiny = json['tiny'] as String?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['original'] = this.original;
//     data['large2x'] = this.large2x;
//     data['large'] = this.large;
//     data['medium'] = this.medium;
//     data['small'] = this.small;
//     data['portrait'] = this.portrait;
//     data['landscape'] = this.landscape;
//     data['tiny'] = this.tiny;
//     return data;
//   }
// }
