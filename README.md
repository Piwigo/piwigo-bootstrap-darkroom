Piwigo Bootstrap Darkroom
-------------------
A Piwigo theme based on [Bootstrap Default](https://github.com/Philio/bootstrapdefault) by Phil Bayfield.

### Features

* Fully responsive
* Lightroom based dark color scheme
* Carousel album navigation on the picture page using [slick slider](http://kenwheeler.github.io/slick/)
 * Responsive scale down of thumbnails: large = 6, medium = 4, small = 2
 * Lazy loading of thumbnails on-demand to keep the initial page load size down

### Usage

1. Git clone and move to piwigo/themes/bootstrap_darkroom, or just use the Extension Manager
2. Enable Bootstrap Darkroom

Note: the theme doesn't override configuration options from the "bootstrap default" parent theme
like social integration or bootstrap theme. To change those, enable bootstrap default and configure things there.

### Known issues

* If the square thumbnails aren't cached already, the carousel sometimes fails to load them on initial page load.
You need to scroll once to load them. Possible workarounds:
 * Pre-generate the derivates right after upload
 * Change the carousel's "on-demand" lazy loading method to "progressive", but this would load _all_ thumbnails

### TODOs

* Make picture.tpl actually usable on mobile devices (full screen images, dragable & swishable, off-canvas info), maybe overriding current picture.tpl with a synced slider.
* Make some carousel options configurable in the Admin backend (lazy loading, number of thumbnails etc)

### Preview

![Preview](https://raw.githubusercontent.com/tkuther/piwigo-bootstrap-darkroom/master/screenshot.png)
