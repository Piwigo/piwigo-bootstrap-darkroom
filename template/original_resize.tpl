{*
  If we display the original rather than a custom size, the image can be bigger than the rest. 
  An original is used under a certain size.
  To avoid display problems with original images the size is changed in this file to mimic the custom size images in the page.
  The image becomes limited by its container.
  For more details see issue #331:
  https://github.com/Piwigo/piwigo-bootstrap-darkroom/issues/331
 *}
{footer_script require='jquery'}
  {literal}

var imageHeight = "180";
var imagesToResize = new Array();
let pattern = /-cu_e\d+x\d+/;

$('.thumb-img').each(function( index ) {
  if('-1' != $(this).prop("currentSrc").search(pattern)){
    imageHeight = $(this).height();
  }
  else{
    imagesToResize.push($(this));    
  } 
});

$(imagesToResize).each(function( index ) {
  $(this).parent().addClass('container-original-to-resize');
  $(this).parent().css('height', imageHeight);
});

  {/literal}
{/footer_script}