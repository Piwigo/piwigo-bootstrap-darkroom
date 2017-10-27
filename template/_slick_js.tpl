{combine_css path="themes/bootstrap_darkroom/node_modules/slick-carousel/slick/slick.css" order=-22}
{combine_css path="themes/bootstrap_darkroom/node_modules/slick-carousel/slick/slick-theme.css" order=-21}
{combine_script id="slick.carousel" require="jquery" path="themes/bootstrap_darkroom/node_modules/slick-carousel/slick/slick.min.js" load="footer"}
{footer_script require='jquery' require="slick.carousel"}{strip}
$(document).ready(function(){
  $('#thumbnailCarousel').slick({
    infinite: {if $theme_config->slick_infinite}true{else}false{/if},
    lazyLoad: '{if $theme_config->slick_lazyload == "progressive"}progressive{else}ondemand{/if}',
{if $theme_config->slick_centered}
    centerMode: true,
    swipeToSlide: true,
    slidesToShow: {if sizeOf($thumbnails) <= 7}{if sizeOf($thumbnails) > 2 && (sizeOf($thumbnails) % 2 == 0)}{sizeOf($thumbnails) -1}{else}{sizeOf($thumbnails)}{/if}{else}7{/if},
    slidesToScroll: 1,
    responsive: [
     {
      breakpoint: 1200,
      settings: {
       slidesToShow: {if sizeOf($thumbnails) <= 5}{if sizeOf($thumbnails) > 2 && (sizeOf($thumbnails) % 2 == 0)}{sizeOf($thumbnails) -1}{else}{sizeOf($thumbnails)}{/if}{else}5{/if},
      }
     },
{else}
    centerMode: false,
    slidesToShow: {if sizeOf($thumbnails) <= 7}{sizeOf($thumbnails)}{else}7{/if},
    slidesToScroll: {if sizeOf($thumbnails) <= 7}{sizeOf($thumbnails) - 1}{else}6{/if},
    responsive: [
     {
      breakpoint: 1200,
      settings: {
       slidesToShow: {if sizeOf($thumbnails) <= 5}{sizeOf($thumbnails)}{else}5{/if},
       slidesToScroll: {if sizeOf($thumbnails) <= 5}{sizeOf($thumbnails) - 1}{else}4{/if}
      }
     },
     {
      breakpoint: 1024,
      settings: {
       slidesToShow: {if sizeOf($thumbnails) <= 4}{sizeOf($thumbnails)}{else}4{/if},
       slidesToScroll: {if sizeOf($thumbnails) <= 4}{sizeOf($thumbnails) - 1}{else}3{/if}
      }
     },
{/if}
     {
      breakpoint: 768,
      settings: {
       slidesToShow: 3,
       slidesToScroll: 3
      }
     },
     {
      breakpoint: 420,
      settings: {
       centerMode: false,
       slidesToShow: 2,
       slidesToScroll: 2
      }
    }]
  });
  var currentThumbnailIndex = $('#thumbnailCarousel .thumbnail-active:not(.slick-cloned)').data('slick-index');
  $('#thumbnailCarousel').slick('goTo', currentThumbnailIndex, true);
});
{/strip}{/footer_script}
