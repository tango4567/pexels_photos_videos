library pexels_photos_videos;

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'pexels_result.dart';

///[PexelsMedia] is having multiple methods
class PexelsMedia {
  ///Static variable are protected variable
  static const String _authorization = 'Authorization';
  static const String _contentType = 'Content-Type';
  static const String _contentTypeDefinition =
      'application/json; charset=UTF-8';

  static const String _pexelsApiBaseUrl = 'api.pexels.com';
  static const String _pexelsPhoto = 'v1/photos';

  ///[getPexelsPhotos] required to parameters
  ///1. Pexels => [authorizationKey]
  ///2. Image ID => [imageId]
  ///
  Future<PexelsResult> getPexelsPhotos(
      String authorizationKey, String imageId) async {
    final url = Uri.https(_pexelsApiBaseUrl, '$_pexelsPhoto/$imageId');

    /// Get response from Pexels.com
    final response = await http.get(url, headers: {
      _contentType: _contentTypeDefinition,
      _authorization: authorizationKey
    });

    /// If [response.statusCode != 200] then it will throw exception
    if (response.statusCode != 200) {
      throw Exception('Exception ${response.statusCode}');
    }

    /// Here we are converting [response] data to [PexelsResult]
    final packageJson = json.decode(response.body) as Map<String, dynamic>;
    return PexelsResult.fromJson(packageJson);
  }
}
