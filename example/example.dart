import 'package:flutter/foundation.dart';
import 'package:pexels_photos_videos/pexels_media.dart';
import 'package:pexels_photos_videos/photo.dart';
import 'package:pexels_photos_videos/video.dart';

void main() async {
  /// Call [PexelsMedia] and get [PexelsResult]
  var pexelsMedia =
      await PexelsMedia(authorizationKey: 'place your auth key here');
  Photo photo = await pexelsMedia.getPhoto('image Id');
  Video video = await pexelsMedia.getVideo('video Id');
  if (kDebugMode) {
    print(photo.photographer);
    print(video.user);
  }
}
