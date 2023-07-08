import 'package:pexels_photos_videos/photo.dart';

/// This endpoint enables you to search Pexels for any topic that you would like.
/// For example your query could be something broad like Nature, Tigers, People.
/// Or it could be something specific like Group of people working.
class SearchPhoto {
  /// The current page number.
  int? page;

  /// The number of results returned with each page.
  int? perPage;

  /// An array of Photo objects.
  List<Photo>? photos;

  /// The total number of results for the request.
  int? totalResults;

  /// URL for the previous page of results, if applicable.
  String? prevPage;

  /// URL for the next page of results, if applicable.
  String? nextPage;

  /// Named Constructors[SearchPhoto] with require params
  SearchPhoto(
      {required this.page,
      required this.perPage,
      required this.photos,
      required this.totalResults,
      required this.nextPage,
      required this.prevPage});

  /// [SearchPhoto.fromJson] Mapping data to [SearchPhoto]
  factory SearchPhoto.fromJson(Map<String, dynamic> json) {
    /// [SearchPhoto] Mapping object
    return SearchPhoto(
        page: json['page'] as int?,
        perPage: json['per_page'] as int?,
        totalResults: json['total_results'] as int?,
        nextPage: json['next_page'] as String?,
        prevPage: json['prev_page'] as String?,
        photos: _photoList(json['photos'] as List<dynamic>?));
  }

  /// [_photoList] Converting dynamic list to [Photo] list
  static List<Photo> _photoList(List<dynamic>? vP) {
    /// Return [Photo] in List format
    return vP!.map((photo) => Photo.fromJson(photo)).toList();
  }
}
