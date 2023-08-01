import 'collections.dart';

class CollectionResult {
  /// The current [page] number.
  int? page;

  /// The [perPage] number of results returned with each page.
  int? perPage;

  /// An array of [Collection] objects.
  List<Collection>? collections;

  /// The [totalResults] total number of results for the request..
  int? totalResults;

  /// The [nextPage] URL for the next page of results, if applicable.
  String? nextPage;

  /// The [prevPage] URL for the previous page of results, if applicable.
  String? prevPage;

  ///Named Constructors[CollectionResult] with required params
  CollectionResult(
      {this.page,
      this.perPage,
      this.collections,
      this.totalResults,
      this.nextPage,
      this.prevPage});

  /// [CollectionResult.fromJson] Mapping object to [CollectionResult]
  factory CollectionResult.fromJson(Map<String, dynamic> json) {
    /// Return [CollectionResult]
    return CollectionResult(
        page: json['page'],
        perPage: json['per_page'],
        collections: _collectionList(json['collections'] as List<dynamic>?),
        totalResults: json['total_results'],
        nextPage: json['next_page'],
        prevPage: json['prev_page']);
  }

  /// [_collectionList] Converting dynamic list to [Collection] list
  static List<Collection> _collectionList(List<dynamic>? v) {
    /// Return [Collection] in List format
    return v!.map((collection) => Collection.fromJson(collection)).toList();
  }
}
