<!-- Start of index.tpl -->
{combine_script id='cookie' require='jquery' path='themes/bootstrap_darkroom/js/jquery.cookie.js' load='footer'}
{combine_script id='equalheights' require='jquery' path='themes/bootstrap_darkroom/js/jquery.equalheights.js' load='footer'}
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/js/jquery.mobile-events.min.js' require='jquery' load='footer'}
{/if}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

    <nav class="navbar navbar-expand-lg navbar-contextual {$theme_config->navbar_contextual_style} {$theme_config->navbar_contextual_bg}{if $theme_config->page_header == 'fancy' && $theme_config->page_header_both_navs} navbar-transparent navbar-sm{/if} sticky-top mb-2">
        <div class="container{if $theme_config->fluid_width}-fluid{/if}">
            <div class="navbar-brand mr-auto">
{if isset($chronology.TITLE)}
                <a href="{$U_HOME}" title="{'Home'|@translate}"><i class="fas fa-home" aria-hidden="true"></i></a>{$LEVEL_SEPARATOR}{$chronology.TITLE}
{else}
                <div class="nav-breadcrumb d-inline-flex">{$TITLE}</div>
{/if}
            </div>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#secondary-navbar" aria-controls="secondary-navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fas fa-bars"></span>
            </button>
            <div class="navbar-collapse collapse justify-content-end" id="secondary-navbar">
                <ul class="navbar-nav">
{if !empty($image_orders)}
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" title="{'Sort order'|@translate}">
                            <i class="fas fa-sort fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Sort order'|@translate}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$image_orders item=image_order name=loop}
                            <a class="dropdown-item{if $image_order.SELECTED} active{/if}" href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a>
{/foreach}
                        </div>
                    </li>
{/if}
{if !empty($image_derivatives)}
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" title="{'Photo sizes'|@translate}">
                            <i class="far fa-image fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Photo sizes'|@translate}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$image_derivatives item=image_derivative name=loop}
                            <a class="dropdown-item{if $image_derivative.SELECTED} active{/if}" href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a>
{/foreach}
                        </div>
                    </li>
{/if}
{if isset($favorite)}
                    <li class="nav-item">
                        <a class="nav-link" href="{$favorite.U_FAVORITE}" title="{'Delete all photos from your favorites'|@translate}" rel="nofollow">
                            <i class="fas fa-heartbeat fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Delete all photos from your favorites'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_EDIT)}
                    <li class="nav-item">
                        <a class="nav-link" href="{$U_EDIT}" title="{'Edit album'|@translate}">
                            <i class="fas fa-pencil-alt fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Edit album'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_CADDIE)}
                    <li class="nav-item">
                        <a class="nav-link" href="{$U_CADDIE}" title="{'Add to caddie'|@translate}">
                            <i class="fas fa-shopping-basket fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Add to caddie'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_SEARCH_RULES)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                    <li class="nav-item">
                        <a class="nav-link" href="{$U_SEARCH_RULES}" onclick="bd_popup(this.href); return false;" title="{'Search rules'|@translate}" rel="nofollow">
                            <i class="fas fa-search fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Search rules'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_SLIDESHOW)}
                    <li class="nav-item">
                        <a class="nav-link" href="{if $theme_config->photoswipe}javascript:;{else}{$U_SLIDESHOW}{/if}" id="startSlideshow" title="{'slideshow'|@translate}" rel="nofollow">
                            <i class="fas fa-play fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2 text-capitalize">{'slideshow'|@translate}</span>
                        </a>
                    </li>
{/if}
{if isset($U_MODE_FLAT)}
                    <li class="nav-item">
                        {strip}<a class="nav-link" href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}" rel="nofollow">
                            <i class="fas fa-th-large fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'display all photos in all sub-albums'|@translate}</span>
                        </a>{/strip}
                    </li>
{/if}
{if isset($U_MODE_NORMAL)}
                    <li class="nav-item">
                        {strip}<a class="nav-link" href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}">
                            <i class="fas fa-home fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'return to normal view mode'|@translate}</span>
                        </a>{/strip}
                    </li>
{/if}
{if isset($U_MODE_POSTED) || isset($U_MODE_CREATED)}
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" title="{'Calendar'|@translate}">
                            <i class="far fa-calendar-alt fa-fw" aria-hidden="true"></i><span class="d-lg-none ml-2">{'Calendar'|@translate}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
{if isset($U_MODE_POSTED)}
                            <a class="dropdown-item" href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" rel="nofollow">
                                <i class="fas fa-share-alt fa-fw" aria-hidden="true"></i> {'display a calendar by posted date'|@translate}
                            </a>
{/if}
{if isset($U_MODE_CREATED)}
                            <a class="dropdown-item" href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" rel="nofollow">
                                <i class="fas fa-camera-retro fa-fw" aria-hidden="true"></i> {'display a calendar by creation date'|@translate}
                            </a>
{/if}
                        </div>
                    </li>
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
{if ((!empty($CATEGORIES) && !isset($GDThumb)) || (!empty($THUMBNAILS) && !isset($GThumb) && !isset($GDThumb))) && ($theme_config->category_wells == 'never' || ($theme_config->category_wells == 'mobile_only' && get_device() == 'desktop'))}
                    <li id="btn-grid" class="nav-item{if $smarty.cookies.view != 'list'} active{/if}">
                        <a class="nav-link" href="javascript:;" title="{'Grid view'|@translate}">
                            <i class="fas fa-th fa-fw"></i><span class="d-lg-none ml-2">{'Grid view'|@translate}</span>
                        </a>
                    </li>
                    <li id="btn-list" class="nav-item{if $smarty.cookies.view == 'list'} active{/if}">
                        <a class="nav-link" href="javascript:;" title="{'List view'|@translate}">
                            <i class="fas fa-th-list fa-fw"></i><span class="d-lg-none ml-2">{'List view'|@translate}</span>
                        </a>
                    </li>
{/if}
                </ul>
            </div>
        </div>
    </nav>

{include file='infos_errors.tpl'}

<div class="container{if $theme_config->fluid_width}-fluid{/if}">
{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

{if isset($chronology_views)}
    <div id="calendar-select" class="btn-group">
        <button id="calendar-view" type="button" class="btn btn-primary btn-raised dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
        </button>
        <div class="dropdown-menu" aria-labelledby="calendar-view">
            {foreach from=$chronology_views item=view name=loop}
                <a class="dropdown-item {if $view.SELECTED} active{/if}" href="{$view.VALUE}">{$view.CONTENT}</a>
            {/foreach}
        </div>
    </div>
{/if}

{if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
{/if}

{if !empty($CONTENT_DESCRIPTION)}
    <div id="content-description" class="py-3{if $theme_config->thumbnail_cat_desc == 'simple'} text-center{/if}">
{if $theme_config->thumbnail_cat_desc == 'simple'}
        <h5>{$CONTENT_DESCRIPTION}</h5>
{else}
        {$CONTENT_DESCRIPTION}
{/if}
    </div>
{/if}
    <div id="content" class="{if $smarty.cookies.view == 'list'}content-list{else}content-grid{/if}{if empty($CONTENT_DESCRIPTION)} pt-3{/if}">
{if !empty($CONTENT)}
    <!-- Start of content -->
    {$CONTENT}
    <!-- End of content -->
{/if}

{if !empty($CATEGORIES)}
    <!-- Start of categories -->
{$CATEGORIES}
{footer_script require='jquery'}{strip}
$(document).ready(function() {
  $('#content .col-outer .card-body:has(> .card-title)').equalHeights();
});
{/strip}{/footer_script}
    <!-- End of categories -->
{/if}

{if !empty($THUMBNAILS)}
        <!-- Start of thumbnails -->
        <div id="thumbnails" class="row">{$THUMBNAILS}</div>
{footer_script require='jquery'}{literal}$(document).ready(function(){$('#content img').load(function(){$('#content .col-inner').equalHeights()})});{/literal}{/footer_script}
{if $theme_config->photoswipe}
        <div id="photoSwipeData">
{assign var=idx value=0}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
{assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
{assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
            <a href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{else}{if $theme_config->photoswipe_metadata} data-exif-make="{$thumbnail.EXIF.make}" data-exif-model="{$thumbnail.EXIF.model}" data-exif-lens="{$thumbnail.EXIF.lens}" data-exif-iso="{$thumbnail.EXIF.iso}" data-exif-apperture="{$thumbnail.EXIF.apperture}" data-exif-shutter-speed="{$thumbnail.EXIF.shutter_speed}" data-exif-focal-length="{$thumbnail.EXIF.focal_length}" data-date-created="{$thumbnail.DATE_CREATED}"{/if}{/if}></a>
{assign var=idx value=$idx+1}
{/foreach}
{include file='_photoswipe_js.tpl' selector='#photoSwipeData'}
        </div>
{footer_script require='jquery' require='photoswipe'}{strip}
$('#startSlideshow').on('click touchstart', function() {
   startPhotoSwipe(0);
   $('.pswp__button--autoplay')[0].click();
});

function setupPhotoSwipe() {
   $('#thumbnails').find("a:has(img):not(.addCollection)").each(function(_index) {
      var $pswpIndex = {if isset($GDThumb) || isset($GThumb)}{$START_ID}{else}0{/if};
      if ($(this).find('img').length > 0) {
         var _href = $(this).href;
         $(this).attr('href', 'javascript:;').attr('data-href', _href);
         if (!$(this).attr('data-index')) {
            $(this).attr('data-index', _index);
            $pswpIndex = $pswpIndex + _index;
         } else {
            $pswpIndex = $pswpIndex + $(this).data('index');
         }
         $(this).off('click tap').on('click tap', function(event) {
            event.preventDefault();
            startPhotoSwipe($pswpIndex);
         });
      }
   });
}

{if $theme_config->thumbnail_linkto == 'photoswipe' || ($theme_config->thumbnail_linkto == 'photoswipe_mobile_only' && get_device() != 'desktop')}
$(document).ready(function() {
   setupPhotoSwipe();
});

{if isset($loaded_plugins['rv_tscroller'])}
$(document).ajaxComplete(function() {
   setupPhotoSwipe();
});
{/if}
{/if}
{/strip}{/footer_script}
{/if}
{footer_script require="jquery"}{strip}
{if !isset($loaded_plugins['piwigo-videojs']) && (isset($GThumb) || isset($GDThumb))}
function addVideoIndicator() {
  $('img.thumbnail[src*="pwg_representative"]').each(function() {
    $(this).closest('li').append('<i class="fas fa-file-video fa-2x video-indicator" aria-hidden="true" style="position: absolute; top: 10px; left: 10px; z-index: 100; color: #fff;"></i>');
  });
}
$(document).ready(function() {
  addVideoIndicator();
});
$(document).ajaxComplete(function() {
  addVideoIndicator();
});
{else}
$('.card-thumbnail').find('img[src*="pwg_representative"]').each(function() {
  $(this).closest('div').append('<i class="fas fa-file-video fa-2x video-indicator" aria-hidden="true" style="position: absolute; top: 10px; left: 10px; z-index: 100; color: #fff;"></i>');
});
{/if}
{/strip}{/footer_script}
        <!-- End of thumbnails -->
{/if}
    </div>
</div>
{if !empty($cats_navbar) || !empty($thumb_navbar)}
<div class="container{if $theme_config->fluid_width}-fluid{/if}">
{if !empty($cats_navbar)}
    {include file='navigation_bar.tpl' fragment="content"|@get_extent:'navbar' navbar=$cats_navbar}
{/if}
{if !empty($thumb_navbar) && !isset($loaded_plugins['rv_tscroller'])}
    {include file='navigation_bar.tpl' fragment="content"|@get_extent:'navbar' navbar=$thumb_navbar}
{/if}
</div>
{/if}

{if !empty($category_search_results)}
<div class="container{if $theme_config->fluid_width}-fluid{/if}">
    <h3 class="category_search_results">{'Album results for'|@translate} <em><strong>{$QUERY_SEARCH}</strong></em></h3>
    <p>
        <em><strong>
{foreach from=$category_search_results item=res name=res_loop}
{if !$smarty.foreach.res_loop.first} &mdash; {/if}
            {$res}
{/foreach}
        </strong></em>
    </p>
</div>
{/if}

{if !empty($tag_search_results)}
<div class="container{if $theme_config->fluid_width}-fluid{/if}">
    <h3 class="tag_search_results">{'Tag results for'|@translate} <em><strong>{$QUERY_SEARCH}</strong></em></h3>
    <p>
        <em><strong>
{foreach from=$tag_search_results item=tag name=res_loop}
{if !$smarty.foreach.res_loop.first} &mdash; {/if}
            <a href="{$tag.URL}">{$tag.name}</a>
{/foreach}
        </strong></em>
    </p>
</div>
{/if}

<div class="container{if $theme_config->fluid_width}-fluid{/if}">
{if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>

{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
<!-- End of index.tpl -->
