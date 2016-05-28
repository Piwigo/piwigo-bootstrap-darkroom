{combine_css path="themes/bootstrap_darkroom/photoswipe/photoswipe.css"}
{combine_css path="themes/bootstrap_darkroom/photoswipe/default-skin/default-skin.css"}
{combine_script id="photoswipe" require="jquery" path="themes/bootstrap_darkroom/photoswipe/photoswipe.min.js"}
{combine_script id="photoswipe.ui" require="photoswipe" path="themes/bootstrap_darkroom/photoswipe/photoswipe-ui-default.min.js"}
{footer_script require='jquery' require="photoswipe.ui"}{strip}
var selector = '{$selector}';

function startPhotoSwipe(idx) {
    $(selector).each(function() {
         $('#thumbnail-active').addClass('active');
         var $pic     = $(this),
             getItems = function() {
                 var items = [];
                 $pic.find('a').each(function() {
                   if ($(this).attr('data-video')) {
                     var $src            = $(this).data('src-original'),
                         $size           = $(this).data('size-original').split('x'),
                         $width          = $size[0],
                         $height         = $size[1],
                         $src_preview    = $(this).data('src-medium'),
                         $size_preview   = $(this).data('size-medium').split(' x '),
                         $width_preview  = $size_preview[0],
                         $height_preview = $size_preview[1],
                         $href           = $(this).attr('href'),
                         $title          = '<div class="text-center"><a href="' + $href + '"><i class="glyphicon glyphicon-info-sign"></i> ' + $(this).data('title') + '</div>';
                     var item = {
                         is_video : true,
                         src      : $src_preview,
                         w        : $width_preview,
                         h        : $height_preview,
                         title    : $title,
                         videoProperties: {
                            src   : $src,
                            w     : $width,
                            h     : $height,
                         }
                     };
                   } else {
                     var $src_xlarge    = $(this).data('src-xlarge'),
                         $size_xlarge   = $(this).data('size-xlarge').split(' x '),
                         $width_xlarge  = $size_xlarge[0],
                         $height_xlarge = $size_xlarge[1],
                         $src_large     = $(this).data('src-large'),
                         $size_large    = $(this).data('size-large').split(' x '),
                         $width_large   = $size_large[0],
                         $height_large  = $size_large[1],
                         $src_medium    = $(this).data('src-medium'),
                         $size_medium   = $(this).data('size-medium').split(' x '),
                         $width_medium  = $size_medium[0],
                         $height_medium = $size_medium[1],
                         $href          = $(this).attr('href'),
                         $title         = '<div class="text-center"><a href="' + $href + '"><i class="glyphicon glyphicon-info-sign"></i> ' + $(this).data('title') + '</div>';
                     var item = {
                         is_video: false,
                         mediumImage: {
                             src   : $src_medium,
                             w     : $width_medium,
                             h     : $height_medium,
                             title : $title
                         },
                         largeImage: {
                             src   : $src_large,
                             w     : $width_large,
                             h     : $height_large,
                             title : $title
                         },
                         xlargeImage: {
                             src   : $src_xlarge,
                             w     : $width_xlarge,
                             h     : $height_xlarge,
                             title : $title
                         }
                     };
                   }
                   items.push(item);
                 });
                 return items;
             };
        var items = getItems();

        var $pswp = $('.pswp')[0];
        if (typeof(idx) === "number") {
            var $index = idx;
        } else {
            var $index = $(selector + ' a.active').data('index');
        }
        if (navigator.userAgent.match(/IEMobile\/11\.0/)) {
            var $history = false;
        } else {
            var $history = true;
        }
        var options = {
            index: $index,
            showHideOpacity: true,
            closeOnScroll: false,
            closeOnVerticalDrag: false,
            focus: false,
            history: $history
        };
        var photoSwipe = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
        var realViewportWidth,
            useLargeImages = false,
            firstResize = true,
            imageSrcWillChange;

        photoSwipe.listen('beforeResize', function() {
            realViewportWidth = photoSwipe.viewportSize.x * window.devicePixelRatio;
            if(useLargeImages && realViewportWidth < 1335) {
                useLargeImages = false;
                imageSrcWillChange = true;
            } else if(!useLargeImages && realViewportWidth >= 1335) {
                useLargeImages = true;
                imageSrcWillChange = true;
            }

            if(imageSrcWillChange && !firstResize) {
                photoSwipe.invalidateCurrItems();
            }

            if(firstResize) {
                firstResize = false;
            }

            imageSrcWillChange = false;
        });

        photoSwipe.listen('gettingData', function(index, item) {
            if(!item.is_video) { 
              if( useLargeImages ) {
                  item.src = item.xlargeImage.src;
                  item.w = item.xlargeImage.w;
                  item.h = item.xlargeImage.h;
                  item.title = item.xlargeImage.title;
              } else {
                  item.src = item.largeImage.src;
                  item.w = item.largeImage.w;
                  item.h = item.largeImage.h;
                  item.title = item.largeImage.title;
              }
            }
        });

        var autoplayId = null;
        $('.pswp__button--autoplay').on('click touchstart', function(event) {
            event.preventDefault();
            if (autoplayId) {
                clearInterval(autoplayId);
                autoplayId = null;
                $('.pswp__button--autoplay').removeClass('stop');
            } else {
                autoplayId = setInterval(function() { photoSwipe.next(); $index = photoSwipe.getCurrentIndex(); }, {$theme_config_extra->photoswipe_interval});
                $('.pswp__button--autoplay').addClass('stop');
            }
        });

        photoSwipe.listen('destroy', function() {
            if (autoplayId) {
                clearInterval(autoplayId);
                autoplayId = null;
                $('.pswp__button--autoplay').removeClass('stop');
            }
            $('.pswp__button--autoplay').off('click touchstart');
            $('#thumbnailCarousel a.active').removeClass('active');
        });

        photoSwipe.init();

        detectVideo(photoSwipe);

        photoSwipe.listen('initialZoomInEnd', function() {
	    curr = photoSwipe.getCurrentIndex();
            if (curr !== $index && autoplayId == null) {
                photoSwipe.goTo($index);
            }
        });

        photoSwipe.listen('afterChange', function() {
            detectVideo(photoSwipe);
        });

        photoSwipe.listen('beforeChange', function() {
           removeVideo();
        });

        photoSwipe.listen('resize', function() { 
           if ($('.video-modal').length > 0) {
              var vsize = setVideoSize(photoSwipe.currItem, photoSwipe.viewportSize);
              console.log('PhotoSwipe resize in action. Setting video size to ' + vsize.w + 'x' + vsize.h);
              $('.video-modal').css({literal}{'width':vsize.w, 'height':vsize.h}{/literal});
              updateVideoPosition(photoSwipe);
           }
        });

        photoSwipe.listen('close', function() {
           removeVideo();
        });
    });

    function removeVideo() {
        if ($('.video-modal').length > 0) { 
            if ($('#video').length > 0) {
                $('video')[0].pause();
                $('video')[0].src = "";
                $('.video-modal').remove();
                $('.pswp__img').css('visibility','visible');
                $(document).off('webkitfullscreenchange mozfullscreenchange fullscreenchange');
                if (navigator.userAgent.match(/(iPhone|iPad|Android)/)) {
                    $('.video-modal').css('background', '');
                }
            } else {
                $('.video-modal').remove();
            }
        }
    }
 
    function detectVideo(photoSwipe) {
        var is_video = photoSwipe.currItem.is_video;
        if (is_video) {
            addVideo(photoSwipe.currItem, photoSwipe.viewportSize);
            updateVideoPosition(photoSwipe);
        }
    }

    function addVideo(item, vp) {
        var vfile = item.videoProperties.src;
        var vsize = setVideoSize(item, vp);
        var v = $('<div />', {
                    class:'video-modal',
                    css : ({literal}{'position': 'absolute','width':vsize.w, 'height':vsize.h}{/literal})

        });
        v.one('{if get_device() == 'desktop'}click{else}touchstart{/if}', (function() {
            var playerCode = '<video id="video" width="100%" height="auto" autoplay controls>' +
            '<source src="'+vfile+'" type="video/mp4"></source>' +
            '</video>';
            $(this).html(playerCode);
            $('.pswp__img').css('visibility','hidden');
            $('.video-modal video').css('visibility', 'visible');
            if (navigator.userAgent.match(/(iPhone|iPad|Android)/)) {
                $('.video-modal').css('background', 'none');
            }
            console.log('video click fired');
        }));
        v.appendTo('.pswp__scroll-wrap');

        {* this is soooo nasty, but i have no better idea to fix the fullscreen video issue on OS X, Chrome/Windows *}
        if (!(navigator.userAgent.match("Firefox") == -1 && navigator.appVersion.indexOf("Windows") !== -1) || navigator.appVersion.indexOf("Macintosh") !== -1 ) {
            $(document).on('webkitfullscreenchange mozfullscreenchange fullscreenchange MSFullscreenChange', function(e) {
                var state = document.fullScreen || document.mozFullScreen || document.webkitIsFullScreen,
                    event = state ? 'FullscreenOn' : 'FullscreenOff',
                    holder_height = item.h;
                console.log('fullscreen toggled: ' + event + ', video height: ' + holder_height);
                if (event === 'FullscreenOn') {
                    $('#the_page').hide();
                    $('body').css('height', window.screen.height);
                    $('.video-modal').css('height', window.screen.height);
                } else {
                    $('#the_page').show();
                    $('body').css('height', '');
                    $('.video-modal').css('height', holder_height);
                }
            });
        }
    }
 
    function updateVideoPosition(o, w, h) {
        var item = o.currItem;
        var vp = o.viewportSize;
        var vsize = setVideoSize(item, vp);
        var top = (vp.y - vsize.h)/2;
        var left = (vp.x - vsize.w)/2;
        $('.video-modal').css({literal}{position:'absolute',top:top, left:left}{/literal});
    }

    function setVideoSize(item, vp) {
        var w = item.videoProperties.w,
            h = item.videoProperties.h,
            vw = vp.x,
            r,
            vh;
            console.log('video width: ' + w + ', viewport width: ' + vw);
        if (vw < w) {
            r = w/h;
            vh = vw/r;
            console.log('viewport is smaller. resized video to ' + vw + 'x' + vh);
            w = vw;
            h = vh;
        }

	return {
            w: w,
            h: h
        };
    }
};

$(document).ready(function() {
    $('#startPhotoSwipe').on('click', function(event) {
        event.preventDefault;
        startPhotoSwipe();
    });
{if get_device() != 'desktop'}
    $('#theImage').on('doubletap', startPhotoSwipe);
{/if}
{if isset($U_SLIDESHOW_START)}
    $('#startSlideshow').on('click touchstart', function() {
        startPhotoSwipe(0);
        $('.pswp__button--autoplay')[0].click();
    });
{/if}
    if (window.location.hash === "#start-slideshow") {
        startPhotoSwipe();
        $('.pswp__button--autoplay')[0].click();
    }
});
{/strip}{/footer_script}
