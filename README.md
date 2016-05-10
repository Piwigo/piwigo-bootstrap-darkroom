Piwigo Bootstrap Darkroom
-------------------
A mobile-ready Piwigo theme based on [Bootstrap Default](https://github.com/Philio/bootstrapdefault) by Phil Bayfield.

### Features

* Lightroom based dark color scheme
* Carousel album navigation on the picture page using [slick slider](http://kenwheeler.github.io/slick/)
* Full screen view using [PhotoSwipe](http://photoswipe.com), including autoplay slideshow
* Fully responsive Navbars, Carousel and PhotoSwipe view
* Mobile ready features (async loading of carousel & PhotoSwipe content, adaptive image size selection, swipe & tap events) 

### Usage

1. Installation. Use one of:
 * Git clone and move to piwigo/themes/bootstrap_darkroom
 * Download from http://piwigo.org/ext/extension_view.php?eid=831
 * Or just use the Extension Manager
2. Enable Bootstrap Darkroom
3. Disable smartpocket, if enabled.

### Known issues

* If the square thumbnails aren't cached already, the carousel sometimes fails to load them on initial page load.
You need to scroll once to load them. Possible workarounds:
 * Pre-generate the derivates right after upload
 * Change the carousel's "on-demand" lazy loading method to "progressive" in theme settings
* The "breadcrumbs" in the second navbar might mess up the layout on mobile devices if category/picture names are long. Currently the depth of the category paths is limited two 2 level (parent category/image name) and max 80% width, but long image names can still mess things up.
* On iOS the PhotoSwipe fullscreen mode isn't supported. On iPhone it does work in landscape orientation only, on iPad it doesn't work at all. That's an iOS bug.

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
