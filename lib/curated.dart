import 'package:pexels_photos_videos/photo.dart';

/// This endpoint enables you to receive real-time photos curated by the Pexels team.
/// We add at least one new photo per hour to our curated list so that you always get a changing selection of trending photos.
class Curated {
  /// The current page number.
  int? page;

  /// The number of results you are requesting per page. Default: 15 Max: 80
  int? perPage;

  /// The total number of results for the request.
  int? totalResult;

  /// URL for the next page of results, if applicable.
  String? nextPage;

  /// An array of Photo objects.
  List<Photo>? photos;

  ///Named Constructors[Curated] with required params
  Curated(
      {required this.page,
      required this.perPage,
      required this.totalResult,
      required this.photos,
      required this.nextPage});

  /// [Curated.fromJson] Mapping object to [Curated]
  factory Curated.fromJson(Map<String, dynamic> json) {
    /// Return [Curated]
    return Curated(
        page: json['page'] as int?,
        perPage: json['per_page'] as int?,
        totalResult: json['total_result'] as int?,
        photos: _photoList(json['photos'] as List<dynamic>?),
        nextPage: json['next_page'] as String?);
  }

  /// [_photoList] Converting dynamic list to [Photo] list
  static List<Photo> _photoList(List<dynamic>? vF) {
    return vF!.map((photo) => Photo.fromJson(photo)).toList();
  }
}
