{combine_css path="themes/bootstrap_darkroom/slick/slick.css"}
{combine_css path="themes/bootstrap_darkroom/slick/slick-theme.css"}
{combine_script id="slick.carousel" require="jquery" path="themes/bootstrap_darkroom/slick/slick.min.js"}
{footer_script require='jquery' require="slick.carousel"}{strip}
$(document).ready(function(){
  $('#thumbnailCarousel').slick({
    infinite: {if $theme_config_extra->slick_infinite}true{else}false{/if},
{if $theme_config_extra->slick_centered}
    centerMode: true,
    swipeToSlide: true,
{else}
    centerMode: false,
{/if}
    slidesToShow: {if sizeOf($thumbnails) <= 7}{sizeOf($thumbnails)}{else}7{/if},
    slidesToScroll: {if sizeOf($thumbnails) <= 7}{sizeOf($thumbnails) - 1}{else}6{/if},
    lazyLoad: '{if $theme_config_extra->slick_lazyload == "progressive"}progressive{else}ondemand{/if}',
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
       slidesToShow: {if sizeOf($thumbnails) <= 5}{sizeOf($thumbnails)}{else}5{/if},
       slidesToScroll: {if sizeOf($thumbnails) <= 5}{sizeOf($thumbnails) - 1}{else}4{/if}
      }
     },
     {
      breakpoint: 600,
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
  var currentThumbnailIndex = $('#thumbnailCarousel .thumbnail-active').data('slick-index');
  $('#thumbnailCarousel').slick('goTo', currentThumbnailIndex, true);

  $('#thumbnailCarousel').show();
});
{/strip}{/footer_script}
