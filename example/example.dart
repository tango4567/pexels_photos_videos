import 'package:flutter/foundation.dart';
import 'package:pexels_photos_videos/pexels_media.dart';
import 'package:pexels_photos_videos/photo.dart';

void main() async {
  /// Call [PexelsMedia] and get [PexelsResult]
  Photo photo = await PexelsMedia()
      .getPhoto('place your auth key here', 'image Id');
  if (kDebugMode) {
    print(photo.photographer);
  }
}
