/// The Collection resource is a JSON formatted version of a Pexels collection.
/// The Collection list endpoint responds with the collection data formatted in this shape.
class Collection {
  ///The [id] of the collection.
  String? id;

  /// The [title] name of the collection.
  String? title;

  ///The [description] of the collection.
  String? description;

  /// Whether or not the collection is marked as [private].
  bool? private;

  /// The [mediaCount] total number of media included in this collection.
  int? mediaCount;

  /// The [photosCount] total number of photos included in this collection.
  int? photosCount;

  /// The [videosCount] The total number of videos included in this collection.
  int? videosCount;

  Collection(
      {required this.id,
      required this.title,
      required this.description,
      required this.private,
      required this.mediaCount,
      required this.photosCount,
      required this.videosCount});

  /// [Collection.fromJson] Mapping data to [Collection]
  factory Collection.fromJson(Map<String, dynamic> json) {
    /// [Collection] Mapping object
    return Collection(
        id: json['id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        private: json['private'] as bool?,
        mediaCount: json['media_count'] as int?,
        photosCount: json['photos_count'] as int?,
        videosCount: json['videos_count'] as int?);
  }
}
