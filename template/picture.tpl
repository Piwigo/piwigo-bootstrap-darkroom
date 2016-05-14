<!-- Start of picture.tpl -->
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/js/jquery.mobile-events.min.js' require='jquery'}
{/if}

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

<nav class="navbar navbar-default navbar-secondary" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#picture-nav">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">{$SECTION_TITLE}{$LEVEL_SEPARATOR}<a href>{$current.TITLE}</a> [{$PHOTO}]</div>
{footer_script require='jquery'}{strip}
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
{/strip}{/footer_script}
        </div>
        <div class="navbar-right navbar-collapse collapse" id="picture-nav">
            <ul class="nav navbar-nav">
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
{/if}
{if isset($U_SLIDESHOW_START)}
                <li>
                    <a href="#" title="{'Slideshow'|@translate}" id="startSlideshow" rel="nofollow">
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
                    <a href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
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
        </div>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container">
    {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
{if get_device() != 'desktop' }
{footer_script require="jquery"}{strip}
$('#theImage img').bind('swipeleft swiperight', function (event) {
   if (event.type == 'swipeleft') {
       $('#navigationButtons a#navNextPicture span').click();
   } else if (event.type == 'swiperight') {
       $('#navigationButtons a#navPrevPicture span').click(); 
   } else { 
       return;
   }
});
{/strip}{/footer_script}
{/if}
</div>

<div id="theImage">
    {$ELEMENT_CONTENT}
</div>

<div class="container">
{if isset($COMMENT_IMG)}
  <div class="text-center col-lg-10 -col-md-12 col-centered">
    <section id="important-info">
        <h4 class="imageComment">{$COMMENT_IMG}</h4>
    </section>
  </div>
{/if}
</div>

{include file="http_scheme.tpl"}
{if $theme_config->social_enabled}
<div class="container">
    <section id="share">
{if $theme_config->social_twitter}
        <a href="http://twitter.com/share?text={$current.TITLE}&amp;url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           onclick="window.open(this.href, 'twitter-share', 'width=550,height=235');return false;" title="Share on Twitter">
            <i class="fa fa-twitter"></i>
        </a>
{/if}
{if $theme_config->social_facebook}
        <a href="https://www.facebook.com/sharer/sharer.php?u={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           onclick="window.open(this.href, 'facebook-share','width=580,height=296');return false;" title="Share on Facebook">
            <i class="fa fa-facebook"></i>
        </a>
{/if}
{if $theme_config->social_google_plus}
        <a href="https://plus.google.com/share?url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           onclick="window.open(this.href, 'google-plus-share', 'width=490,height=530');return false;" title="Share on Google+">
            <i class="fa fa-google-plus"></i>
        </a>
{/if}
    </section>
</div>
{/if}

{if !empty($thumbnails)}
{combine_css path="themes/bootstrap_darkroom/slick/slick.css"}
{combine_css path="themes/bootstrap_darkroom/slick/slick-theme.css"}
{combine_script id="slick.carousel" require="jquery" path="themes/bootstrap_darkroom/slick/slick.min.js"}
{combine_css path="themes/bootstrap_darkroom/photoswipe/photoswipe.css"}
{combine_css path="themes/bootstrap_darkroom/photoswipe/default-skin/default-skin.css"}
{combine_script id="photoswipe" require="jquery" path="themes/bootstrap_darkroom/photoswipe/photoswipe.min.js"}
{combine_script id="photoswipe.ui" require="photoswipe" path="themes/bootstrap_darkroom/photoswipe/photoswipe-ui-default.min.js"}
{footer_script require='jquery'}{strip}
$(document).ready(function(){
  $('#thumbnailCarousel').slick({
    infinite: {if $theme_config_extra->slick_infinite}true{else}false{/if},
    centerMode: {if $theme_config_extra->slick_centered}true{else}false{/if},
    slidesToShow: 7,
    slidesToScroll: 6,
    lazyLoad: '{if $theme_config_extra->slick_lazyload == "progressive"}progressive{else}ondemand{/if}',
    responsive: [
     {
      breakpoint: 1200,
      settings: {
       slidesToShow: 5,
       slidesToScroll: 4
      }
     },
     {
      breakpoint: 1024,
      settings: {
       slidesToShow: 5,
       slidesToScroll: 4
      }
     },
     {
      breakpoint: 600,
      settings: {
       slidesToShow: 3,
       slidesToScroll: 3
      }
     },
     {
      breakpoint: 420,
      settings: {
       slidesToShow: 2,
       slidesToScroll: 2
      }
    }]
  });
  var currentThumbnailIndex = $('#thumbnailCarousel').find('[data-thumbnail-active="1"]').data('slick-index');
  $('#thumbnailCarousel').slick('goTo', currentThumbnailIndex, true);

  $('#thumbnailCarousel').show();
});


function startPhotoSwipe() {
    $('#thumbnailCarousel').each(function() {
         var $pic     = $(this),
             getItems = function() {
                 var items = [];
                 $pic.find('a').each(function() {
                     var $src_xlarge    = $(this).data('src-xlarge'),
                         $size_xlarge   = $(this).data('size-xlarge').split(' x '),
                             $width_xlarge  = $size_xlarge[0],
                         $height_xlarge = $size_xlarge[1],
                         $src_large     = $(this).data('src-large'),
                         $size_large    = $(this).data('size-large').split(' x '),
                         $width_large   = $size_large[0],
                         $height_large  = $size_large[1],
                         $src_medium    = $(this).data('src-medium'),
                         $size_medium   = $(this).data('size-medium').split(' x '),
                         $width_medium  = $size_medium[0],
                         $height_medium = $size_medium[1],
                         $href          = $(this).attr('href'),
                         $title         = '<div class="text-center"><a href="' + $href + '"><i class="glyphicon glyphicon-info-sign"></i> ' + $(this).data('title') + '</div>';
                     var item = {
                         mediumImage: {
                             src   : $src_medium,
                             w     : $width_medium,
                             h     : $height_medium,
                             title : $title
                         },
                         largeImage: {
                             src   : $src_large,
                             w     : $width_large,
                             h     : $height_large,
                             title : $title
                         },
                         xlargeImage: {
                             src   : $src_xlarge,
                             w     : $width_xlarge,
                             h     : $height_xlarge,
                             title : $title
                         }
                     };
    
                     items.push(item);
    
                 });
                 return items;
             };
        var items = getItems();

        var $pswp = $('.pswp')[0];
        var $index = $('#thumbnailCarousel').find('[data-thumbnail-active="1"]').data('slick-index');
        var options = {
            index: $index,
            bgOpacity: 0.95,
            showHideOpacity: true,
            closeOnScroll: false,
            closeOnVerticalDrag: false
        };
        var photoSwipe = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
        var realViewportWidth,
            useLargeImages = false,
            firstResize = true,
            imageSrcWillChange;

        photoSwipe.listen('beforeResize', function() {
            realViewportWidth = photoSwipe.viewportSize.x * window.devicePixelRatio;
            if(useLargeImages && realViewportWidth < 1335) {
                useLargeImages = false;
                imageSrcWillChange = true;
            } else if(!useLargeImages && realViewportWidth >= 1335) {
                useLargeImages = true;
                imageSrcWillChange = true;
            }

            if(imageSrcWillChange && !firstResize) {
                photoSwipe.invalidateCurrItems();
            }

            if(firstResize) {
                firstResize = false;
            }

            imageSrcWillChange = false;
        });

        photoSwipe.listen('gettingData', function(index, item) {
            if( useLargeImages ) {
                item.src = item.xlargeImage.src;
                item.w = item.xlargeImage.w;
                item.h = item.xlargeImage.h;
                item.title = item.xlargeImage.title;
            } else {
                item.src = item.largeImage.src;
                item.w = item.largeImage.w;
                item.h = item.largeImage.h;
                item.title = item.largeImage.title;
            }
        });

        photoSwipe.init();

        var autoplayId = null;
        $('.pswp__button--autoplay').on('click touchstart', function(event) {
            event.preventDefault();
            if (autoplayId) {
                clearInterval(autoplayId);
                autoplayId = null;
                $('.pswp__button--autoplay').removeClass('stop');
            } else {
                autoplayId = setInterval(function() { photoSwipe.next(); }, 3000);
                $('.pswp__button--autoplay').addClass('stop');
            }
        });
        photoSwipe.listen('destroy', function() {
            if (autoplayId) {
                clearInterval(autoplayId);
                autoplayId = null;
                $('.pswp__button--autoplay').removeClass('stop');
            }
            $('.pswp__button--autoplay').off('click touchstart');
        });
    });
};

$('#startPhotoSwipe').on('click', 'span', startPhotoSwipe);
{if get_device() != 'desktop'}
$('#theImage').on('doubletap', startPhotoSwipe);
{/if}
{if isset($U_SLIDESHOW_START)}
$('#startSlideshow').on('click touchstart', function() {
  console.log('Starting slideshow..');
  startPhotoSwipe();
  $('.pswp__button--autoplay')[0].click();
});
{/if}
if (window.location.hash === "#start-slideshow") {
    console.log('Received #start-slideshow url hash. Starting slideshow...');
    startPhotoSwipe();
    $('.pswp__button--autoplay')[0].click();
}
{/strip}{/footer_script}
<div class="container">
 <div class="col-lg-10 col-md-12 col-centered">
  <div id="thumbnailCarousel" class="slick-carousel">
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_params_thumb, $thumbnail.src_image)}
{assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
{assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
{assign var=derivative_xlarge value=$pwg->derivative($derivative_params_xlarge, $thumbnail.src_image)}
{if !$derivative->is_cached()}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
        {if $thumbnail.id eq $current.id}<div class="text-center thumbnail-active" data-thumbnail-active="1">{else}<div class="text-center">{/if}<a href="{$thumbnail.URL}" data-title="{$thumbnail.TN_TITLE}" data-src-xlarge="{$derivative_xlarge->get_url()}" data-size-xlarge="{$derivative_xlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"><img {if $derivative->is_cached()}data-lazy="{$derivative->get_url()}"{else}data-lazy="{$ROOT_URL}{$themeconf.icon_dir}/img_small.png" data-src="{$derivative->get_url()}"{/if} alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" class="img-responsive"></a></div>
{/foreach}
  </div>
 </div>
</div>
{/if}

<div class="container">
 <div id="infopanel" class="col-lg-8 col-md-10 col-sm-12 col-xs-12 col-centered">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified" role="tablist">
    <li role="presentation" class="active"><a href="#tab_info" aria-controls="tab_info" role="tab" data-toggle="tab">{'Information'|@translate}</a></li>
{if isset($metadata)}
    <li role="presentation"><a href="#tab_metadata" aria-controls="tab_metadata" role="tab" data-toggle="tab">{'EXIF Metadata'|@translate}</a></li>
{/if}
{if isset($comment_add) || $COMMENT_COUNT > 0}
    <li role="presentation"><a href="#tab_comments" aria-controls="tab_comments" role="tab" data-toggle="tab">{'Comments'|@translate}</a></li>
{/if}
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
<!-- information -->
    <div role="tabpanel" class="tab-pane active" id="tab_info">
      <div id="info-content" class="info">
        <dl class="dl-horizontal">
            <h4>{'Information'|@translate}</h4>
{if $display_info.author and isset($INFO_AUTHOR)}
            <div id="Author" class="imageInfo">
                <dt>{'Author'|@translate}</dt>
                <dd>{$INFO_AUTHOR}</dd>
            </div>
{/if}
{if $display_info.rating_score and isset($rate_summary)}
        <div id="Average" class="imageInfo">
                <dt>{'Rating score'|@translate}</dt>
                <dd>
                {if $rate_summary.count}
                        <span id="ratingScore">{$rate_summary.score}</span> <span id="ratingCount">({$rate_summary.count|@translate_dec:'%d rate':'%d rates'})</span>
                {else}
                        <span id="ratingScore">{'no rate'|@translate}</span> <span id="ratingCount"></span>
                {/if}
                </dd>
        </div>
{/if}

{if isset($rating)}
        <div id="rating" class="imageInfo">
                <dt id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</dt>
                <dd>
                        <form action="{$rating.F_ACTION}" method="post" id="rateForm" style="margin:0;">
                        <div>
                        {foreach from=$rating.marks item=mark name=rate_loop}
                        {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
                                <span class="rateButtonStarFull" data-value="{$mark}"></span>
                        {else}
                                <span class="rateButtonStarEmpty" data-value="{$mark}"></span>
                        {/if}
                        {/foreach}
                        {strip}{combine_script id='core.scripts' path='themes/default/js/scripts.js' load='async'}
                        {combine_script id='rating' require='core.scripts' path='themes/bootstrapdefault/js/rating.js' load='async'}
                        {footer_script require='jquery'}
                                var _pwgRatingAutoQueue = _pwgRatingAutoQueue||[];
                                _pwgRatingAutoQueue.push( {ldelim}rootUrl: '{$ROOT_URL}', image_id: {$current.id},
                                        onSuccess : function(rating) {ldelim}
                                                var e = document.getElementById("updateRate");
                                                if (e) e.innerHTML = "{'Update your rating'|@translate|@escape:'javascript'}";
                                                e = document.getElementById("ratingScore");
                                                if (e) e.innerHTML = rating.score;
                                                e = document.getElementById("ratingCount");
                                                if (e) {ldelim}
                                                        if (rating.count == 1) {ldelim}
                                                                e.innerHTML = "({'%d rate'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
                                                        {rdelim} else {ldelim}
                                                                e.innerHTML = "({'%d rates'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
                                                        {rdelim}
                                                {rdelim}
                                                $('#averageRate').find('span').each(function() {ldelim}
                                                        $(this).addClass(rating.average > $(this).data('value') - 0.5 ? 'rateButtonStarFull' : 'rateButtonStarEmpty');
                                                        $(this).removeClass(rating.average > $(this).data('value') - 0.5 ? 'rateButtonStarEmpty' : 'rateButtonStarFull');
                                                {rdelim});
                                        {rdelim}
                                {rdelim});
                        {/footer_script}
                        {/strip}
                        </div>
                        </form>
                </dd>
        </div>
{/if}
{if $display_info.created_on and isset($INFO_CREATION_DATE)}
            <div id="datecreate" class="imageInfo">
                <dt>{'Created on'|@translate}</dt>
                <dd>{$INFO_CREATION_DATE}</dd>
            </div>
{/if}
{if $display_info.posted_on}
            <div id="datepost" class="imageInfo">
                <dt>{'Posted on'|@translate}</dt>
                <dd>{$INFO_POSTED_DATE}</dd>
            </div>
{/if}
{if $display_info.visits}
            <div id="visits" class="imageInfo">
                <dt>{'Visits'|@translate}</dt>
                <dd>{$INFO_VISITS}</dd>
            </div>
{/if}
{if $display_info.dimensions and isset($INFO_DIMENSIONS)}
            <div id="Dimensions" class="imageInfo">
                <dt>{'Dimensions'|@translate}</dt>
                <dd>{$INFO_DIMENSIONS}</dd>
            </div>
{/if}
{if $display_info.file}
            <div id="File" class="imageInfo">
                <dt>{'File'|@translate}</dt>
                <dd>{$INFO_FILE}</dd>
            </div>
{/if}
{if $display_info.filesize and isset($INFO_FILESIZE)}
            <div id="Filesize" class="imageInfo">
                <dt>{'Filesize'|@translate}</dt>
                <dd>{$INFO_FILESIZE}</dd>
            </div>
{/if}
{if $display_info.tags and isset($related_tags)}
            <div id="Tags" class="imageInfo">
                <dt>{'Tags'|@translate}</dt>
                <dd>
                    {foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}<a href="{$tag.URL}">{$tag.name}</a>{/foreach}
                </dd>
            </div>
{/if}
{if $display_info.categories and isset($related_categories)}
            <div id="Categories" class="imageInfo">
                <dt>{'Albums'|@translate}</dt>
                <dd>
{foreach from=$related_categories item=cat name=cat_loop}
                {if !$smarty.foreach.cat_loop.first}<br />{/if}{$cat}
{/foreach}
                </dd>
            </div>
{/if}
{if $display_info.privacy_level and isset($available_permission_levels)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
{footer_script require='jquery'}{strip}
    function setPrivacyLevel(id, level, label) {
    (new PwgWS('{$ROOT_URL}')).callService(
        "pwg.images.setPrivacyLevel", { image_id:id, level:level},
        {
            method: "POST",
            onFailure: function(num, text) { alert(num + " " + text); },
            onSuccess: function(result) {
                jQuery('#dropdownPermissions').html(label + ' <span class="caret"></span>');
                jQuery('.permission-li').removeClass('active');
                jQuery('#permission-' + level).addClass('active');
            }
        }
    );
    }
    (SwitchBox=window.SwitchBox||[]).push("#privacyLevelLink", "#privacyLevelBox");
{/strip}{/footer_script}
            <div id="Privacy" class="imageInfo">
                <dt>{'Who can see this photo?'|@translate}</dt>
                <dd>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle ellipsis" type="button" id="dropdownPermissions" data-toggle="dropdown" aria-expanded="true">
                            {$available_permission_levels[$current.level]}
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownPermissions">
{foreach from=$available_permission_levels item=label key=level}
                            <li id="permission-{$level}" role="presentation" class="permission-li {if $current.level == $level} active{/if}"><a role="menuitem" tabindex="-1" href="javascript:setPrivacyLevel({$current.id},{$level},'{$label}')">{$label}</a></li>
{/foreach}
                        </ul>
                    </div>
                </dd>
            </div>
{/if}
        </dl>
      </div>
    </div>
<!-- metadata -->
{if isset($metadata)}
    <div role="tabpanel" class="tab-pane" id="tab_metadata">
      <dl class="dl-horizontal">
{foreach from=$metadata item=meta}
            <br />
            <h4>{$meta.TITLE}</h4>
{foreach from=$meta.lines item=value key=label}
            <dt>{$label}</dt>
            <dd>{$value}</dd>
{/foreach}
{/foreach}
      </dl>
    </div>
{/if}
<!-- comments -->
{if isset($comment_add) || $COMMENT_COUNT > 0}
    <div role="tabpanel" class="tab-pane" id="tab_comments">

<a name="comments"></a>
{$shortname = $theme_config->comments_disqus_shortname}
{if $theme_config->comments_type == 'disqus' and !empty($shortname)}
                <div id="disqus_thread"></div>
{footer_script}{strip}
var disqus_shortname = '{/strip}{$shortname}{strip}';

(function() {
var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
})();
{/strip}
{/footer_script}
{else}
            <h3>{'Comments'|@translate}</h3>
            <div class="tabbable">
                <ul class="nav nav-pills">
{if $COMMENT_COUNT > 0}
                    <li class="active"><a href="#viewcomments" data-toggle="tab">{$COMMENT_COUNT|@translate_dec:'%d comment':'%d comments'}</a></li>
{/if}
{if isset($comment_add)}
                    <li{if $COMMENT_COUNT == 0} class="active"{/if}><a href="#addcomment" data-toggle="tab">{'Add a comment'|@translate}</a></li>
{/if}
                </ul>
                <div class="tab-content">
{if $COMMENT_COUNT > 0}
                    <div id="viewcomments" class="tab-pane active">
{include file='comment_list.tpl'}
                    </div>
{/if}
{if isset($comment_add)}
                    <div id="addcomment" class="tab-pane{if $COMMENT_COUNT == 0} active{/if}">
                        <form method="post" action="{$comment_add.F_ACTION}">
{if $comment_add.SHOW_AUTHOR}
                            <div class="form-group">
                                <label for="author">{'Author'|@translate}{if $comment_add.AUTHOR_MANDATORY} ({'mandatory'|@translate}){/if} :</label>
                                <input class="form-control" type="text" name="author" id="author" value="{$comment_add.AUTHOR}">
                            </div>
{/if}
{if $comment_add.SHOW_EMAIL}
                            <div class="form-group">
                                <label for="email">{'Email address'|@translate}{if $comment_add.EMAIL_MANDATORY} ({'mandatory'|@translate}){/if} :</label>
                                <input class="form-control" type="text" name="email" id="email" value="{$comment_add.EMAIL}">
                            </div>
{/if}
{if $comment_add.SHOW_WEBSITE}
                            <div class="form-group">
                                <label for="website_url">{'Website'|@translate} :</label>
                                <input class="form-control" type="text" name="website_url" id="website_url" value="{$comment_add.WEBSITE_URL}">
                            </div>
{/if}
                            <div class="form-group">
                                <label for="contentid">{'Comment'|@translate} ({'mandatory'|@translate}) :</label>
                                <textarea class="form-control" name="content" id="contentid" rows="5" cols="50">{$comment_add.CONTENT}</textarea>
                            </div>
                            <input type="hidden" name="key" value="{$comment_add.KEY}">
                            <button type="submit" class="btn btn-default">{'Submit'|@translate}</button>
                        </form>
                    </div>
{/if}
                </div>
            </div>
{/if}
    </div>
{/if}
  </div>
 </div>
</div>

{if !empty($navbar) }
<div class="container">
{include file='navigation_bar.tpl' fragment='comments'|@get_extent:'navbar'}
</div>
{/if}

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}

<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
     <div class="pswp__bg"></div>
     <div class="pswp__scroll-wrap">
           <div class="pswp__container">
             <div class="pswp__item"></div>
             <div class="pswp__item"></div>
             <div class="pswp__item"></div>
           </div>
           <div class="pswp__ui pswp__ui--hidden">
             <div class="pswp__top-bar">
                 <div class="pswp__counter"></div>
                 <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                 <!-- <button class="pswp__button pswp__button--share" title="Share"></button> -->
                 <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                 <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                 <button class="pswp__button pswp__button--autoplay" title="AutoPlay"></button>
                 <div class="pswp__preloader">
                     <div class="pswp__preloader__icn">
                       <div class="pswp__preloader__cut">
                         <div class="pswp__preloader__donut"></div>
                       </div>
                     </div>
                 </div>
             </div>
             <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                 <div class="pswp__share-tooltip"></div>
             </div>
             <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
             <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
             <div class="pswp__caption">
                 <div class="pswp__caption__center"></div>
             </div>
         </div>
     </div>
</div>
