import 'package:flutter_test/flutter_test.dart';

import 'package:pexels_photos_videos/pexels_media.dart';

void main() {
  test('pass your own authorization key and image id to run this test', () {
    final pexelsMedia = PexelsMedia(authorizationKey: 'authorizationKey');
    expect(pexelsMedia.getPhoto('imageId'), 'Invalid/Valid Data');
    expect(pexelsMedia.getVideo('videoId'), 'Invalid/Valid Data');
    expect(pexelsMedia.getCuratedPhotos(1, 1), 'Invalid/Valid');
  });
}
