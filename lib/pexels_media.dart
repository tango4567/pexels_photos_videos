library pexels_photos_videos;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pexels_photos_videos/curated.dart';
import 'package:pexels_photos_videos/video.dart';

import 'photo.dart';

/// [PexelsMedia] is having multiple methods
class PexelsMedia {
  /// [_authorization] Authorization
  static const String _authorization = 'Authorization';

  /// [_contentType] Content Type
  static const String _contentType = 'Content-Type';

  /// [_contentTypeDefinition] Content type Definition
  static const String _contentTypeDefinition =
      'application/json; charset=UTF-8';

  /// [_pexelsApiBaseUrl] Pexels Api base url
  static const String _pexelsApiBaseUrl = 'api.pexels.com';

  /// [_pexelsPhoto] Pexels Api sub folder to get photos
  static const String _pexelsPhoto = 'v1/photos';

  ///
  static const String _pexelsCuratedPhoto = '/v1/curated';

  /// [_pexelsPhoto] Pexels Api sub folder to get photos
  static const String _pexelsVideo = 'videos/videos';

  /// [authorizationKey] We are going to use this multiple place
  String authorizationKey;

  /// [PexelsMedia] Named Constructor with required param[authorizationKey]
  PexelsMedia({required this.authorizationKey});

  /// [getPhoto] required to parameters
  /// Image ID => [imageId]
  Future<Photo> getPhoto(String imageId) async {
    ///Creating Uri
    final uri = Uri.https(_pexelsApiBaseUrl, '$_pexelsPhoto/$imageId');

    /// Get response from Pexels.com
    final response = await http.get(uri, headers: {
      _contentType: _contentTypeDefinition,
      _authorization: authorizationKey
    });

    /// If [response.statusCode != 200] then it will throw exception
    if (response.statusCode != 200) {
      /// [Exception] Return exception and response code
      throw Exception('Exception ${response.statusCode}');
    }

    /// Here we are converting [response] data to [PexelsResult]
    final packageJson = json.decode(response.body) as Map<String, dynamic>;

    /// Return response in form of [PexelsResult]
    return Photo.fromJson(packageJson);
  }

  /// [getVideo] required to parameters
  /// Video ID => [imageId]
  Future<Video> getVideo(String videoId) async {
    ///Creating Uri
    final uri = Uri.https(_pexelsApiBaseUrl, '$_pexelsVideo/$videoId');

    /// Get [response] from Pexels.com
    final response = await http.get(uri, headers: {
      _contentType: _contentTypeDefinition,
      _authorization: authorizationKey
    });

    /// If [response.statusCode != 200] then it will throw exception
    if (response.statusCode != 200) {
      /// [Exception] Return exception and response code
      throw Exception('Exception ${response.statusCode}');
    }

    /// Here we are converting [response] data to [Video]
    final packageJson = json.decode(response.body) as Map<String, dynamic>;

    /// Return response in form of [Video]
    return Video.fromJson(packageJson);
  }

  /// [getCuratedPhotos] required to parameters
  /// page => [page]
  /// perPage = [perPage]
  Future<Curated> getCuratedPhotos(int page, int perPage) async {
    Map<String, dynamic> queryParameters = {
      'page': '$page',
      'per_page': '$perPage',
    };

    ///Creating Uri
    final uri =
        Uri.https(_pexelsApiBaseUrl, _pexelsCuratedPhoto, queryParameters);

    /// Get [response] from Pexels.com
    final response = await http.get(
      uri,
      headers: {
        _contentType: _contentTypeDefinition,
        _authorization: authorizationKey
      },
    );

    /// If [response.statusCode != 200] then it will throw exception
    if (response.statusCode != 200) {
      /// [Exception] Return exception and response code
      throw Exception('Exception ${response.statusCode}');
    }

    /// Here we are converting [response] data to [Video]
    final packageJson = json.decode(response.body) as Map<String, dynamic>;

    /// Return response in form of [Video]
    return Curated.fromJson(packageJson);
  }
}
