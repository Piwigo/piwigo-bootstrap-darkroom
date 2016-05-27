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
                         $src_preview    = $(this).data('src-large'),
                         $size_preview   = $(this).data('size-large').split(' x '),
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
            bgOpacity: 0.95,
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
           if ($('.videoHolder').length > 0) updateVideoPosition(photoSwipe);
        });

        photoSwipe.listen('close', function() {
           removeVideo();
        });
    });

    function removeVideo() {
        if ($('.videoHolder').length > 0) { 
            if ($('#video').length > 0) {
                $('video')[0].pause();
                $('video')[0].src = "";
                $('.videoHolder').remove();
                $('.pswp__img').css('visibility','visible');
                $(document).off('webkitfullscreenchange mozfullscreenchange fullscreenchange');
                if ((navigator.appVersion.indexOf("iPhone") !== -1) || (navigator.appVersion.indexOf("iPad") !== -1)) {
                    $('.videoHolder').css('background', '');
                }
            } else {
                $('.videoHolder').remove();
            }
        }
    }
 
    function detectVideo(photoSwipe) {
        var is_video = photoSwipe.currItem.is_video;
        if (is_video) {
            addVideo(photoSwipe.currItem);
            updateVideoPosition(photoSwipe);
        }
    }

    function addVideo(item, vp) {
        var videofile = item.videoProperties.src;
        var v = $('<div />', {
                    class:'videoHolder',
                    css : ({literal}{'position': 'absolute','width':item.w, 'height':item.h}{/literal})

        });
        v.one('click', (function() {
            var playerCode = '<video id="video" width="'+item.w+'" height="'+item.h+'" autoplay controls>' +
            '<source src="'+videofile+'" type="video/mp4"></source>' +
            '</video>';
            $(this).html(playerCode);
            $('.pswp__img').css('visibility','hidden');
            $('.pswp__scroll-wrap .videoHolder video').css('visibility', 'visible');
            if ((navigator.appVersion.indexOf("iPhone") !== -1) || (navigator.appVersion.indexOf("iPad") !== -1)) {
                $('.videoHolder').css('background', 'none');
            }
        }));
        v.appendTo('.pswp__scroll-wrap');

        {* this is soooo nasty, but i have no better idea to fix the fullscreen video issue on OS X *}
        if (navigator.appVersion.indexOf("Macintosh") !== -1) {
            $(document).on('webkitfullscreenchange mozfullscreenchange fullscreenchange MSFullscreenChange', function(e) {
                var state = document.fullScreen || document.mozFullScreen || document.webkitIsFullScreen,
                    event = state ? 'FullscreenOn' : 'FullscreenOff',
                    holder_height = item.h;
                console.log('fullscreen toggled: ' + event + ', video height: ' + holder_height);
                if (event === 'FullscreenOn') {
                    $('#the_page').hide();
                    $('body').css('margin-top', '-'+window.screen.height);
                    $('.videoHolder').css('height', window.screen.height);
                } else {
                    $('body').css('margin-top', '');
                    $('#the_page').show();
                    $('.videoHolder').css('height', holder_height);
                }
            });
        }
    }
 
    function updateVideoPosition(o) {
        var item = o.currItem;
        var vp = o.viewportSize;
        var top = (vp.y - item.h)/2;
        var left = (vp.x - item.w)/2;
        $('.videoHolder').css({literal}{position:'absolute',top:top, left:left}{/literal});
    }
};

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

{/strip}{/footer_script}
