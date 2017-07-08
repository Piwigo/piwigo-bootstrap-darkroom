#Slick Presentation Embedding

Slick was developed for Study Portal, an application for IIT Roorkee intranet made by SDSLabs. We needed to embed presentations but could not utilize SpeakerDeck/SlideShare embedding thanks to 2AM-5AM Mon-Fri Internet blackout in the campus. We were not going to show empty divs during the blackout, right?

##Features

1. There can be multiple presentations on one page.
2. Slick prefetches the next slide.
3. Quick Skipping: If the user quickly clicks on next, say, 5 times, the intermediate slides are not loaded.
4. The slide is not changed until it loads completely.
5. The slides are not deleted but kept hidden in DOM. _(unlike SpeakerDeck)_
6. Slick supports theming of presentation player.

The default options are set for the theme used in the repository. The CSS is in `examples/css/style.css` and HTML in `examples/index.html`.

Fullscreen option is available in default theme. However it is not part of slick.js due to browser quirks in styling fullscreen elements. Take a look at source of default theme in case you want to add it to your theme. We are using @sindresorhus' [screenfull.js](https://github.com/sindresorhus/screenfull.js) to manage cross browser compatibility. 

##Working

We followed the SpeakerDeck format. User uploads presentations in PDF format which is converted to images in the backend. The images are in serial order with a common suffix. Slick expects the image URL with a `*` in place of the number, the starting number and the ending one.

To create the presentation, include jQuery and slick.js.    
Slick.js: [Development](https://github.com/shashankmehta/slick.js/blob/master/dist/slick.js) and [Production](https://github.com/shashankmehta/slick.js/blob/master/dist/slick.min.js)     
Bower: `bower install --save slick`

```javascript
var s = new Slick('.slick', options); // .slick is class/id of div to be used as container for Slick.
```

The options available are:

```javascript
// Minimum options needed with default theme
options = {
	source: 'slide/slick-*.jpg',
	start: 0,
	end: 5,
};

// All options available with default values shown as set
allOptions = {
	source: undefined, // eg '/slide/slick-*.jpg'
	start: undefined, // eg 0
	end: undefined, // eg 5
	keyControl: true, // In case of multiple presentations, set true for keyboard control on this one
	theme: {
	    content: '.slick-content', // class/id for div where images will be loaded
	    currentNo: '.current-no', // class/id for showing current slide no
	    totalNo: '.total', // class/id for showing total number of slides
	    next: '.next', // class/id for the 'next' button
	    prev: '.prev', // class/id for the 'prev' button
	}
}
```

Programmatic access available:

```javascript	
// s is an instance of Slick
Slick.next(s);
Slick.prev(s);
Slick.skip(s, 6); // 6 is slide number
```

##Conversion

Our users upload presentations in PDF format. [PowerPoint](http://office.microsoft.com/en-us/powerpoint-help/save-as-pdf-HA010064992.aspx) and [KeyNote](http://support.apple.com/kb/HT3697) can directly export as PDF.    
For PDF to image conversion, we are using a tool from the excellent [ImageMagick](http://www.imagemagick.org) set, `convert`. Our handler drops down to shell and uses    

```bash
convert presentation.pdf slide.jpg
```

This converts each slide into an individual image. To just count the number of pages, `pdfinfo` is the fastest method.    

```bash
pdfinfo presentation.pdf | awk '/Pages/ {print $2}\'
```

##Author

Shashank Mehta    
[shashankmehta.in](http://shashankmehta.in)    
[@leostatic](http://twitter.com/leostatic)