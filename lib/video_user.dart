/// The videographer who shot the video.
class User {
  /// The id of the videographer.
  int? id;

  /// The name of the videographer.
  String? name;

  /// The URL of the videographer's Pexels profile.
  String? url;

  /// Named Constructor [User]
  /// required params
  /// [id]
  /// [name]
  /// [url]
  User({required this.id, required this.name, required this.url});

  /// [User.fromJson] Mapping Json object to [User]
  factory User.fromJson(Map<String, dynamic> json) {
    /// Return [User]
    return User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        url: json['url'] as String?);
  }
}
