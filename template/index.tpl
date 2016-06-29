<!-- Start of index.tpl -->
{combine_script id='core.switchbox' require='jquery' path='themes/default/js/switchbox.js'}
{combine_script id='cookie' require='jquery' path="themes/bootstrapdefault/js/jquery.cookie.js"}
{combine_script id='equalheights' require='jquery' path="themes/bootstrapdefault/js/jquery.equalheights.js"}
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/components/jquery-touch-events/src/jquery.mobile-events.min.js' require='jquery'}
{/if}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

<div id="secondary-navmenu" class="navmenu navmenu-default navmenu-fixed-right offcanvas" role="navigation">
    <ul class="nav navmenu-nav"></ul>
</div>

{footer_script require='jquery'}{literal}
if ($('.jumbotron').length > 0) {
    var $affix_height = $('.navbar-main').height() + $('.jumbotron').outerHeight();
    $('.navbar-secondary').affix({ offset: {top: $affix_height } });
    $('.navmenu').css('top', $affix_height);
} else {
    $('.navbar-secondary').affix({ offset: {top: $('.navbar-main').height()} });
    $('.navmenu').css('top', $('.navbar-main').height());
}
{/literal}
$('.navmenu').on('show.bs.offcanvas', function() {
    if ($('.navbar-secondary ul.navmenu-nav').contents().length === 0) {
        $($('.navbar-secondary ul.navbar-nav').contents()).appendTo('ul.navmenu-nav');
        $('ul.navmenu-nav').find('.dropdown-menu').addClass('dropdown-menu-right');
        $('ul.navmenu-nav').find('.dropdown-toggle').attr('aria-haspopup', 'true');
{if $theme_config_extra->bootstrap_theme == 'bootswatch'}
        $('.navmenu').css('background-color', $('.navbar-default').css('background-color'));
{/if}
    }
});
$('.navmenu').on('hidden.bs.offcanvas', function() {
    if ($('ul.navmenu-nav').contents().length > 0) {
        $('ul.navmenu-nav').find('.dropdown-menu-right').removeClass('dropdown-menu-right');
        $('ul.navmenu-nav').find('.dropdown-toggle').removeAttr('aria-haspopup');
        $($('ul.navmenu-nav').contents()).appendTo('.navbar-secondary ul.navbar-nav');
    }
});
$('.navbar-secondary').on('affix.bs.affix', function() {
    $('.navmenu').css('top', '');
});
$('.navbar-secondary').on('affix-top.bs.affix', function() {
    if ($('.navbar-main')) {
       $('.navmenu').css('top', $('.navbar-main').height());
    }
});
{/footer_script}
<div class="nav-wrapper">
<nav class="navbar navbar-default navbar-secondary" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#secondary-navmenu">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">
{if isset($chronology.TITLE)}
                <a href="{$U_HOME}" title="{'Home'|@translate}"><span class="glyphicon glyphicon-home"></span><span class="glyphicon-text"> {'Home'|@translate}</span></a>{$LEVEL_SEPARATOR}{$chronology.TITLE}
{else}
                {$TITLE}
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
      $('.navbar-secondary .navbar-brand').html('<a href="{$U_HOME}" title="{'Home'|@translate}"><span class="glyphicon glyphicon-home"></span><span class="glyphicon-text">{'Home'|@translate}</span></a>' + $html);
   } else {
      $('.navbar-secondary .navbar-brand').html($html);
   }
 }
}
{if $theme_config_extra->bootstrap_theme == 'bootswatch'}
   $('.navbar-default .navbar-brand a').css('color', $('.navbar-default .navbar-brand').css('color'));
{/if}
});
{/strip}{/footer_script}
{/if}
            </div>
        </div>
        <div class="navbar-right navbar-collapse collapse" id="secondary-navbar">
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
                    <a href="{if $theme_config_extra->photoswipe}javascript:;{else}{$U_SLIDESHOW}{/if}" id="startSlideshow" title="{'slideshow'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-play"></span><span class="glyphicon-text">{'slideshow'|@translate}</span>
                    </a>
                </li>
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
{if isset($U_MODE_POSTED) || isset($U_MODE_CREATED)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="fa fa-calendar"></span><span class="glyphicon-text">{'Calendar'|@translate}</span>
                    </a>
                    <ul class="dropdown-menu">
{if isset($U_MODE_POSTED)}
                        <li>
                            <a href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" rel="nofollow">
                                <span class="fa fa-share-alt"></span> {'display a calendar by posted date'|@translate}
                            </a>
                        </li>
{/if}
{if isset($U_MODE_CREATED)}
                        <li>
                            <a href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" rel="nofollow">
                                <span class="fa fa-camera-retro"></span> {'display a calendar by creation date'|@translate}
                            </a>
                        </li>
{/if}
                    </ul>
                </li>
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
{if ((!empty($CATEGORIES) && !isset($GDThumb)) || (!empty($THUMBNAILS) && !isset($GThumb) && !isset($GDThumb))) && ($theme_config_extra->category_wells == 'never' || ($theme_config_extra->category_wells == 'mobile_only' && get_device() == 'desktop'))}
                <li id="btn-grid"{if $smarty.cookies.view != 'list'} class="active"{/if}><a href="javascript:;"><span class="glyphicon glyphicon-th"></span></a></li>
                <li id="btn-list"{if $smarty.cookies.view == 'list'} class="active"{/if}><a href="javascript:;"><span class="glyphicon glyphicon-th-list"></span></a></li>
{/if}
            </ul>
        </div>
    </div>
</nav>
</div>

{include file='infos_errors.tpl'}

<a name="content"></a>
<div id="content-spacer" class="container">
{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

{if isset($chronology_views)}
<div id="calendar-select" class="btn-group">
    <button id="calendar-view" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        {foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="calendar-view">
        {foreach from=$chronology_views item=view name=loop}
            <li {if $view.SELECTED} class="active"{/if}><a href="{$view.VALUE}">{$view.CONTENT}</a><li>
        {/foreach}
    </ul>
</div>
{/if}

{if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
{/if}

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
{footer_script}{strip}{literal}
$(document).ready(function() {
  $('#content img').load(function(){
    $('#content .col-inner').equalHeights()
  })
});
var resizeTimer;
$(window).on('resize', function() {
  clearTimeout(resizeTimer);
  resizeTimer = setTimeout(function() {
    if ($(window).innerWidth() < 768) {
      $('.col-inner').removeAttr('style');
    } else {
      $('.col-inner').equalHeights();
    }
  }, 250);
});
{/literal}{/strip}{/footer_script}
    <!-- End of categories -->
{/if}

{if !empty($THUMBNAILS)}
        <!-- Start of thumbnails -->
        <div id="thumbnails">{$THUMBNAILS}</div>
{footer_script}{literal}$(document).ready(function(){$('#content img').load(function(){$('#content .col-inner').equalHeights()})});{/literal}{/footer_script}
{if $theme_config_extra->photoswipe}
{define_derivative name='derivative_params_medium' type=IMG_MEDIUM}
{define_derivative name='derivative_params_large' type=IMG_LARGE}
{define_derivative name='derivative_params_xxlarge' type=IMG_XXLARGE}
        <div id="photoSwipeData">
{assign var=idx value=0}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
{assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
{assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
            <a href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{else}{if $theme_config_extra->photoswipe_metadata} data-exif-make="{$thumbnail.EXIF.make}" data-exif-model="{$thumbnail.EXIF.model}" data-exif-lens="{$thumbnail.EXIF.lens}" data-exif-iso="{$thumbnail.EXIF.iso}" data-exif-apperture="{$thumbnail.EXIF.apperture}" data-exif-shutter-speed="{$thumbnail.EXIF.shutter_speed}" data-exif-focal-length="{$thumbnail.EXIF.focal_length}" data-date-created="{$thumbnail.DATE_CREATED}"{/if}{/if}></a>
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

{if $theme_config_extra->thumbnail_linkto == "photoswipe" || ($theme_config_extra->thumbnail_linkto == "photoswipe_mobile_only" && get_device() != 'desktop')}
$(document).ready(function() {
   setupPhotoSwipe();
});

{if $rv_tscroller_enabled}
$(document).ajaxComplete(function() {
   setupPhotoSwipe();
});
{/if}
{/if}
{/strip}{/footer_script}
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
