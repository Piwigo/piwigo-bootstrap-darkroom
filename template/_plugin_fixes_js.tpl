{if isset($loaded_plugins['piwigo-openstreetmap']) && ($BODY_ID == "thePicturePage" || $BODY_ID == "theCategoryPage")}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('.pwg-icon-globe').removeClass('pwg-icon').closest('a').html('<i class="fa fa-globe fa-fw" aria-hidden="true"></i>').addClass('nav-link').removeClass('pwg-state-default pwg-button').closest('li').addClass('nav-item osm-button').find('a>i').after('<span class="d-lg-none ml-2">'+$('.osm-button').find('a').attr('title')+'</span>');;
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['rv_gmaps']) && $BODY_ID == "thePicturePage"}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('.pwg-icon-map').removeClass('pwg-icon').closest('a').html('<i class="fa fa-globe fa-fw" aria-hidden="true"></i>').addClass('nav-link').removeClass('pwg-state-default pwg-button').wrap('<li class="nav-item rvgmaps-button"></li>').find('i').after('<span class="d-lg-none ml-2">'+$('.rvgmaps-button').find('a').attr('title')+'</span>');
  $('#map').wrap('<div id="mapContainer" class="container{if $theme_config->fluid_width}-fluid{/if}"></div>');
  $('#mapPicture').prependTo('#mapContainer');
});
{/strip}{/footer_script}
{/if}
{if isset($loaded_plugins['rv_gmaps']) && $BODY_ID == "theCategoryPage"}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('.pwg-icon-map').removeClass('pwg-icon').closest('a').html('<i class="fa fa-globe fa-fw" aria-hidden="true"></i>').addClass('nav-link').removeClass('pwg-state-default pwg-button').closest('li').addClass('nav-item rvgmaps-button').find('a>i').after('<span class="d-lg-none ml-2">'+$('.rvgmaps-button').find('a').attr('title')+'</span>');
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['oAuth'])}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('#navbar-menubar>.nav>dd>#quickconnect').attr('id', 'oAuthQuickconnect');
  $('#oAuthQuickconnect legend').addClass('dropdown-header').appendTo('#identificationDropdown>.dropdown-menu').changeElementType('li');
  $('#oAuthQuickconnect').closest('dd').appendTo('#identificationDropdown>.dropdown-menu');
  $('#oAuthQuickconnect').closest('dd').changeElementType('li');
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['ProtectedAlbums']) && $BODY_ID == 'theCategoryPage'}
{footer_script require='jquery'}{strip}
var form = $('#content>form');
$(form).addClass('form-inline').wrap('<div class="col-sm-12"></div>');
$(form).find('legend').changeElementType('h4');
$(form).find('fieldset').changeElementType('div');
$(form).find('div').addClass('form-group');
$(form).find('div>input[type="password"]').addClass('form-control');
$(form).find('div>input[type="submit"]').changeElementType('button');
$(form).find('button').addClass('btn btn-primary btn-raised').text('Login');
$(form).find('label').remove();
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['user_custom_fields']) && ($BODY_ID == 'theProfilePage' || $BODY_ID == 'theRegisterPage')}
{footer_script require='jquery'}{strip}
var ucf_body_id = $('{if $BODY_ID == 'theProfilePage'}#theProfilePage{else}#theRegisterPage{/if}');
$(document).ready(function() {
  $(ucf_body_id).find('fieldset>legend').remove();
  $(ucf_body_id).find('fieldset>ul>li').changeElementType('div');
  $(ucf_body_id).find('fieldset>ul>div').addClass('form-group row').unwrap();
  $(ucf_body_id).find('fieldset>div>.property>label').addClass('col-sm-2 control-label').unwrap();
  $(ucf_body_id).find('fieldset>.form-group>input').wrap('<div class="col-sm-4"></div>').addClass('form-control');
  $('#theProfilePage .property').addClass('col-sm-2 control-label').changeElementType('label');
  var u = $('#theProfilePage form#profile .form-group').first().contents().filter(function() { return this.nodeType == 3; }).eq(1);
  $(u).wrap('<div class="col-sm-4"><p class="form-control-static"></p></div>');
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['BatchDownloader'])}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  if ($('#batchDownloadLink').next('div#batchDownloadBox').length > 0) {
    $('#batchDownloadLink').closest('li').addClass('nav-item dropdown');
    $('#batchDownloadLink').addClass('nav-link dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown').attr('href', '#');
    $('#batchDownloadBox').off();
    $('#batchDownloadBox a').addClass('dropdown-item');
    $('#batchDownloadBox').attr('role', 'menu').attr('style', '');
    $('#batchDownloadBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
    $('#batchDownloadBox br').remove();
    $('#batchDownloadBox').addClass('dropdown-menu dropdown-menu-right').removeClass('switchBox').attr('id', 'batchDownloadBox2');
    $('.batch-downloader-icon').addClass('fa fa-cloud-download fa-fw').removeClass('pwg-icon');
    $('#batchDownloadLink .pwg-button-text').addClass('d-lg-none ml-2').removeClass('pwg-button-text');
  }
  if ($('.navbar-main dt:contains("Downloads")').length > 0) {
    $('.navbar-main dt:contains("Downloads")').next('dd').appendTo($('.navbar-main dt:contains("Downloads")'));
    $('.navbar-main dt:contains("Downloads")').wrap('<li class="nav-item"></li>');
    $('.navbar-main dt:contains("Downloads")').closest('li').addClass('dropdown').attr('id', 'bd_downloads');
    $('.navbar-main dt:contains("Downloads")').changeElementType('a');
    $('#bd_downloads>a').addClass('nav-link dropdown-toggle').attr('data-toggle', 'dropdown');
    $('#bd_downloads dd ul').appendTo('#bd_downloads');
    $('#bd_downloads dd').remove();
    $('#bd_downloads ul').addClass('dropdown-menu dropdown-menu-right');
    $('#bd_downloads ul>li>a').addClass('dropdown-item');
    $('#bd_downloads ul').find('span').each(function() { $(this).appendTo($(this).prev('a')); });
  }
});
$(window).on('load', function() {
 if ($('#batchDownloadLink').next('div#batchDownloadBox2').length > 0) {
    $('#batchDownloadLink').off().on('click', function() { $('#batchDownloadLink').dropdown() });
  }
});
{/strip}{/footer_script}
{/if}


{if isset($loaded_plugins['download_by_size'])}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  var liDownloadSizeLink = $('#downloadSwitchLink').closest('li');
  $(liDownloadSizeLink).addClass('dropdown');
  $('#downloadSizeBox').appendTo(liDownloadSizeLink);
  $('#downloadSwitchLink').addClass('dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown');
  $('#downloadSizeBox').addClass('dropdown-menu dropdown-menu-right').removeClass('switchBox');
  $('#downloadSizeBox a').addClass('dropdown-item');
  $('#downloadSizeBox').attr('role', 'menu').attr('style', '');
  $('#downloadSizeBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
  $('#downloadSizeBox br').remove();
});

$(window).on("load", function() {
  $('#downloadSwitchLink').off().on('click', function() {
    $('#downloadSizeBox').off();
    $('#downloadSwitchLink').dropdown();
  });
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['UserCollections']) && ($BODY_ID == 'thePicturePage' || $BODY_ID == 'theCollectionPage')}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('#thePicturePage .nav a.addCollection').wrap('<li id="collectionsDropdownBS" class="dropdown"></li>').removeClass('pwg-button pwg-state-default').addClass('dropdown-toggle');
  $('#thePicturePage #collectionsDropdown').appendTo('#collectionsDropdownBS');
  $('#thePicturePage #collectionsDropdownBS .user-collections-icon').removeClass('pwg-icon');
  $('#thePicturePage #collectionsDropdownBS .pwg-button-text').remove();
  $('#theCollectionPage .navbar .pwg-icon').removeClass('pwg-icon');
  $('#theCollectionPage input[type="submit"]').addClass('btn btn-primary');
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['PWG_Stuffs'])}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  {if $theme_config->page_header == 'jumbotron'}
  var stuffAboveContent = $('.jumbotron').next('.pwgstuffs-container');
  {elseif $theme_config->page_header == 'fancy'}
  var stuffAboveContent = $('.page-header').next('.pwgstuffs-container');
  {else}
  var stuffAboveContent = $('.navbar-main').next('.pwgstuffs-container');
  {/if}
  $(stuffAboveContent).insertAfter('.navbar-contextual');
});
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['Piwecard']) && $BODY_ID == 'thePicturePage'}
{footer_script require='jquery'}
$(document).ready(function() {
  $('.imageComment .createECardOpen').appendTo('#important-info').addClass('btn btn-primary mt-2');
});
{/footer_script}
{/if}
