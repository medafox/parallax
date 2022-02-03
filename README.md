# Parallax
A parallax package for touch-based devices, providing a visually appealing user experience.

![example1](https://user-images.githubusercontent.com/95496813/152389588-70746f05-93e4-45c8-a94b-9ac18e66cb72.gif) ![example2](https://user-images.githubusercontent.com/95496813/152389611-ead0da77-f0ce-48b2-b3c8-1eaa4dd14985.gif)

## Getting started
In the `pubspec.yaml` of your flutter project, add the following dependency:


``` yaml
dependencies:
    ...
    parallax: <latest_version>
```

Add the following import:

``` dart
import 'package:parallax/parallax.dart';
```

Provide a required `List<String>` of images and change the remaining optional parameters to your liking. For example:

``` dart
final List<String> listOfImages = [
    'images/image1.jpg',
    'images/image2.jpg'
];

Parallax(
      parallaxImages: listOfImages,
      skewAlpha: 3.0,
      skewBeta: 7.0,
      height: 300.0,
      width: 500.0,
      paddingHorizontal: 10.0,
      viewportFraction: 0.8,
      circularBorder: true,
    );
```
