<nav class="navbar navbar-contextual navbar-expand-lg navbar-dark bg-primary fixed-top mb-5">
    <div class="container">
        <div class="navbar-brand">{$SECTION_TITLE}{$LEVEL_SEPARATOR}<a href>{$current.TITLE}</a></div>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#secondary-navbar" aria-controls="secondary-navbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="fa fa-bars"></span>
        </button>
        <div class="navbar-collapse collapse justify-content-end" id="secondary-navbar">
            <ul class="navbar-nav">
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
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" title="{'Photo sizes'|@translate}">
                        <i class="fa fa-picture-o" aria-hidden="true"></i><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$current.unique_derivatives item=derivative key=derivative_type}
                        <li id="derivative{$derivative->get_type()}" class="dropdown-item derivative-li{if $derivative->get_type() == $current.selected_derivative->get_type()} active{/if}">
                            <a href="javascript:changeImgSrc('{$derivative->get_url()|@escape:javascript}','{$derivative_type}','{$derivative->get_type()}')" rel="nofollow">
                                {$derivative->get_type()|@translate}<span class="derivativeSizeDetails"> ({$derivative->get_size_hr()})</span>
                            </a>
                        </li>
{/foreach}
{if isset($U_ORIGINAL)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                        <li class="dropdown-item">
                            <a href="javascript:phpWGOpenWindow('{$U_ORIGINAL}','xxx','scrollbars=yes,toolbar=no,status=no,resizable=yes')" rel="nofollow">{'Original'|@translate}</a>
                        </li>
{/if}
                    </ul>
                </li>
{/if}
{if isset($U_SLIDESHOW_START)}
                <li class="nav-item">
                    <a class="nav-link" href="{if $theme_config->photoswipe}javascript:;{else}{$U_SLIDESHOW_START}{/if}" title="{'slideshow'|@translate}" id="startSlideshow" rel="nofollow">
                        <i class="fa fa-play" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4 text-capitalize">{'slideshow'|@translate}</span></i>
                    </a>
                </li>
{/if}
{if isset($U_METADATA)}
                <li class="nav-item">
                    <a class="nav-link" href="{$U_METADATA}" title="{'Show file metadata'|@translate}" rel="nofollow">
                        <i class="fa fa-camera-retro" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4">{'Show file metadata'|@translate}</span></i>
                    </a>
                </li>
{/if}
{if isset($current.U_DOWNLOAD)}
{if empty($current.formats)}
                <li class="nav-item">
                    <a class="nav-link" id="downloadSwitchLink" href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                        <i class="fa fa-download" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4">{'Download this file'|@translate}</span></i>
                    </a>
{else}
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" title="{'Download this file'|@translate}">
                        <i class="fa fa-download" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4">{'Download this file'|@translate}</span></i><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$current.formats item=format}
                        <li class="dropdown-item"><a href="{$format.download_url}" rel="nofollow">{$format.label}<span class="downloadformatDetails"> ({$format.filesize})</span></a></li>
  {/foreach}
                    </ul>
{/if} {* has formats *}
                </li>
{/if}
{if isset($favorite)}
                <li class="nav-item">
                    <a class="nav-link" href="{$favorite.U_FAVORITE}" title="{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}{else}{'add this photo to your favorites'|@translate}{/if}" rel="nofollow">
                        <i class="fa fa-heart{if !$favorite.IS_FAVORITE}-o{/if}"><span class="d-xl-none d-lg-none ml-4">{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}{else}{'add this photo to your favorites'|@translate}{/if}</span></i>
                    </a>
                </li>
{/if}
{if isset($U_SET_AS_REPRESENTATIVE)}
                <li class="nav-item">
                    <a class="nav-link" id="cmdSetRepresentative" href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}" rel="nofollow">
                        <i class="fa fa-link" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4">{'set as album representative'|@translate}</span></i>
                    </a>
                </li>
{/if}
{if isset($U_PHOTO_ADMIN)}
                <li class="nav-item">
                    <a class="nav-link" id="cmdEditPhoto" href="{$U_PHOTO_ADMIN}" title="{'Modify information'|@translate}" rel="nofollow">
                        <i class="fa fa-pencil" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4">{'Modify information'|@translate}</span></i>
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
                <li class="nav-item">
                    <a class="nav-link" href="{$U_CADDIE}" onclick="addToCadie(this, '{$ROOT_URL}', {$current.id}); return false;" title="{'Add to caddie'|@translate}" rel="nofollow">
                        <i class="fa fa-shopping-basket" aria-hidden="true"><span class="d-xl-none d-lg-none ml-4">{'Add to caddie'|@translate}</span></i>
                    </a>
                </li>
{/if}
{if isset($PLUGIN_PICTURE_BUTTONS)}{foreach from=$PLUGIN_PICTURE_BUTTONS item=button}{$button}{/foreach}{/if}
{if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
            </ul>
        </div>
    </div>
</nav>
