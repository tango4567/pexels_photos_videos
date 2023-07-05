/// [VideoPictures] Video Picture Details
class VideoPictures {
  /// The id of the video_picture.
  int? id;

  /// nr integer
  int? nr;

  ///A link to the preview image.
  String? picture;

  /// [VideoPictures] Name Constructor with required param
  /// [id]
  /// [nr]
  /// [picture]
  VideoPictures({required this.id, required this.nr, required this.picture});

  /// [VideoPictures.fromJson] Mapping Object to [VideoPictures]
  factory VideoPictures.fromJson(Map<String, dynamic> json) {
    /// Returning [VideoPictures]
    return VideoPictures(
        id: json['id'] as int?,
        nr: json['nr'] as int?,
        picture: json['picture'] as String?);
  }
}
