import 'package:pexels_photos_videos/video.dart';

///This endpoint enables you to search Pexels for any topic that you would like.
///For example your query could be something broad like Nature, Tigers, People.
///Or it could be something specific like Group of people working.
class PopularVideo {
  /// An array of Video objects.
  int? page;

  /// The Pexels URL for the current search query.
  int? perPage;

  /// The current page number.
  List<Video>? videos;

  /// The total number of results for the request.
  int? totalResults;

  /// URL for the next page of results, if applicable.
  String? nextPage;

  /// URL for the previous page of results, if applicable.
  String? prevPage;

  /// The Pexels URL for the current search query.
  String? url;

  /// Named Constructors[PopularVideo] with require params
  PopularVideo(
      {required this.page,
      required this.perPage,
      required this.videos,
      required this.totalResults,
      required this.nextPage,
      required this.url,
      required this.prevPage});

  /// [PopularVideo.fromJson] Mapping data to [PopularVideo]
  factory PopularVideo.fromJson(Map<String, dynamic> json) {
    /// [SearchVideo] Mapping object
    return PopularVideo(
        page: json['page'] as int?,
        perPage: json['per_page'] as int?,
        totalResults: json['total_results'] as int?,
        nextPage: json['next_page'] as String?,
        prevPage: json['prev_page'] as String?,
        url: json['url'] as String?,
        videos: _videoList(json['videos'] as List<dynamic>?));
  }

  /// [_videoList] Converting dynamic list to [Video] list
  static List<Video> _videoList(List<dynamic>? v) {
    /// Return [Photo] in List format
    return v!.map((video) => Video.fromJson(video)).toList();
  }
}
