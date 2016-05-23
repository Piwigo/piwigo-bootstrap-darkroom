Piwigo Bootstrap Darkroom
-------------------
A mobile-ready Piwigo theme based on [Bootstrap Default](https://github.com/Philio/bootstrapdefault) by Phil Bayfield.

### Features

* Choose themes from [Bootswatch](https://bootswatch.com), or use the included dark color scheme based on Lightroom's colors (default).
* Configurable carousel album navigation on the picture page using [slick slider](http://kenwheeler.github.io/slick/)
* Full screen slideshow view using [PhotoSwipe](http://photoswipe.com), including autoplay slideshow
* Fully responsive Navbars, Carousel and PhotoSwipe view
* Mobile ready features (async loading of carousel & PhotoSwipe content, adaptive image size selection, swipe & tap events) 

### Usage

1. Installation. Use one of:
 * Git clone and move to piwigo/themes/bootstrap_darkroom
 * Download from http://piwigo.org/ext/extension_view.php?eid=831
 * Or just use the Extension Manager
2. Enable Bootstrap Darkroom
3. To use it as the standard theme for mobile devices, you need to disable the Smartpocket theme (if enabled). In combination with the recommended plugins and by setting "Thumbnail link target" to "PhotoSwipe" or "PhotoSwipe (mobile devices only)" it will behave like smartpocket (click on thumbnail opens the slideshow, masonry style thumbnail page with ajax loading).

### Recommended Plugins
* [GThumb+](http://piwigo.org/ext/extension_view.php?eid=591) or [gdThumb](http://piwigo.org/ext/extension_view.php?eid=771): this will give you masonry-style thumbnail page.
* [RV Thumbnail Scroller](http://piwigo.org/ext/extension_view.php?eid=493): this one will load items on the thumbnails page as they are requested using ajax. HIGHLY recommended for mobile devices.

### Known issues

* The secondary navbar on the picture page might span several lines, depending on the length of the category/picture name. As a workaround, the number of nested levels is truncated to max 2 levels.
* On iOS the PhotoSwipe fullscreen mode isn't supported. On iPhone it does work in landscape orientation only, on iPad it doesn't work at all. That's an iOS bug. Works just fine on Android
* For videos, PhotoSwipe will show the thumbnail instead of playing the video
* Plugins that add buttons to the Navbar might not (yet) be supported, see [Plugin Support Matrix](https://github.com/tkuther/piwigo-bootstrap-darkroom/wiki/Plugin-Support-Matrix)
* The Sidebar, if enabled in settings, doesn't play well with Bootswatch Themes. You need to CSS-style the sidebar yourself.

### Preview

![Preview](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/screenshot.png)

### License

```
Copyright 2016 Thomas Kuther

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
