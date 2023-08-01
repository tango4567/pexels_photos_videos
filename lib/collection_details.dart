import 'collection_media.dart';

class CollectionDetails {
  int? page;
  int? perPage;
  int? totalResults;
  String? id;
  List<CollectionMedia>? media;

  /// Named Constructors[CollectionDetails] with require params
  CollectionDetails(
      {required this.page,
      required this.perPage,
      required this.totalResults,
      required this.id,
      required this.media});

  /// [CollectionDetails.fromJson] Mapping data to [CollectionMedia]
  factory CollectionDetails.fromJson(Map<String, dynamic> json) {
    /// [PexelsResult] Mapping object
    return CollectionDetails(
        id: json['id'] as String?,
        page: json['page'] as int?,
        perPage: json['per_page'] as int?,
        totalResults: json['total_results'] as int?,
        media: _collectionMediaList(json['media'] as List<dynamic>?));
  }

  /// [_collectionMediaList] Converting dynamic list to [CollectionMedia] list
  static List<CollectionMedia> _collectionMediaList(List<dynamic>? v) {
    /// Return [CollectionMedia] in List format
    return v!
        .map((collectionMedia) => CollectionMedia.fromJson(collectionMedia))
        .toList();
  }
}
