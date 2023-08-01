library pexels_photos_videos;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pexels_photos_videos/collection_result.dart';
import 'package:pexels_photos_videos/curated.dart';
import 'package:pexels_photos_videos/popular_videos.dart';
import 'package:pexels_photos_videos/search_photo.dart';
import 'package:pexels_photos_videos/search_video.dart';
import 'package:pexels_photos_videos/video.dart';

import 'collection_details.dart';
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

  /// [_pexelsCuratedPhoto] Curated Photo Api sub folder
  static const String _pexelsCuratedPhoto = '/v1/curated';

  /// [_pexelsPhotoSearch] Curated Photo Api sub folder
  static const String _pexelsPhotoSearch = '/v1/search';

  /// [_pexelsVideoSearch] Curated Video Api sub folder
  static const String _pexelsVideoSearch = '/videos/search';

  /// [_pexelsPopularVideo] Popular Video Api sub folder
  static const String _pexelsPopularVideo = '/videos/popular';

  /// [_pexelsPhoto] Pexels Api sub folder to get photos
  static const String _pexelsVideo = 'videos/videos';

  /// [_pexelsCollections] Pexels Api sub folder to get photos
  static const String _pexelsCollections = 'v1/collections';

  /// [_pexelsFeaturedCollections] Pexels Api sub folder to get photos
  static const String _pexelsFeaturedCollections = 'v1/collections/featured';

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
    /// Creating query parameters
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

  /// [searchPhotos] required to parameters
  /// This endpoint enables you to search Pexels for any topic that you would like.
  /// For example your [query] could be something broad like Nature, Tigers, People.
  /// Or it could be something specific like Group of people working.
  Future<SearchPhoto> searchPhotos(

      /// The search [query]. Ocean, Tigers, Pears, etc.
      String query,
      [
      /// The page number you are requesting. Default: 1
      int? page,

      /// The number of results you are requesting per page. Default: 15 Max: 80
      int? perPage,

      /// Desired photo [orientation].
      /// The current supported orientations are: landscape, portrait or square.
      String? orientation,

      /// Minimum photo size. The current supported sizes are:
      /// large(24MP), medium(12MP) or small(4MP).
      String? size,

      /// Desired photo color. Supported colors: red, orange, yellow, green,
      /// turquoise, blue, violet, pink, brown, black, gray, white or any
      /// hexidecimal color code (eg. #ffffff).
      String? color,

      /// The locale of the search you are performing. The current supported
      /// locales are
      /// 'en-US' 'pt-BR' 'es-ES' 'ca-ES' 'de-DE' 'it-IT' 'fr-FR' 'sv-SE'
      /// 'id-ID' 'pl-PL' 'ja-JP' 'zh-TW' 'zh-CN' 'ko-KR' 'th-TH' 'nl-NL'
      /// 'hu-HU' 'vi-VN' 'cs-CZ' 'da-DK' 'fi-FI' 'uk-UA' 'el-GR' 'ro-RO'
      /// 'nb-NO' 'sk-SK' 'tr-TR' 'ru-RU'.
      String? local]) async {
    /// Creating query parameters
    Map<String, dynamic> queryParameters = {
      'query': query,
      'page': '$page',
      'per_page': '$perPage',
      'orientation': orientation,
      'size': size,
      'color': color,
      'local': local
    };

    ///Creating Uri
    final uri =
        Uri.https(_pexelsApiBaseUrl, _pexelsPhotoSearch, queryParameters);

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

    /// Here we are converting [response] data to [Photo]
    final packageJson = json.decode(response.body) as Map<String, dynamic>;

    /// Return response in form of [Photo]
    return SearchPhoto.fromJson(packageJson);
  }

  /// [searchVideos] required to parameters
  /// This endpoint enables you to search Pexels for any topic that you would like.
  /// For example your [query] could be something broad like Nature, Tigers, People.
  /// Or it could be something specific like Group of people working.
  Future<SearchVideo> searchVideos(

      /// The search [query]. Ocean, Tigers, Pears, etc.
      String query,
      [
      /// The page number you are requesting. Default: 1
      int? page,

      /// The number of results you are requesting per page. Default: 15 Max: 80
      int? perPage,

      /// Desired photo [orientation].
      /// The current supported orientations are: landscape, portrait or square.
      String? orientation,

      /// Minimum video size. The current supported sizes are:
      /// large(4K), medium(Full HD) or small(HD).
      String? size,

      /// The locale of the search you are performing. The current supported
      /// locales are
      /// 'en-US' 'pt-BR' 'es-ES' 'ca-ES' 'de-DE' 'it-IT' 'fr-FR' 'sv-SE'
      /// 'id-ID' 'pl-PL' 'ja-JP' 'zh-TW' 'zh-CN' 'ko-KR' 'th-TH' 'nl-NL'
      /// 'hu-HU' 'vi-VN' 'cs-CZ' 'da-DK' 'fi-FI' 'uk-UA' 'el-GR' 'ro-RO'
      /// 'nb-NO' 'sk-SK' 'tr-TR' 'ru-RU'.
      String? local]) async {
    /// Creating query parameters
    Map<String, dynamic> queryParameters = {
      'query': query,
      'page': '$page',
      'per_page': '$perPage',
      'orientation': orientation,
      'size': size,
      'local': local
    };

    ///Creating Uri
    final uri =
        Uri.https(_pexelsApiBaseUrl, _pexelsVideoSearch, queryParameters);

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

    /// Return response in form of [Video] list
    return SearchVideo.fromJson(packageJson);
  }

  /// This [searchPopularVideos] enables you to search Pexels for any topic that you would like.
  /// For example your query could be something broad like Nature, Tigers, People.
  /// Or it could be something specific like Group of people working.
  Future<PopularVideo> searchPopularVideos(

      /// The search [query]. Ocean, Tigers, Pears, etc.
      String query,
      [
      /// The page number you are requesting. Default: 1
      int? page,

      /// The number of results you are requesting per page. Default: 15 Max: 80
      int? perPage,

      /// Desired photo [orientation].
      /// The current supported orientations are: landscape, portrait or square.
      String? orientation,

      /// Minimum video size. The current supported sizes are:
      /// large(4K), medium(Full HD) or small(HD).
      String? size,

      /// The locale of the search you are performing. The current supported
      /// locales are
      /// 'en-US' 'pt-BR' 'es-ES' 'ca-ES' 'de-DE' 'it-IT' 'fr-FR' 'sv-SE'
      /// 'id-ID' 'pl-PL' 'ja-JP' 'zh-TW' 'zh-CN' 'ko-KR' 'th-TH' 'nl-NL'
      /// 'hu-HU' 'vi-VN' 'cs-CZ' 'da-DK' 'fi-FI' 'uk-UA' 'el-GR' 'ro-RO'
      /// 'nb-NO' 'sk-SK' 'tr-TR' 'ru-RU'.
      String? local]) async {
    /// Creating query parameters
    Map<String, dynamic> queryParameters = {
      'query': query,
      'page': '$page',
      'per_page': '$perPage',
      'orientation': orientation,
      'size': size,
      'local': local
    };

    ///Creating Uri
    final uri =
        Uri.https(_pexelsApiBaseUrl, _pexelsPopularVideo, queryParameters);

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

    /// Return response in form of [Video] list
    return PopularVideo.fromJson(packageJson);
  }

  /// This [myCollections] returns all of your collections.
  Future<CollectionResult> myCollections(
      [
      /// The page number you are requesting. Default: 1
      int? page,

      /// The number of results you are requesting per page. Default: 15 Max: 80
      int? perPage]) async {
    /// Creating query parameters
    Map<String, dynamic> queryParameters = {
      'page': '$page',
      'per_page': '$perPage',
    };

    ///Creating Uri
    final uri =
        Uri.https(_pexelsApiBaseUrl, _pexelsCollections, queryParameters);

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

    /// Return response in form of [Video] list
    return CollectionResult.fromJson(packageJson);
  }

  ///This [featuredCollections] returns all featured collections on Pexels.
  Future<CollectionResult> featuredCollections(
      [
      /// The page number you are requesting. Default: 1
      int? page,

      /// The number of results you are requesting per page. Default: 15 Max: 80
      int? perPage]) async {
    /// Creating query parameters
    Map<String, dynamic> queryParameters = {
      'page': '$page',
      'per_page': '$perPage',
    };

    ///Creating Uri
    final uri = Uri.https(
        _pexelsApiBaseUrl, _pexelsFeaturedCollections, queryParameters);

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

    /// Return response in form of [Video] list
    return CollectionResult.fromJson(packageJson);
  }

  /// This endpoint returns all the media (photos and videos) within a single collection.
  /// You can filter to only receive photos or videos using the type parameter.

  ///This [collectionsDetails] returns all featured collections on Pexels.
  Future<CollectionDetails> collectionsDetails(
      String id,
      [
      /// The page number you are requesting. Default: 1
      int? page,

      /// The number of results you are requesting per page. Default: 15 Max: 80
      int? perPage]) async {
    /// Creating query parameters
    // Map<String, dynamic> queryParameters = {
    //   'page': '$page',
    //   'per_page': '$perPage',
    // };

    ///Creating Uri
    final uri = Uri.https(
        _pexelsApiBaseUrl, '$_pexelsCollections/$id'/**, queryParameters*/);

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

    /// Return response in form of [Video] list
    return CollectionDetails.fromJson(packageJson);
  }

  /// This endpoint returns all the media (photos and videos) within a single collection.
  /// You can filter to only receive photos or videos using the type parameter.
}
