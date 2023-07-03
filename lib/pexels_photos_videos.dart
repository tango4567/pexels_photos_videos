library pexels_photos_videos;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pexels_photos_videos/const_strings.dart';

import 'pexels_result.dart';

class PexelsMedia {
  Future<PexelsResult> getPexelsPhotos(
      String authorizationKey, String imageId) async {
    final url = Uri.https(
        ConstStrings.pexelsApiBaseUrl, '${ConstStrings.pexelsPhoto}/$imageId');

    final response = await http.post(url,
        headers: {
          ConstStrings.contentType: ConstStrings.formUrlencoded,
          ConstStrings.authorization: authorizationKey
        },
        encoding: Encoding.getByName(ConstStrings.encodingTypeUtf8));

    // If the request didn't succeed, throw an exception
    if (response.statusCode != 200) {
      // print("Error");
      throw Exception('Exception ${response.statusCode}');
    }

    final packageJson = json.decode(response.body) as Map<String, dynamic>;
    return PexelsResult.fromJson(packageJson);
  }
}
