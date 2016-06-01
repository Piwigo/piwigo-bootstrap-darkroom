{if $theme_config_extra->bootswatch}
{footer_script require='jquery'}
var nav_bg = $('.navbar').css('background-color');
$('.navmenu').css('background-color', nav_bg);
{/footer_script}
{/if}

<div id="picture-nav" class="navmenu navmenu-default navmenu-fixed-right offcanvas" role="navigation">
    <ul class="nav navmenu-nav">
{if isset($current.unique_derivatives) && count($current.unique_derivatives)>1}
{footer_script require='jquery'}{strip}
    function changeImgSrc(url,typeSave,typeMap) {
        var theImg = document.getElementById("theMainImage");
        if (theImg) {
            theImg.removeAttribute("width");theImg.removeAttribute("height");
            theImg.src = url;
            theImg.useMap = "#map"+typeMap;
        }
        jQuery('.derivative-li').removeClass('active');
        jQuery('#derivative'+typeMap).addClass('active');
        document.cookie = 'picture_deriv='+typeSave+';path={$COOKIE_PATH}';
    }
{/strip}{/footer_script}
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">
            <span class="glyphicon glyphicon-picture"></span><span class="glyphicon-text">{'Photo sizes'|@translate}</span><span class="caret"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" role="menu">
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
            <a href="{if $theme_config_extra->photoswipe}javascript:;{else}{$U_SLIDESHOW_START}{/if}" title="{'Slideshow'|@translate}" id="startSlideshow" rel="nofollow">
                <span class="glyphicon glyphicon-play"></span><span class="glyphicon-text">{'Slideshow'|@translate}</span>
            </a>
        </li>
{/if}
{if isset($U_METADATA)}
        <li>
            <a href="{$U_METADATA}" title="{'Show file metadata'|@translate}" rel="nofollow">
                <span class="glyphicon glyphicon-camera"></span><span class="glyphicon-text">{'Show file metadata'|@translate}</span>
            </a>
        </li>
{/if}
{if isset($current.U_DOWNLOAD)}
{if empty($current.formats)}
        <li>
            <a id="downloadSwitchLink" href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                <span class="glyphicon glyphicon-download-alt"></span><span class="glyphicon-text">{'Download'|@translate}</span>
            </a>
{else}
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">
                <span class="glyphicon glyphicon-download-alt"></span><span class="glyphicon-text">{'Download'|@translate}</span><span class="caret"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" role="menu">
  {foreach from=$current.formats item=format}
                <li><a href="{$format.download_url}" rel="nofollow">{$format.label}<span class="downloadformatDetails"> ({$format.filesize})</span></a></li>
  {/foreach}
            </ul>
{/if} {* has formats *}
        </li>
{/if}
{if isset($PLUGIN_PICTURE_BUTTONS)}{foreach from=$PLUGIN_PICTURE_BUTTONS item=button}{$button}{/foreach}{/if}
{if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
{if isset($favorite)}
        <li>
            <a href="{$favorite.U_FAVORITE}" title="{if $favorite.IS_FAVORITE}{'Delete this photo from your favorites'|@translate}{else}{'Add this photo to your favorites'|@translate}{/if}" rel="nofollow">
                <span class="glyphicon glyphicon-heart{if !$favorite.IS_FAVORITE}-empty{/if}"></span><span class="glyphicon-text">{'Favorites'|@translate}</span>
            </a>
        </li>
{/if}
{if isset($U_SET_AS_REPRESENTATIVE)}
        <li>
            <a id="cmdSetRepresentative" href="{$U_SET_AS_REPRESENTATIVE}" title="{'Set as album representative'|@translate}" rel="nofollow">
                <span class="glyphicon glyphicon-link"></span><span class="glyphicon-text">{'representative'|@translate}</span>
            </a>
        </li>
{/if}
{if isset($U_PHOTO_ADMIN)}
        <li>
            <a id="cmdEditPhoto" href="{$U_PHOTO_ADMIN}" title="{'Modify information'|@translate}" rel="nofollow">
                <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'Edit'|@translate}</span>
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
                <span class="glyphicon glyphicon-plus-sign"></span><span class="pwg-button-text">{'Caddie'|@translate}</span>
            </a>
        </li>
{/if}
    </ul>
</div> <!-- end navmenu -->
<div class="canvas">
    <nav class="navbar navbar-default navbar-fixed-top navbar-secondary">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#picture-nav" data-recalc="false" data-canvas=".canvas">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand">{$SECTION_TITLE}{$LEVEL_SEPARATOR}<a href>{$current.TITLE}</a> [{$PHOTO}]</div>
{footer_script require='jquery'}{strip}
$(document).ready(function() {
if (!navigator.userAgent.match(/rv:11/)) {
 var $nrLevels = $('.navbar-secondary .navbar-brand a').length,
     $html;
 while ($nrLevels > 2) {
   $('.navbar-secondary .navbar-brand a')[0].remove();
   $nrLevels = $('.navbar-secondary .navbar-brand a').length;
   $html = $('.navbar-secondary .navbar-brand').html().replace(/^ \/ /, "");
   if ($nrLevels === 2) {
      $('.navbar-secondary .navbar-brand').html('<a href="{$U_HOME}" title="{'Home'|@translate}"><span class="glyphicon glyphicon-home"></span><span class="glyphicon-text">{'Home'|@translate}</span></a>{$LEVEL_SEPARATOR}' + $html);
   } else {
      $('.navbar-secondary .navbar-brand').html($html);
   }
 }
}
});
{/strip}{/footer_script}
            </div> <!-- end navbar-header -->
            <div class="navbar-right navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-picture"></span><span class="glyphicon-text">{'Photo sizes'|@translate}</span><span class="caret"></span>
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
{if isset($U_SLIDESHOW_START)}
                    <li>
                        <a href="{if $theme_config_extra->photoswipe}javascript:;{else}{$U_SLIDESHOW_START}{/if}" title="{'Slideshow'|@translate}" id="startSlideshow" rel="nofollow">
                            <span class="glyphicon glyphicon-play"></span><span class="glyphicon-text">{'Slideshow'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_METADATA)}
                    <li>
                        <a href="{$U_METADATA}" title="{'Show file metadata'|@translate}" rel="nofollow">
                            <span class="glyphicon glyphicon-camera"></span><span class="glyphicon-text">{'Show file metadata'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($current.U_DOWNLOAD)}
{if empty($current.formats)}
                    <li>
                       <a id="downloadSwitchLink" href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                           <span class="glyphicon glyphicon-download-alt"></span><span class="glyphicon-text">{'Download'|@translate}</span>
                        </a>
{else}
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-download-alt"></span><span class="glyphicon-text">{'Download'|@translate}</span><span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
{foreach from=$current.formats item=format}
                            <li><a href="{$format.download_url}" rel="nofollow">{$format.label}<span class="downloadformatDetails"> ({$format.filesize})</span></a></li>
{/foreach}
                        </ul>
{/if} {* has formats *}
                    </li>
{/if}
{if isset($PLUGIN_PICTURE_BUTTONS)}{foreach from=$PLUGIN_PICTURE_BUTTONS item=button}{$button}{/foreach}{/if}
{if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
{if isset($favorite)}
                    <li>
                        <a href="{$favorite.U_FAVORITE}" title="{if $favorite.IS_FAVORITE}{'Delete this photo from your favorites'|@translate}{else}{'Add this photo to your favorites'|@translate}{/if}" rel="nofollow">
                            <span class="glyphicon glyphicon-heart{if !$favorite.IS_FAVORITE}-empty{/if}"></span><span class="glyphicon-text">{'Favorites'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_SET_AS_REPRESENTATIVE)}
                    <li>
                        <a id="cmdSetRepresentative" href="{$U_SET_AS_REPRESENTATIVE}" title="{'Set as album representative'|@translate}" rel="nofollow">
                            <span class="glyphicon glyphicon-link"></span><span class="glyphicon-text">{'representative'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_PHOTO_ADMIN)}
                    <li>
                        <a id="cmdEditPhoto" href="{$U_PHOTO_ADMIN}" title="{'Modify information'|@translate}" rel="nofollow">
                            <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'Edit'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_CADDIE)}
                    <li>
                        <a href="{$U_CADDIE}" onclick="addToCadie(this, '{$ROOT_URL}', {$current.id}); return false;" title="{'Add to caddie'|@translate}" rel="nofollow">
                            <span class="glyphicon glyphicon-plus-sign"></span><span class="pwg-button-text">{'Caddie'|@translate}</span>
                        </a>
                    </li>
{/if}
                </ul>
            </div> <!-- end navbar-right -->
        </div> <!-- end container -->
    </nav>
</div> <!-- end canvas -->
