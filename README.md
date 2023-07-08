[![pub package](https://img.shields.io/pub/v/pexels_photos_videos.svg)](https://pub.dev/packages/pexels_photos_videos)

## Important information

This package is under development.

This package will help you to get data from [Pexels](https://pexels.com). 

## Features

This package is able to fetch full details from [Pexels](https://pexels.com).

## Getting started

Use of this package is very easy. Inculde in your project pass your auth key and get the result.

## Usage

Example is added. It's available  to `/example` folder.

```dart
  PexelsMedia pexelsMedia =
      await PexelsMedia(authorizationKey: 'place your auth key here');
  Photo photo = await pexelsMedia.getPhoto('image Id');
  Video video = await pexelsMedia.getVideo('video Id');
  Curated curated = await pexelsMedia.getCuratedPhotos(1,1);
  SearchPhoto searchResultPhotos = await pexelsMedia.searchPhotos("search text");
  SearchVideo searchResultVideos = await pexelsMedia.searchVideos("search text");
```