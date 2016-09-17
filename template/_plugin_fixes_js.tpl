{if isset($loaded_plugins['user_custom_fields'])}
{footer_script require='jquery'}
{literal}
$(document).ready(function() {
  $('#theRegisterPage').find('fieldset>legend').remove();
  $('#theRegisterPage').find('fieldset>ul>li').changeElementType('div');
  $('#theRegisterPage').find('fieldset>ul>div').addClass('form-group').unwrap();
  $('#theRegisterPage').find('fieldset>div>.property>label').addClass('col-sm-2 control-label').unwrap();
  $('#theRegisterPage').find('fieldset>.form-group>input').wrap('<div class="col-sm-4"></div>').addClass('form-control');
});
{/literal}
{/footer_script}
{/if}

{if isset($loaded_plugins['BatchDownloader'])}
{footer_script require='jquery'}
{literal}
$(document).ready(function() {
  if ($('#batchDownloadLink').next('div#batchDownloadBox').length > 0) {
    $('#batchDownloadLink').closest('li').addClass('dropdown');
    $('#batchDownloadLink').addClass('dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown').attr('href', '#');
    $('#batchDownloadLink .pwg-button-text').after('<span class="caret"></span>');
    $('#batchDownloadBox').changeElementType('ul');
    $('#batchDownloadBox a').wrap('<li></li>');
    $('#batchDownloadBox').attr('role', 'menu').attr('style', '');
    $('#batchDownloadBox .switchBoxTitle').changeElementType('li');
    $('#batchDownloadBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
    $('#batchDownloadBox br').remove();
    $('#batchDownloadBox').addClass('dropdown-menu').removeClass('switchBox');
  }
  if ($('.navbar-main dt:contains("Downloads")').length > 0) {
    $('.navbar-main dt:contains("Downloads")').next('dd').appendTo($('.navbar-main dt:contains("Downloads")'));
    $('.navbar-main dt:contains("Downloads")').wrap('<li></li>');
    $('.navbar-main dt:contains("Downloads")').closest('li').addClass('dropdown').attr('id', 'bd_downloads');
    $('.navbar-main dt:contains("Downloads")').changeElementType('a');
    $('#bd_downloads>a').addClass('dropdown-toggle').attr('data-toggle', 'dropdown').append('<span class="caret"></span>');
    $('#bd_downloads dd ul').appendTo('#bd_downloads');
    $('#bd_downloads dd').remove();
    $('#bd_downloads ul').addClass('dropdown-menu');
    $('#bd_downloads ul').find('span').each(function() { $(this).appendTo($(this).prev('a')); });
  }
});
$(window).load(function() {
  if ($('#batchDownloadLink').next('ul#batchDownloadBox').length > 0) {
    $('#batchDownloadLink').off().on('click', function() { $('#downloadSizeLink').dropdown() });
  }
});
{/literal}
{/footer_script}
{/if}


{if isset($loaded_plugins['DownloadBySize'])}
{footer_script require='jquery'}
{literal}
$(document).ready(function() {
  var liDownloadSizeLink = $('#downloadSizeLink').closest('li');
  $('#downloadSizeBox').appendTo(liDownloadSizeLink);
  $(liDownloadSizeLink).addClass('dropdown');
  $('#downloadSizeLink').addClass('dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown');
  $('#downloadSizeLink .pwg-button-text').after('<span class="caret"></span>');
  $('#downloadSizeBox').changeElementType('ul');
  $('#downloadSizeBox a').wrap('<li></li>');
  $('#downloadSizeBox').attr('role', 'menu').attr('style', '');
  $('#downloadSizeBox .switchBoxTitle').changeElementType('li');
  $('#downloadSizeBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
  $('#downloadSizeBox br').remove();
  $('#downloadSizeBox').addClass('dropdown-menu').removeClass('switchBox');
});

$(window).load(function() {
  $('#downloadSizeBox').off('mouseleave click');
  $('#downloadSizeLink').off().on('click', function() { $('#downloadSizeLink').dropdown() });
});
{/literal}
{/footer_script}
{/if}
