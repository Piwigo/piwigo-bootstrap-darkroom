<!-- Start of index.tpl -->
{combine_script id='core.switchbox' require='jquery' path='themes/default/js/switchbox.js'}
{combine_script id='cookie' require='jquery' path="themes/bootstrapdefault/js/jquery.cookie.js"}
{combine_script id='equalheights' require='jquery' path="themes/bootstrapdefault/js/jquery.equalheights.js"}
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/js/jquery.mobile-events.min.js' require='jquery'}
{/if}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

<nav class="navbar navbar-default navbar-secondary" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">
                {$TITLE}
{if isset($chronology.TITLE)}
                {$LEVEL_SEPARATOR}{$chronology.TITLE}
{/if}
            </div>
        </div>
        <div class="navbar-right navbar-collapse collapse" id="primary-nav">
            <ul class="nav navbar-nav">
{if !empty($image_orders)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-sort"></span><span class="glyphicon-text">{'Sort order'|@translate}</span><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$image_orders item=image_order name=loop}
                        <li{if $image_order.SELECTED} class="active"{/if}><a href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a></li>
{/foreach}
                    </ul>
                </li>
{/if}
{if !empty($image_derivatives)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-picture"></span><span class="glyphicon-text">{'Photo sizes'|@translate}</span><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$image_derivatives item=image_derivative name=loop}
                        <li{if $image_derivative.SELECTED} class="active"{/if}><a href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a></li>
{/foreach}
                    </ul>
                </li>
{/if}
{if isset($favorite)}
                <li>
                    <a href="{$favorite.U_FAVORITE}" title="{'Delete all photos from your favorites'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-heart"></span><span class="glyphicon-text">{'Delete all photos from your favorites'|@translate}</span>
                    </a>
                </li>
{/if}
{if isset($U_EDIT)}
                <li>
                    <a href="{$U_EDIT}" title="{'Edit album'|@translate}">
                        <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'Edit'|@translate}</span>
                    </a>
                </li>
{/if}
{if isset($U_CADDIE)}
                <li>
                    <a href="{$U_CADDIE}" title="{'Add to caddie'|@translate}">
                        <span class="glyphicon glyphicon-plus-sign"></span><span class="glyphicon-text">{'Caddie'|@translate}</span>
                    </a>
                </li>
{/if}
{if isset($U_SEARCH_RULES)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                <li>
                    <a href="{$U_SEARCH_RULES}" onclick="bd_popup(this.href); return false;" title="{'Search rules'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-search"></span><span class="glyphicon-text">(?)</span>
                    </a>
                </li>
{/if}
{if isset($U_SLIDESHOW)}
                <li>
                    {strip}<a href="{$U_SLIDESHOW}#start-slideshow" id="startSlideshow" title="{'slideshow'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-play"></span><span class="glyphicon-text">{'slideshow'|@translate}</span>
                    </a>{/strip}
                </li>
{if $theme_config_extra->photoswipe}
{* remove ?slideshow handler here *}
{footer_script require="jquery"}
$('#startSlideshow')[0].search = "";
{/footer_script}
{/if}
{/if}
{if isset($U_MODE_FLAT)}
                <li>
                    {strip}<a href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-th-large"></span><span class="glyphicon-text">{'display all photos in all sub-albums'|@translate}</span>
                    </a>{/strip}
                </li>
{/if}
{if isset($U_MODE_NORMAL)}
                <li>
                    {strip}<a href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}">
                        <span class="glyphicon glyphicon-home"></span><span class="glyphicon-text">{'return to normal view mode'|@translate}</span>
                    </a>{/strip}
                </li>
{/if}
{if isset($U_MODE_POSTED)}
                <!--
                <li>
                    {strip}<a href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-calendar"></span><span class="glyphicon-text">{'Calendar'|@translate}</span>
                    </a>{/strip}
                </li>
                -->
{/if}
{if isset($U_MODE_CREATED)}
                <!--
                <li>
                    {strip}<a href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-calendar"></span><span class="glyphicon-text">{'Calendar'|@translate}</span>
                    </a>{/strip}
                </li>
                -->
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
{if ((!empty($CATEGORIES) && !isset($GDThumb)) || (!empty($THUMBNAILS) && !isset($GThumb) && !isset($GDThumb))) && ($theme_config_extra->category_wells == 'never' || ($theme_config_extra->category_wells == 'mobile_only' && get_device() == 'desktop'))}
                <li id="btn-grid"{if $smarty.cookies.view != 'list'} class="active"{/if}><a href="#"><span class="glyphicon glyphicon-th"></span></a></li>
                <li id="btn-list"{if $smarty.cookies.view == 'list'} class="active"{/if}><a href="#"><span class="glyphicon glyphicon-th-list"></span></a></li>
{/if}
            </ul>
        </div>
    </div>
</nav>

{include file='infos_errors.tpl'}

<a name="content"></a>
<div class="container">
{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

<!--
{if isset($chronology_views)}
<div class="calendarViews">{'View'|@translate}:
    <a id="calendarViewSwitchLink" href="#">
        {foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
    </a>
    <div id="calendarViewSwitchBox" class="switchBox">
        {foreach from=$chronology_views item=view name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
            <span{if !$view.SELECTED} style="visibility:hidden"{/if}>&#x2714; </span><a href="{$view.VALUE}">{$view.CONTENT}</a>
        {/foreach}
    </div>
    {footer_script}(SwitchBox=window.SwitchBox||[]).push("#calendarViewSwitchLink", "#calendarViewSwitchBox");{/footer_script}
</div>
{/if}

{if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
{/if}
-->

{if !empty($CONTENT_DESCRIPTION)}
    <h4>
        {$CONTENT_DESCRIPTION}
    </h4>
{/if}
    <div id="content" class="{if $theme_config_extra->category_wells == 'never' || ($theme_config_extra->category_wells == 'mobile_only' && get_device() == 'desktop')}row{if $smarty.cookies.view == 'list'} content-list{else} content-grid{/if}{/if}">
{if !empty($CONTENT)}
    <!-- Start of content -->
    {$CONTENT}
    <!-- End of content -->
{/if}

{if !empty($CATEGORIES)}
    <!-- Start of categories -->
{$CATEGORIES}
{footer_script}{literal}$(document).ready(function(){$('#content img').load(function(){$('#content .col-inner').equalHeights()})});{/literal}{/footer_script}
    <!-- End of categories -->
{/if}

{if !empty($THUMBNAILS)}
        <!-- Start of thumbnails -->
        <div id="thumbnails">{$THUMBNAILS}</div>
{footer_script}{literal}$(document).ready(function(){$('#content img').load(function(){$('#content .col-inner').equalHeights()})});{/literal}{/footer_script}
{if $theme_config_extra->thumbnail_linkto == "photoswipe" || ($theme_config_extra->thumbnail_linkto == "photoswipe_mobile_only" && get_device() != 'desktop')}
{define_derivative name='derivative_params_medium' type=IMG_MEDIUM}
{define_derivative name='derivative_params_large' type=IMG_LARGE}
{define_derivative name='derivative_params_xlarge' type=IMG_XLARGE}
        <div id="thumbnailCarousel">
{assign var=idx value=0}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
{assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
{assign var=derivative_xlarge value=$pwg->derivative($derivative_params_xlarge, $thumbnail.src_image)}
            <a href="{$thumbnail.URL}"
               data-index="{$idx}"
               data-title="{$thumbnail.TN_TITLE}"
               data-src-medium="{$derivative_medium->get_url()}"
               data-size-medium="{$derivative_medium->get_size_hr()}"
               data-src-large="{$derivative_large->get_url()}"
               data-size-large="{$derivative_large->get_size_hr()}"
               data-src-xlarge="{$derivative_xlarge->get_url()}"
               data-size-xlarge="{$derivative_xlarge->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{/if}></a>
{assign var=idx value=$idx+1}
{/foreach}
{include file='_photoswipe_js.tpl' selector='#thumbnailCarousel'}
        </div>
{footer_script require='jquery' require='photoswipe'}
$('#startSlideshow').attr('href', 'javascript:;');
$('#startSlideshow').on('click touchstart', function() {
   startPhotoSwipe(0);
   $('.pswp__button--autoplay')[0].click();
});

function setupPhotoSwipe() {
   $('#thumbnails').find('a').each(function(_index) {
      var $pswpIndex;
      if ($(this).find('img').length > 0) {
         var _href = $(this).href;
         $(this).attr('href', 'javascript:;').attr('data-href', _href);
         if (!$(this).attr('data-index')) {
            $(this).attr('data-index', _index);
            $pswpIndex = _index;
         } else {
            $pswpIndex = $(this).data('index');
         }
         $(this).off().on('click tap', function(event) {
            event.preventDefault();
            startPhotoSwipe($pswpIndex);
         });
      }
   });
}

$(document).ready(function() {
   setupPhotoSwipe();
});

{if $rv_tscroller_enabled}
$(document).ajaxComplete(function() {
   setupPhotoSwipe();
});
{/if}
{/footer_script}
{/if}
{footer_script require="jquery"}{strip}
{if !$videojs_enabled && (isset($GThumb) || isset($GDThumb))}
$('img.thumbnail[src*="pwg_representative"]').each(function() {
  $(this).closest('li').append('<i class="fa fa-file-video-o fa-2x video-indicator" aria-hidden="true" style="position: absolute; top: 10px; left: 10px; z-index: 100; color: #fff;"></i>');
});
{else}
$('.col-thumbnail').find('img[src*="pwg_representative"]').each(function() {
  $(this).closest('div').append('<i class="fa fa-file-video-o fa-2x video-indicator" aria-hidden="true" style="position: absolute; top: 15px; left: 30px; z-index: 100; color: #fff;"></i>');
});
{/if}
{/strip}{/footer_script}
        <!-- End of thumbnails -->
{/if}
    </div>
</div>
{if !empty($cats_navbar) || !empty($thumb_navbar)}
<div class="container">
{if !empty($cats_navbar)}
    {include file='navigation_bar.tpl' fragment="content"|@get_extent:'navbar' navbar=$cats_navbar}
{/if}
{if !empty($thumb_navbar) && !$rv_tscroller_enabled}
    {include file='navigation_bar.tpl' fragment="content"|@get_extent:'navbar' navbar=$thumb_navbar}
{/if}
</div>
{/if}

{if !empty($category_search_results)}
<div class="container">
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
<div class="container">
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

<div class="container">
{if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>

{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
<!-- End of index.tpl -->
