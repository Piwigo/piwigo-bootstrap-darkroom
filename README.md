Piwigo Bootstrap Darkroom
-------------------
A mobile-ready [Piwigo](http://piwigo.org) theme based on [Bootstrap 4](https://getbootstrap.com)

### Features

* Various color styles
  * [Bootswatch](https://bootswatch.com)
  * [Material Design](http://fezvrasta.github.io/bootstrap-material-design/)
  * Darkroom: a dark, low contrast color scheme based on Lightroom® colors (the default)
* Optional page header with fancy fading full width background image, or a jumbotron banner
* Different layout option for the picture details page
* Video support using native HTML 5 video widget
* Fullscreen slideshow view using [PhotoSwipe](http://photoswipe.com)
  * Supports auto play
  * Supports HTML5 video
  * Album thumbnails can be linked to PhotoSwipe directly (like smartpocket)
* Configurable carousel album navigation on the picture page using [slick slider](http://kenwheeler.github.io/slick/)
* 100% mobile ready
  * fully responsive Navbars, Carousel, PhotoSwipe slideshow, video content
  * async/ondemand loading of carousel & PhotoSwipe content, adaptive image size selection, swipe & tap events
* Various configuration options
* Easy customization using CSS overrides or SASS custom build for advanced needs.
 

### Usage

1. Installation:
 * Use the Piwigo built-in extension manager (preferred)
 * or git clone and move to piwigo/themes/bootstrap_darkroom
 * or download from http://piwigo.org/ext/extension_view.php?eid=831
2. Enable Bootstrap Darkroom
3. Disable the smartpocket theme (it's enabled by default). This is required in order to use Bootstrap Darkroom by default on mobile devices, too.

### Demo
A demo is available at https://pwdemo.kuther.net

### Documentation, Support and Issue tracker
* [Github Wiki](https://github.com/tkuther/piwigo-bootstrap-darkroom/wiki)
* [Forum thread](http://piwigo.org/forum/viewtopic.php?id=26624)
* [Issue tracker](https://github.com/tkuther/piwigo-bootstrap-darkroom/issues)

### Recommended Plugins for best mobile user experience
* [GThumb+](http://piwigo.org/ext/extension_view.php?eid=591) or [gdThumb](http://piwigo.org/ext/extension_view.php?eid=771): this will give you masonry-style thumbnail pages that make most use of valuable space.
* [RV Thumbnail Scroller](http://piwigo.org/ext/extension_view.php?eid=493): this one will load items on the thumbnails page as they are requested using ajax, ideal for swiping through albums while keeping the initial page load size small. Avoids pagination.

### Known issues

* In IE11, the navbars only display correctly if using fluid-width layout.
* On iOS the PhotoSwipe fullscreen mode isn't supported. On iPhone it does work in landscape orientation only, on iPad it doesn't work at all. That's an iOS bug. Works just fine on Android
* Plugins that add buttons to the Navbar might not (yet) be supported, see [Plugin Support Matrix](https://github.com/tkuther/piwigo-bootstrap-darkroom/wiki/Plugin-Support-Matrix)
* Portrait mode videos (e.g. from mobile phones) need to be recoded in actual portrait orientation, rotation tags won't work.

### Preview

![Preview](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/screenshot.png)

### Components

* [Bootstrap 4](https://getbootstrap.com)
* [Bootswatch](https://bootswatch.com)
* [Bootstrap Material Design](https://fezvrasta.github.io/bootstrap-material-design/)
* [PhotoSwipe](http://photoswipe.com/)
* [Slick](http://kenwheeler.github.io/slick/)
* [jQuery-Touch-Events](https://github.com/benmajor/jQuery-Touch-Events)
* [Photography Icons](https://thenounproject.com/DmitryBaranovskiy/collection/photo/) by [Dmitry Baranovskiy](https://thenounproject.com/DmitryBaranovskiy/), licensed under [Creative Commons 3.0](https://creativecommons.org/licenses/by/3.0/us/)

### Development & Customizing
* All stylesheets are compiled from Bootstrap's Sass source files using node-sass.
* Dependencies are managed using yarn. Dist dependencies are separated from the usual npm bloat using .gitignore tricks
* To install build dependencies, use
```
npm install yarn && yarn install
```

The build process is based on npm scripts and uses common shell functions, so it might not work on Windows.

To build everything, use
```
npm run build
```
To build only bootswatch, for example, use
```
npm run build:bootswatch
```
See [package.json](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/package.json) for available script commands.

There is built-in support for a custom Sass build.
* Create the file _scss/custom/custom.scss_
* Include all required Boostrap stuff in there, override variables as you wish, just like any custom bootstrap build
* Compile with `npm run build:custom`
* Select "Custom" style in the theme's configuration

### Thanks
* Phil Bayfield for his work on the Bootstrap Default theme, which this theme was initiallly based on as a child theme. It's grown up now.
* The Piwigo Team for a great gallery software
* The Piwigo translation team

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
