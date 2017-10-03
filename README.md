Piwigo Bootstrap Darkroom
-------------------
A mobile-ready Piwigo theme based on [Bootstrap 4](https://getbootstrap.com)

Initially this theme was based on the Bootstrap Default theme by Phil Bayfield, the old version can be found in the bootstrap-v3 branch.

### Features

* Various color styles
  * [Bootswatch](https://bootswatch.com) support
  * [Material Design](http://fezvrasta.github.io/bootstrap-material-design/) included
  * A custom dark color scheme based on Lightroom® colors (the default)
* Video support using native HTML 5 video widget
* Full screen slideshow view using [PhotoSwipe](http://photoswipe.com)
  * Supports auto play
  * Supports HTML5 video
  * Album thumbnails can be linked to PhotoSwipe directly (like smartpocket)
* Configurable carousel album navigation on the picture page using [slick slider](http://kenwheeler.github.io/slick/)
* 100% mobile ready
  * fully responsive Navbars, Carousel, PhotoSwipe slideshow, video content
  * async/ondemand loading of carousel & PhotoSwipe content, adaptive image size selection, swipe & tap events
* Various configuration options
* Easy customization using SASS
 

### Usage

1. Installation:
 * Git clone and move to piwigo/themes/bootstrap_darkroom
 * Download from http://piwigo.org/ext/extension_view.php?eid=831
 * Or just use the Extension Manager
2. Enable Bootstrap Darkroom
3. To use it as the standard theme for mobile devices, you need to disable the Smartpocket theme (if enabled). In combination with the recommended plugins and by setting "Thumbnail link target" to "PhotoSwipe" or "PhotoSwipe (mobile devices only)" it will behave like smartpocket (click on thumbnail opens the slideshow, masonry style thumbnail page with ajax loading).

### Demo
A demo is available at https://pwdemo.kuther.net

### Documentation
* [Github Wiki](https://github.com/tkuther/piwigo-bootstrap-darkroom/wiki)
* [Forum thread](http://piwigo.org/forum/viewtopic.php?id=26624)
* [Issue tracker](https://github.com/tkuther/piwigo-bootstrap-darkroom/issues)

### Recommended Plugins for best mobile user experience
* [GThumb+](http://piwigo.org/ext/extension_view.php?eid=591) or [gdThumb](http://piwigo.org/ext/extension_view.php?eid=771): this will give you masonry-style thumbnail pages that make most use of valuable space.
* [RV Thumbnail Scroller](http://piwigo.org/ext/extension_view.php?eid=493): this one will load items on the thumbnails page as they are requested using ajax, ideal for swiping through albums while keeping the initial page load size small. Avoids pagination.

### Known issues

* The secondary navbar on the picture page might span several lines, depending on the length of the category/picture name. As a workaround, the number of nested levels is truncated to max 2 levels by default.
* On iOS the PhotoSwipe fullscreen mode isn't supported. On iPhone it does work in landscape orientation only, on iPad it doesn't work at all. That's an iOS bug. Works just fine on Android
* Plugins that add buttons to the Navbar might not (yet) be supported, see [Plugin Support Matrix](https://github.com/tkuther/piwigo-bootstrap-darkroom/wiki/Plugin-Support-Matrix)
* The Sidebar, if enabled in settings, doesn't play well with Bootswatch Themes. You need to CSS-style the sidebar yourself.
* Portrait mode videos (e.g. from mobile phones) need to be recoded in actual portrait orientation, rotation tags won't work.

### Preview

![Preview](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/screenshot.png)

### Components

* [Bootstrap 4](https://getbootstrap.com)
* [Bootstrap Material Design](https://fezvrasta.github.io/bootstrap-material-design/)
* [PhotoSwipe](http://photoswipe.com/)
* [Slick](http://kenwheeler.github.io/slick/)
* [jQuery-Touch-Events](https://github.com/benmajor/jQuery-Touch-Events)
* [Photography Icons](https://thenounproject.com/DmitryBaranovskiy/collection/photo/) by [Dmitry Baranovskiy](https://thenounproject.com/DmitryBaranovskiy/), Licensed under [Creative Commons 3.0](https://creativecommons.org/licenses/by/3.0/us/)

### Development & Customizing
* All stylesheets are compiled from Sass source files using node-sass.
* Dependencies are managed using npm, with a .gitignore on node_modules
* Distribution dependencies are separated from the usual npm bloat using `yarn --prod --module-folder components --ignore-optional`

To make changes to the scss files, setup the project using `npm install`, change the files and run `npm run build`.

### License

```
Copyright 2017 Thomas Kuther

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
