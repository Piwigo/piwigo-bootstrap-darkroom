<!-- Start of picture.tpl -->
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/components/jquery-touch-events/src/jquery.mobile-events.min.js' require='jquery' load='footer'}
{/if}

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

{include file='picture_nav.tpl'}

<div id="content-spacer" class="container">
{include file='infos_errors.tpl'}
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
{if $theme_config_extra->bootstrap_theme == 'material'}
{footer_script require='jquery'}
$('#content-spacer').removeClass('container').wrap('<div class="container well"></div>');
$('div[id^="theImage"]').removeClass('container').insertAfter('#content-spacer');
{/footer_script}
{/if}
</div>

<div id="theImage">
    {$ELEMENT_CONTENT}
</div>

{if $theme_config_extra->picture_info == 'sidebar' && get_device() == 'desktop'}
  {include file='picture_info_sidebar.tpl'}
{/if}

<div id="theImageComment" class="container">
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
<div id="theImageShareButtons" class="container">
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

{if !empty($thumbnails) && ($theme_config_extra->slick_enabled || $theme_config_extra->photoswipe)}
{if $theme_config_extra->slick_enabled && sizeOf($thumbnails) > 1}
  {include file="_slick_js.tpl"}
{/if}
{if $theme_config_extra->photoswipe && !$theme_config_extra->slick_infinite}
  {include file="_photoswipe_js.tpl" selector="#thumbnailCarousel"}
{/if}
{if $theme_config_extra->photoswipe && $theme_config_extra->slick_infinite}
  {include file="_photoswipe_js.tpl" selector="#photoSwipeData"}
{/if}
<div id="theImageCarousel" class="container">
 <div class="col-lg-10 col-md-12 col-centered">
  <div id="thumbnailCarousel" class="slick-carousel">
{assign var=idx value=0}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_params_square, $thumbnail.src_image)}
{if !$theme_config_extra->slick_infinite}
{assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
{assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
{assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
{/if}
{if !$derivative->is_cached()}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
{if !$theme_config_extra->slick_infinite}
{if $thumbnail.id eq $current.id && !$theme_config_extra->slick_infinite}
   <div class="text-center thumbnail-active">
{else}
   <div class="text-center">
{/if}
      <a{if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" {if !$theme_config_extra->slick_infinite}data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{else}{if $theme_config_extra->photoswipe_metadata} data-exif-make="{$thumbnail.EXIF.make}" data-exif-model="{$thumbnail.EXIF.model}" data-exif-lens="{$thumbnail.EXIF.lens}" data-exif-iso="{$thumbnail.EXIF.iso}" data-exif-apperture="{$thumbnail.EXIF.apperture}" data-exif-shutter-speed="{$thumbnail.EXIF.shutter_speed}" data-exif-focal-length="{$thumbnail.EXIF.focal_length}" data-date-created="{$thumbnail.DATE_CREATED}"{/if}{/if}{/if}>
{else}
   <div class="text-center{if $thumbnail.id eq $current.id} thumbnail-active{/if}"><a href="{$thumbnail.URL}">
{/if}
      <img {if $derivative->is_cached()}data-lazy="{$derivative->get_url()}"{else}data-lazy="{$ROOT_URL}{$themeconf.icon_dir}/img_small.png" data-src="{$derivative->get_url()}"{/if} alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" class="img-responsive"></a>
   </div>
{assign var=idx value=$idx+1}
{/foreach}
  </div>
 </div>
</div>
{if $theme_config_extra->slick_infinite}
<div id="photoSwipeData">
{assign var=idx value=0}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
{assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
{assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
   <a{if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{else}{if $theme_config_extra->photoswipe_metadata} data-exif-make="{$thumbnail.EXIF.make}" data-exif-model="{$thumbnail.EXIF.model}" data-exif-lens="{$thumbnail.EXIF.lens}" data-exif-iso="{$thumbnail.EXIF.iso}" data-exif-apperture="{$thumbnail.EXIF.apperture}" data-exif-shutter-speed="{$thumbnail.EXIF.shutter_speed}" data-exif-focal-length="{$thumbnail.EXIF.focal_length}" data-date-created="{$thumbnail.DATE_CREATED}"{/if}{/if}></a>
{assign var=idx value=$idx+1}
{/foreach}
</div>
{/if}
{/if}

<div id="theImageInfos" class="container">
 <div id="infopanel" class="col-lg-8 col-md-10 col-sm-12 col-xs-12 col-centered">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified" role="tablist">
{if $theme_config_extra->picture_info == 'tabs' || (get_device() != 'desktop' && $theme_config_extra->picture_info != 'disabled')}
    <li role="presentation" class="active"><a href="#tab_info" aria-controls="tab_info" role="tab" data-toggle="tab">{'Information'|@translate}</a></li>
{if isset($metadata)}
    <li role="presentation"><a href="#tab_metadata" aria-controls="tab_metadata" role="tab" data-toggle="tab">{'EXIF Metadata'|@translate}</a></li>
{/if}
{/if}
{if isset($comment_add) || $COMMENT_COUNT > 0}
    <li role="presentation"{if $theme_config_extra->picture_info == 'disabled' || ($theme_config_extra->picture_info != 'tabs' && get_device() == 'desktop')} class="active"{/if}><a href="#tab_comments" aria-controls="tab_comments" role="tab" data-toggle="tab">{'Comments'|@translate}</a></li>
{/if}
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
{if $theme_config_extra->picture_info === 'tabs' || (get_device() != 'desktop' && $theme_config_extra->picture_info != 'disabled')}
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
{if isset($CR_INFO_NAME) && !empty($CR_INFO_NAME)}
            <div id="Copyright" class="imageInfo">
                <dt>{'Copyright'|@translate}</dt>
                <dd>{if isset($CR_INFO_URL)}<a href="{$CR_INFO_URL}">{$CR_INFO_NAME}</a>{else}{$CR_INFO_NAME}{/if}</dd>
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
            <h4>{$meta.TITLE}</h4>
{foreach from=$meta.lines item=value key=label}
            <dt>{$label}</dt>
            <dd>{$value}</dd>
{/foreach}
{/foreach}
      </dl>
    </div>
{/if}
{/if}
<!-- comments -->
{if isset($comment_add) || $COMMENT_COUNT > 0}
    <div role="tabpanel" class="tab-pane{if $theme_config_extra->picture_info == 'disabled' || ($theme_config_extra->picture_info != 'tabs' && get_device() == 'desktop')} active{/if}" id="tab_comments">
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
            {if $theme_config_extra->picture_info == 'tabs'}<h4>{'Comments'|@translate}</h4>{/if}
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
