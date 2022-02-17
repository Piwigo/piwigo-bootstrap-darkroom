{strip}
{if isset($loaded_plugins['piwigo-openstreetmap']) && ($BODY_ID == "thePicturePage" || $BODY_ID == "theCategoryPage")}
{footer_script require='jquery'}
$(document).ready(function() {
  $('.pwg-icon-globe').removeClass('pwg-icon').closest('a').html('<i class="fas fa-globe fa-fw" aria-hidden="true"></i>').addClass('nav-link').removeClass('pwg-state-default pwg-button').closest('li').addClass('nav-item osm-button').find('a>i').after('<span class="d-lg-none ml-2">'+$('.osm-button').find('a').attr('title')+'</span>');;
});
{/footer_script}
{/if}

{if isset($loaded_plugins['rv_gmaps']) && $BODY_ID == "thePicturePage"}
{footer_script require='jquery'}
$(document).ready(function() {
  $('.pwg-icon-map').removeClass('pwg-icon').closest('a').html('<i class="fas fa-globe fa-fw" aria-hidden="true"></i>').addClass('nav-link').removeClass('pwg-state-default pwg-button').wrap('<li class="nav-item rvgmaps-button"></li>').find('i').after('<span class="d-lg-none ml-2">'+$('.rvgmaps-button').find('a').attr('title')+'</span>');
  $('#map').wrap('<div id="mapContainer" class="container"></div>');
  $('#mapPicture').prependTo('#mapContainer').wrap('<div class="row justify-content-center"></div>');
});
{/footer_script}
{/if}

{if isset($loaded_plugins['rv_gmaps']) && $BODY_ID == "theCategoryPage"}
{footer_script require='jquery'}
$(document).ready(function() {
  $('.pwg-icon-map').removeClass('pwg-icon').closest('a').html('<i class="fas fa-globe fa-fw" aria-hidden="true"></i>').addClass('nav-link').removeClass('pwg-state-default pwg-button').closest('li').addClass('nav-item rvgmaps-button').find('a>i').after('<span class="d-lg-none ml-2">'+$('.rvgmaps-button').find('a').attr('title')+'</span>');
});
{/footer_script}
{/if}
{if isset($loaded_plugins['rv_gmaps']) && $BODY_ID == "theMapListPage"}
{footer_script require='jquery'}
$(document).ready(function() {
  $('#theMapListPage #wrapper').addClass('container');
  $('#theMapListPage ul.categoryActions').addClass('nav flex-column').find('li').addClass('nav-item').find('a').addClass('nav-link');
  $('#theMapListPage .pwg-icon-globe').addClass('fa fa-globe').removeClass('pwg-icon pwg-icon-globe');
  $('#theMapListPage .pwg-icon-home').addClass('fa fa-home').removeClass('pwg-icon pwg-icon-home');
  $('#theMapListPage #thumbnails').addClass('row').changeElementType('div');
  $('#theMapListPage #thumbnails').find('.card-thumbnail').addClass('mb-3');
});
{/footer_script}
{/if}

{if isset($loaded_plugins['oAuth'])}
{footer_script require='jquery'}
$(document).ready(function() {
  $('#navbar-menubar>.navbar-nav>dd>#quickconnect').attr('id', 'oAuthQuickconnect');
  $('#oAuthQuickconnect legend').addClass('dropdown-header').appendTo('#identificationDropdown>.dropdown-menu').changeElementType('li');
  $('#oAuthQuickconnect').closest('dd').appendTo('#identificationDropdown>.dropdown-menu');
  $('#oAuthQuickconnect').closest('dd').changeElementType('li');
});
{/footer_script}
{/if}

{if isset($loaded_plugins['ProtectedAlbums']) && $BODY_ID == 'theCategoryPage'}
{footer_script require='jquery'}
var form = $('#content>form');
$(form).addClass('form-inline').wrap('<div class="col-sm-12"></div>');
$(form).find('legend').changeElementType('h4');
$(form).find('fieldset').changeElementType('div');
$(form).find('div').addClass('form-group');
$(form).find('div>input[type="password"]').addClass('form-control');
$(form).find('div>input[type="submit"]').changeElementType('button');
$(form).find('button').addClass('btn btn-primary btn-raised').text('Login');
$(form).find('label').remove();
{/footer_script}
{/if}

{if isset($loaded_plugins['user_custom_fields']) && ($BODY_ID == 'theProfilePage' || $BODY_ID == 'theRegisterPage')}
{footer_script require='jquery'}
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
{/footer_script}
{/if}

{if isset($loaded_plugins['BatchDownloader'])}
{footer_script require='jquery'}
$(document).ready(function() {
  if ($('#batchDownloadLink').next('div#batchDownloadBox').length > 0) {
    $('#batchDownloadLink').closest('li').addClass('nav-item dropdown');
    $('#batchDownloadLink').addClass('nav-link dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown').attr('href', '#');
    $('#batchDownloadBox').off();
    $('#batchDownloadBox a').addClass('dropdown-item');
    $('#batchDownloadBox').attr('role', 'menu').attr('style', '');
    $('#batchDownloadBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
    $('#batchDownloadBox br').remove();
    $('#batchDownloadBox').addClass('dropdown-menu dropdown-menu-right').removeClass('switchBox');
    $('#batchDownloadLink .pwg-button-text').addClass('d-lg-none ml-2').removeClass('pwg-button-text');
  } else {
    $('#batchDownloadLink').closest('li').addClass('nav-item');
    $('#batchDownloadLink').addClass('nav-link').removeClass('pwg-state-default pwg-button');
  }
  $('.batch-downloader-icon').addClass('fas fa-cloud-download-alt fa-fw').removeClass('pwg-icon').after('<span class="d-lg-none"> ' + $('#batchDownloadLink').attr('title') + '</span>');
});
$(window).on('load', function() {
 if ($('#batchDownloadLink').next('div#batchDownloadBox').length > 0) {
    $('#batchDownloadLink').next('div#batchDownloadBox').off();
    $('#batchDownloadLink').off().on('click', function() { $('#batchDownloadLink').dropdown() });
  }
});
{/footer_script}
{/if}

{if isset($loaded_plugins['download_by_size'])}
{footer_script require='jquery'}
$(document).ready(function() {
  if ($('#downloadSizeBox').length < 1) {
    return false;
  }

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
{/footer_script}
{/if}

{if isset($loaded_plugins['PWG_Stuffs'])}
{footer_script require='jquery'}
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
{/footer_script}
{/if}

{if isset($loaded_plugins['Piwecard']) && $BODY_ID == 'thePicturePage'}
{footer_script require='jquery'}
$(document).ready(function() {
  $('.imageComment .createECardOpen').appendTo('#important-info').addClass('btn btn-primary mt-2');
});
{/footer_script}
{/if}

{if isset($loaded_plugins['tag_groups']) && $BODY_ID == 'theTagsPage'}
{footer_script require='jquery'}
$(document).ready(function() {
  $('.container table').addClass('table table-sm').attr('id', 'tagGroupsTable');
});
{/footer_script}
{/if}

{if isset($loaded_plugins['Contact1menu'])}
{footer_script require='jquery'}
$(document).ready(function() {
  $('#navbar-menubar a[title="{'Contact'|@translate}"]').addClass('nav-link').closest('dt').addClass('nav-item').attr('id', 'Contact1menu').changeElementType('li');
});
{/footer_script}
{/if}
{/strip}

{if isset($loaded_plugins['rv_tscroller'])}
{footer_script require='jquery'}{literal}
$(document).ready(function() {
  if (window.jQuery && window.RVTS && RVTS.start>0) {
        var $f = $('.navbar-contextual .navbar-brand a:last-child');
        $('#rvtsUp').html( '<div id="rvtsUp" style="text-align:center;font-size:120%;margin:10px"><a href="'+$f.attr("href")+'">'+$f.html()+'</a> | <a href="javascript:RVTS.loadUp()">'+RVTS.prevMsg+"</a></div>" );
  }
});
{/literal}{/footer_script}
{/if}
