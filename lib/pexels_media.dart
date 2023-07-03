library pexels_photos_videos;

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'pexels_result.dart';

class PexelsMedia {

  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
  static const String contentTypeDefinition = 'application/json; charset=UTF-8';

  static const String pexelsApiBaseUrl = 'api.pexels.com';
  static const String pexelsPhoto = 'v1/photos';
  static const String pexelsVideos = 'v1/videos';


  Future<PexelsResult> getPexelsPhotos(
      String authorizationKey, String imageId) async {
    final url = Uri.https(
        pexelsApiBaseUrl, '$pexelsPhoto/$imageId');

    final response = await http.get(url,
        headers: {
          contentType: contentTypeDefinition,
          authorization: authorizationKey
        });

    if (response.statusCode != 200) {
      throw Exception('Exception ${response.statusCode}');
    }

    final packageJson = json.decode(response.body) as Map<String, dynamic>;
    return PexelsResult.fromJson(packageJson);
  }
}
