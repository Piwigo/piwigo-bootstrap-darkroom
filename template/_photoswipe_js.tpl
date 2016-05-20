{combine_css path="themes/bootstrap_darkroom/photoswipe/photoswipe.css"}
{combine_css path="themes/bootstrap_darkroom/photoswipe/default-skin/default-skin.css"}
{combine_script id="photoswipe" require="jquery" path="themes/bootstrap_darkroom/photoswipe/photoswipe.min.js"}
{combine_script id="photoswipe.ui" require="photoswipe" path="themes/bootstrap_darkroom/photoswipe/photoswipe-ui-default.min.js"}
{footer_script require='jquery' require="photoswipe.ui"}{strip}
$('#thumbnailCarousel').find('a').each(function(idx) {
   $(this).attr('data-index', idx);
});

function startPhotoSwipe() {
    $('#thumbnailCarousel').each(function() {
         var $pic     = $(this),
             getItems = function() {
                 var items = [];
                 $pic.find('a').each(function() {
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
    
                     items.push(item);
                 });
                 return items;
             };
        var items = getItems();

        var $pswp = $('.pswp')[0];
        var $index = $('#thumbnailCarousel').find('[data-thumbnail-active="1"] a').data('index');
        var options = {
            index: $index,
            bgOpacity: 0.95,
            showHideOpacity: true,
            closeOnScroll: false,
            closeOnVerticalDrag: false
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
        });

        photoSwipe.init();

        var autoplayId = null;
        $('.pswp__button--autoplay').on('click touchstart', function(event) {
            event.preventDefault();
            if (autoplayId) {
                clearInterval(autoplayId);
                autoplayId = null;
                $('.pswp__button--autoplay').removeClass('stop');
            } else {
                autoplayId = setInterval(function() { photoSwipe.next(); }, {$theme_config_extra->photoswipe_interval});
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
        });
    });
};

$('#startPhotoSwipe').on('click', 'span', startPhotoSwipe);
{if get_device() != 'desktop'}
$('#theImage').on('doubletap', startPhotoSwipe);
{/if}
{if isset($U_SLIDESHOW_START)}
$('#startSlideshow').on('click touchstart', function() {
  console.log('Starting slideshow..');
  startPhotoSwipe();
  $('.pswp__button--autoplay')[0].click();
});
{/if}
if (window.location.hash === "#start-slideshow") {
    console.log('Received #start-slideshow url hash. Starting slideshow...');
    startPhotoSwipe();
    $('.pswp__button--autoplay')[0].click();
}
{/strip}{/footer_script}
