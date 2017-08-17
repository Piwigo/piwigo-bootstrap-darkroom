{footer_script require='bootstrap'}
{literal}
if ($('.jumbotron').length > 0) {
    var $affix_height = $('.navbar-main').height() + $('.jumbotron').outerHeight();
    $('.navbar-contextual').affix({ offset: {top: $affix_height } });
    $('.navmenu').css('top', $affix_height);
} else {
    $('.navbar-contextual').affix({ offset: {top: 50} });
}
{/literal}
$('.navmenu').on('show.bs.offcanvas', function() {
    if ($('ul.navmenu-nav').contents().length === 0) {
        $($('ul.navbar-nav').contents()).appendTo('ul.navmenu-nav');
        $('ul.navmenu-nav').find('.dropdown-menu').addClass('dropdown-menu-right');
        $('ul.navmenu-nav').find('.dropdown-toggle').attr('aria-haspopup', 'true');
    }
{if $theme_config_extra->bootstrap_theme == 'bootswatch' || $theme_config_extra->bootstrap_theme == 'material' }
    $('.navmenu').css('background-color', $('.navbar-default').css('background-color'));
{/if}
});
$('.navmenu').on('hidden.bs.offcanvas', function() {
    if ($('ul.navmenu-nav').contents().length > 0) {
        $($('ul.navmenu-nav').contents()).appendTo('ul.navbar-nav');
        $('ul.navmenu-nav').find('.dropdown-menu-right').removeClass('dropdown-menu-right');
        $('ul.navmenu-nav').find('.dropdown-toggle').attr('aria-haspopup', '');
    }
});
{/footer_script}
<div id="navmenu-contextual" class="navmenu navmenu-default navmenu-fixed-right offcanvas" role="navigation">
    <ul class="nav navmenu-nav"></ul>
</div>
    <nav class="navbar navbar-default navbar-fixed-top navbar-contextual">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#navmenu-contextual">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand">{$SECTION_TITLE}{$LEVEL_SEPARATOR}<a href>{$current.TITLE}</a> <small>[{$PHOTO}]</small></div>
{if $theme_config_extra->bootstrap_theme == 'bootswatch' || $theme_config_extra->bootstrap_theme == 'material'}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
$('.navbar-default .navbar-brand a').css('color', $('.navbar-default .navbar-brand').css('color'));
});
{/strip}{/footer_script}
{/if}
            </div>
            <div class="navbar-right navbar-collapse collapse">
                <ul class="nav navbar-nav">
{if isset($current.unique_derivatives) && count($current.unique_derivatives)>1}
{footer_script require='jquery'}{strip}
    function changeImgSrc(url,typeSave,typeMap) {
        var theImg = document.getElementById("theMainImage");
        if (theImg) {
            theImg.removeAttribute("width");
            theImg.removeAttribute("height");
            theImg.src = url;
            theImg.useMap = "#map"+typeMap;
        }
        jQuery('.derivative-li').removeClass('active');
        jQuery('#derivative'+typeMap).addClass('active');
        document.cookie = 'picture_deriv='+typeSave+';path={$COOKIE_PATH}';
    }
{/strip}{/footer_script}
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{'Photo sizes'|@translate}">
              <i class="fa fa-picture-o" aria-hidden="true"></i><span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
{foreach from=$current.unique_derivatives item=derivative key=derivative_type}
                <li id="derivative{$derivative->get_type()}" class="derivative-li{if $derivative->get_type() == $current.selected_derivative->get_type()} active{/if}">
                    <a href="javascript:changeImgSrc('{$derivative->get_url()|@escape:javascript}','{$derivative_type}','{$derivative->get_type()}')" rel="nofollow">
                                {$derivative->get_type()|@translate}<span class="derivativeSizeDetails"> ({$derivative->get_size_hr()})</span>
                    </a>
                </li>
{/foreach}
{if isset($U_ORIGINAL)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                <li>
                    <a href="javascript:phpWGOpenWindow('{$U_ORIGINAL}','xxx','scrollbars=yes,toolbar=no,status=no,resizable=yes')" rel="nofollow">{'Original'|@translate}</a>
                </li>
{/if}
            </ul>
        </li>
{/if}
{if isset($U_SLIDESHOW_START)}
        <li>
            <a href="{if $theme_config_extra->photoswipe}javascript:;{else}{$U_SLIDESHOW_START}{/if}" title="{'slideshow'|@translate}" id="startSlideshow" rel="nofollow">
                <i class="fa fa-play" aria-hidden="true"></i>
            </a>
        </li>
{/if}
{if isset($U_METADATA)}
        <li>
            <a href="{$U_METADATA}" title="{'Show file metadata'|@translate}" rel="nofollow">
                <i class="fa fa-camera-retro" aria-hidden="true"></i>
            </a>
        </li>
{/if}
{if isset($current.U_DOWNLOAD)}
{if empty($current.formats)}
        <li>
            <a id="downloadSwitchLink" href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                <i class="fa fa-download" aria-hidden="true"></i>
            </a>
{else}
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">
                <i class="fa fa-download" aria-hidden="true"></i><span class="caret"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" role="menu">
  {foreach from=$current.formats item=format}
                <li><a href="{$format.download_url}" rel="nofollow">{$format.label}<span class="downloadformatDetails"> ({$format.filesize})</span></a></li>
  {/foreach}
            </ul>
{/if} {* has formats *}
        </li>
{/if}
{if isset($favorite)}
        <li>
            <a href="{$favorite.U_FAVORITE}" title="{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}{else}{'add this photo to your favorites'|@translate}{/if}" rel="nofollow">
                <i class="fa fa-heart{if !$favorite.IS_FAVORITE}-o{/if}"></i>
            </a>
        </li>
{/if}
{if isset($U_SET_AS_REPRESENTATIVE)}
        <li>
            <a id="cmdSetRepresentative" href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}" rel="nofollow">
                <i class="fa fa-link" aria-hidden="true"></i>
            </a>
        </li>
{/if}
{if isset($U_PHOTO_ADMIN)}
        <li>
            <a id="cmdEditPhoto" href="{$U_PHOTO_ADMIN}" title="{'Modify information'|@translate}" rel="nofollow">
                <i class="fa fa-pencil" aria-hidden="true"></i>
            </a>
        </li>
{/if}
{if isset($U_CADDIE)}
{footer_script}{strip}
    function addToCadie(aElement, rootUrl, id) {
        if (aElement.disabled) return;
        aElement.disabled=true;
        var y = new PwgWS(rootUrl);
        y.callService("pwg.caddie.add", {literal}{image_id: id}{/literal}, {
            onFailure: function(num, text) { alert(num + " " + text); document.location=aElement.href; },
            onSuccess: function(result) { aElement.disabled = false; }
        });
    }
{/strip}{/footer_script}
        <li>
            <a href="{$U_CADDIE}" onclick="addToCadie(this, '{$ROOT_URL}', {$current.id}); return false;" title="{'Add to caddie'|@translate}" rel="nofollow">
                <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            </a>
        </li>
{/if}
{if isset($PLUGIN_PICTURE_BUTTONS)}{foreach from=$PLUGIN_PICTURE_BUTTONS item=button}{$button}{/foreach}{/if}
{if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
                </ul>
            </div>
        </div>
    </nav>
