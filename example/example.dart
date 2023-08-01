import 'package:flutter/foundation.dart';
import 'package:pexels_photos_videos/curated.dart';
import 'package:pexels_photos_videos/pexels_media.dart';
import 'package:pexels_photos_videos/photo.dart';
import 'package:pexels_photos_videos/search_photo.dart';
import 'package:pexels_photos_videos/video.dart';
import 'package:pexels_photos_videos/search_video.dart';

void main() async {
  /// Call [PexelsMedia] and get [PexelsResult]
  var pexelsMedia =
      await PexelsMedia(authorizationKey: 'place your auth key here');
  Photo photo = await pexelsMedia.getPhoto('image Id');
  Video video = await pexelsMedia.getVideo('video Id');
  Curated curated = await pexelsMedia.getCuratedPhotos(1, 1);
  SearchPhoto searchPhotos = await pexelsMedia.searchPhotos("search text");
  SearchVideo searchVideos = await pexelsMedia.searchVideos("nature", 1, 10);
  if (kDebugMode) {
    print(photo.photographer);
    print(video.user);
    print(curated.totalResult);
    print(searchPhotos.totalResults);
    print(searchVideos.totalResults);
  }
}
