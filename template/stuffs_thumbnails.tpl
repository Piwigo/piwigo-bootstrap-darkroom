{assign var='thumbnails' value=$block.thumbnails}
{assign var='derivative_params' value=$block.derivative_params}
<div class="row pwgstuffs-thumbnails">
  {include file='thumbnails.tpl'|@get_extent:'index_thumbnails'}
</div>

{footer_script require='jquery'}
$(document).ready(function() {
  var elm = $('.pwgstuffs-thumbnails').closest('.pwgstuffs-col');
  if ($(elm).is('.col-lg-3, .col-lg-4')) {
    $('.pwgstuffs-thumbnails .col-outer').removeClass($('.pwgstuffs-thumbnails .col-outer').data('grid-classes')).addClass('col-12');
  } else if ($(elm).is('.col-lg-6')) {
    $('.pwgstuffs-thumbnails .col-outer').removeClass($('.pwgstuffs-thumbnails .col-outer').data('grid-classes')).addClass('col-12 col-lg-6');
  } else if ($(elm).is('.col-lg-8, .col-lg-9')) {
    $('.pwgstuffs-thumbnails .col-outer').removeClass($('.pwgstuffs-thumbnails .col-outer').data('grid-classes')).addClass('col-12 col-lg-4');
  }
});
{/footer_script}
