[![pub package](https://img.shields.io/pub/v/pexels_photos_videos.svg)](https://pub.dev/packages/pexels_photos_videos)

# Major Update
1. PexelsResult => Photo
2. Src => PhotoSrc

We changed file name and class name for better read ablity.

This package will help you to get data from [Pexels](https://pexels.com). 

## Features

This package is able to fetch full details from [Pexels](https://pexels.com).

## Getting started

Use of this package is very easy. Inculde in your project pass your auth key and get the result.

## Usage

Example is added. It will to `/example` folder.

```dart
  PexelsMedia pexelsMedia =
      await PexelsMedia(authorizationKey: 'place your auth key here');
  Photo photo = await pexelsMedia.getPhoto('image Id');
  Video video = await pexelsMedia.getVideo('video Id');
```

## Additional information

I will update this pacakge very frequently. So I request you to visit our repo time to time.
