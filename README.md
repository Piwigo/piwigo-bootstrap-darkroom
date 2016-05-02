Piwigo Bootstrap Darkroom
-------------------
A mobile-ready Piwigo theme based on [Bootstrap Default](https://github.com/Philio/bootstrapdefault) by Phil Bayfield.

### Features

* Lightroom based dark color scheme
* Carousel album navigation on the picture page using [slick slider](http://kenwheeler.github.io/slick/)
* Full screen view using PhotoSwipe
* Fully responsive Navbars, Carousel and PhotoSwipe view
* Mobile ready features (async loading of carousel & PhotoSwipe content, swipe & tap events) 

### Usage

1. Installation. Use one of:
 * Git clone and move to piwigo/themes/bootstrap_darkroom
 * Download from http://piwigo.org/ext/extension_view.php?eid=831
 * Or just use the Extension Manager
2. Enable Bootstrap Darkroom

Note: the theme doesn't override configuration options from the "bootstrap default" parent theme (yet)
like social integration or bootstrap theme. To change those, enable bootstrap default and configure things there.

### Known issues

* If the square thumbnails aren't cached already, the carousel sometimes fails to load them on initial page load.
You need to scroll once to load them. Possible workarounds:
 * Pre-generate the derivates right after upload
 * Change the carousel's "on-demand" lazy loading method to "progressive", but this would load _all_ thumbnails
* Some features from Bootstrap Default do not work yet (social buttons, discus comments)
* The "breadcrumbs" in the second navbar might mess up the layout on mobile devices if category/picture names are long

### TODOs

* Make some carousel options configurable in the Admin backend (lazy loadingi method, number of thumbnails etc)
* Get social buttons from Bootstrap Default working

### Preview

![Preview](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/screenshot.png)
