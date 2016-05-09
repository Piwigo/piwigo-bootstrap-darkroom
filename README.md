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

Note: the theme doesn't override configuration options from the "bootstrap default" parent theme (yet)
like social integration or bootstrap theme. To change those, enable bootstrap default and configure things there.

### Known issues

* If the square thumbnails aren't cached already, the carousel sometimes fails to load them on initial page load.
You need to scroll once to load them. Possible workarounds:
 * Pre-generate the derivates right after upload
 * Change the carousel's "on-demand" lazy loading method to "progressive", but this would load _all_ thumbnails
* The "breadcrumbs" in the second navbar might mess up the layout on mobile devices if category/picture names are long. Currently the depth of the category paths is limited two 2 level (parent category/image name) and max 80% width, but long image names can still mess things up.
* On iOS the PhotoSwipe fullscreen mode isn't supported. On iPhone it does work in landscape orientation only, on iPad it doesn't work at all. That's an iOS bug.

### TODOs

* Make some carousel options configurable in the Admin backend (lazy loading method, number of thumbnails etc)

### Preview

![Preview](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/screenshot.png)
