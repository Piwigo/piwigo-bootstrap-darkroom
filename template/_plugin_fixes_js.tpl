{if isset($loaded_plugins['AdditionalPages']) && $BODY_ID == "theAdditionalPage"}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('.navbar-contextual .navbar-brand a[href="{$U_HOME}"]').html('<a href="{$U_HOME}" title="{'Home'|@translate}"><i class="fa fa-home" aria-hidden="true"></i></a>');
});                                                                                                                                                                                                   
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['piwigo-openstreetmap']) && $BODY_ID == "thePicturePage"}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  var n = $('#map-info').closest('tr');
  $('#map-info').changeElementType('tr');
  $('#map-info>dt').changeElementType('th');
  $('#map-info>th').attr("scope", "row");
  $('#map-info>dd').changeElementType('td');
  $('#map-info').insertBefore(n);
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
$(form).find('button').addClass('btn btn-primary').text('Login');
$(form).find('label').remove();
{/strip}{/footer_script}
{/if}

{if isset($loaded_plugins['user_custom_fields']) && ($BODY_ID == 'theProfilePage' || $BODY_ID == 'theRegisterPage')}
{footer_script require='jquery'}{strip}
var ucf_body_id = $('{if $BODY_ID == 'theProfilePage'}#theProfilePage{else}#theRegisterPage{/if}');
$(document).ready(function() {
  $(ucf_body_id).find('fieldset>legend').remove();
  $(ucf_body_id).find('fieldset>ul>li').changeElementType('div');
  $(ucf_body_id).find('fieldset>ul>div').addClass('form-group').unwrap();
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
{/strip}{/footer_script}
{/if}


{if isset($loaded_plugins['download_by_size'])}
{footer_script require='jquery'}{strip}
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
  var stuffAboveContent = $('.navbar-default').next('.pwgstuffs-container');
  $(stuffAboveContent).insertBefore('#content-spacer');
});
{/strip}{/footer_script}
{/if}
