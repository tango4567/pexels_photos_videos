import 'package:flutter/foundation.dart';
import 'package:pexels_photos_videos/pexels_media.dart';
import 'package:pexels_photos_videos/pexels_result.dart';

void main() async {
  /// Call [PexelsMedia] and get [PexelsResult]
  PexelsResult result = await PexelsMedia()
      .getPexelsPhotos('place your auth key here', 'image Id');
  if (kDebugMode) {
    print(result.photographer);
  }
}
