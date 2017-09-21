<!-- Start of picture.tpl -->
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/components/jquery-touch-events/src/jquery.mobile-events.min.js' require='jquery' load='footer'}
{/if}

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

{$PICTURE_NAV}

<div class="container{if $theme_config->fluid_width}-fluid{/if}">
{include file='infos_errors.tpl'}

  <div class="row justify-content-center">
    {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
  </div>
{if get_device() != 'desktop' }
{footer_script require="jquery"}{strip}
$('#theImage img').bind('swipeleft swiperight', function (event) {
   if (event.type == 'swipeleft') {
       $('#navigationButtons a#navNextPicture i').click();
   } else if (event.type == 'swiperight') {
       $('#navigationButtons a#navPrevPicture i').click(); 
   } else { 
       return;
   }
});
{/strip}{/footer_script}
{/if}

  <div id="theImage" class="row justify-content-center mb-3">
    {$ELEMENT_CONTENT}
  </div>

{if $theme_config->picture_info == 'sidebar' && get_device() == 'desktop'}
  {include file='picture_info_sidebar.tpl'}
{/if}

  <div id="theImageComment" class="row justify-content-center mb-3">
{if isset($COMMENT_IMG)}
    <div class="text-center col-lg-10 -col-md-12 mx-auto">
      <section id="important-info">
        <h4 class="imageComment">{$COMMENT_IMG}</h4>
      </section>
    </div>
{/if}
  </div>

{include file="http_scheme.tpl"}
{if $theme_config->social_enabled}
  <div id="theImageShareButtons" class="row justify-content-center">
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
{if $theme_config->social_pinterest}
        <a href="http://www.pinterest.com/pin/create/button/?url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}&media={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}/../{$current.selected_derivative->get_url()}"
           onclick="window.open(this.href, 'pinterest-share', 'width=490,height=530');return false;" title="Pin it!">
            <i class="fa fa-pinterest"></i>
        </a>
{/if}
    </section>
  </div>
{/if}

{if !empty($thumbnails) && ($theme_config->slick_enabled || $theme_config->photoswipe)}
  {if $theme_config->slick_enabled && sizeOf($thumbnails) > 1}
    {include file="_slick_js.tpl"}
  {/if}
  {if $theme_config->photoswipe && !$theme_config->slick_infinite}
    {include file="_photoswipe_js.tpl" selector="#thumbnailCarousel"}
  {/if}
  {if $theme_config->photoswipe && $theme_config->slick_infinite}
    {include file="_photoswipe_js.tpl" selector="#photoSwipeData"}
  {/if}
  <div id="theImageCarousel" class="row mx-0">
    <div class="col-lg-10 col-md-12 mx-auto">
      <div id="thumbnailCarousel" class="slick-carousel">
  {assign var=idx value=0}
  {foreach from=$thumbnails item=thumbnail}
  {assign var=derivative value=$pwg->derivative($derivative_params_square, $thumbnail.src_image)}
  {if !$theme_config->slick_infinite}
    {assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
    {assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
    {assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
  {/if}
  {if !$derivative->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
  {/if}
  {if !$theme_config->slick_infinite}
        <div class="text-center{if $thumbnail.id eq $current.id && !$theme_config->slick_infinite} thumbnail-active{/if}">
          <a{if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" {if !$theme_config->slick_infinite}data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{else}{if $theme_config->photoswipe_metadata} data-exif-make="{$thumbnail.EXIF.make}" data-exif-model="{$thumbnail.EXIF.model}" data-exif-lens="{$thumbnail.EXIF.lens}" data-exif-iso="{$thumbnail.EXIF.iso}" data-exif-apperture="{$thumbnail.EXIF.apperture}" data-exif-shutter-speed="{$thumbnail.EXIF.shutter_speed}" data-exif-focal-length="{$thumbnail.EXIF.focal_length}" data-date-created="{$thumbnail.DATE_CREATED}"{/if}{/if}{/if}>
  {else}
        <div class="text-center{if $thumbnail.id eq $current.id} thumbnail-active{/if}"><a href="{$thumbnail.URL}">
  {/if}
          <img {if $derivative->is_cached()}data-lazy="{$derivative->get_url()}"{else}data-lazy="{$ROOT_URL}{$themeconf.icon_dir}/img_small.png" data-src="{$derivative->get_url()}"{/if} alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}" class="img-fluid"></a>
        </div>
  {assign var=idx value=$idx+1}
  {/foreach}
      </div>
    </div>
  </div>

  {if $theme_config->slick_infinite}
  <div id="photoSwipeData">
    {assign var=idx value=0}
    {foreach from=$thumbnails item=thumbnail}
    {assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
    {assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
    {assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
    <a{if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{else}{if $theme_config->photoswipe_metadata} data-exif-make="{$thumbnail.EXIF.make}" data-exif-model="{$thumbnail.EXIF.model}" data-exif-lens="{$thumbnail.EXIF.lens}" data-exif-iso="{$thumbnail.EXIF.iso}" data-exif-apperture="{$thumbnail.EXIF.apperture}" data-exif-shutter-speed="{$thumbnail.EXIF.shutter_speed}" data-exif-focal-length="{$thumbnail.EXIF.focal_length}" data-date-created="{$thumbnail.DATE_CREATED}"{/if}{/if}></a>
{assign var=idx value=$idx+1}
    {/foreach}
  </div>
  {/if}
{/if}

  <div id="theImageInfos" class="row">
{if $theme_config->picture_info != 'disabled'}
    <div id="infopanel" class="col-lg-6 col-12">
      <!-- Picture infos -->
      <div class="card">
        <div class="card-body mb-2">
          <h4 class="card-title">{'Information'|@translate}</h4>
          <div id="info-content" class="d-flex flex-column">
{if $display_info.author and isset($INFO_AUTHOR)}
            <div id="Author" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Author'|@translate}</dt>
                <dd class="col-sm-8">{$INFO_AUTHOR}</dd>
              </dl>
            </div>
{/if}
{if isset($CR_INFO_NAME) && !empty($CR_INFO_NAME)}
            <div id="Copyright" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Copyright'|@translate}</dt>
                <dd class="col-sm-8">{if isset($CR_INFO_URL)}<a href="{$CR_INFO_URL}">{$CR_INFO_NAME}</a>{else}{$CR_INFO_NAME}{/if}</dd>
              </dl>
            </div>
{/if}
{if $display_info.rating_score and isset($rate_summary)}
            <div id="Average" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Rating score'|@translate}</dt>
                <dd class="col-sm-8">
                  {if $rate_summary.count}
                    <span id="ratingScore">{$rate_summary.score}</span> <span id="ratingCount">({$rate_summary.count|@translate_dec:'%d rate':'%d rates'})</span>
                  {else}
                    <span id="ratingScore">{'no rate'|@translate}</span> <span id="ratingCount"></span>
                  {/if}
                </dd>
              </dl>
            </div>
{/if}

{if isset($rating)}
            <div id="rating" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4" id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</dt>
                <dd class="col-sm-8">
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
                      {combine_script id='rating' require='core.scripts' path='themes/bootstrap_darkroom/js/rating.js' load='async'}
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
              </dl>
            </div>
{/if}
{if $display_info.created_on and isset($INFO_CREATION_DATE)}
            <div id="datecreate" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Created on'|@translate}</dt>
                <dd class="col-sm-8">{$INFO_CREATION_DATE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.posted_on}
            <div id="datepost" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Posted on'|@translate}</dt>
                <dd class="col-sm-8">{$INFO_POSTED_DATE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.visits}
            <div id="visits" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Visits'|@translate}</dt>
                <dd class="col-sm-8">{$INFO_VISITS}</dd>
              </dl>
            </div>
{/if}
{if $display_info.dimensions and isset($INFO_DIMENSIONS)}
            <div id="Dimensions" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-3">{'Dimensions'|@translate}</dt>
                <dd class="col-sm-9">{$INFO_DIMENSIONS}</dd>
              </dl>
            </div>
{/if}
{if $display_info.file}
            <div id="File" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-3">{'File'|@translate}</dt>
                <dd class="col-sm-8">{$INFO_FILE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.filesize and isset($INFO_FILESIZE)}
            <div id="Filesize" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Filesize'|@translate}</dt>
                <dd class="col-sm-8">{$INFO_FILESIZE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.tags and isset($related_tags)}
            <div id="Tags" class="imageInfo">
              <dl class="row mb-0"> 
                <dt class="col-sm-4">{'Tags'|@translate}</dt>
                <dd class="col-sm-8">
                  {foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}<a href="{$tag.URL}">{$tag.name}</a>{/foreach}
                </dd>
              </dl>
            </div>
{/if}
{if $display_info.categories and isset($related_categories)}
            <div id="Categories" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Albums'|@translate}</dt>
                <dd class="col-sm-8">
                {foreach from=$related_categories item=cat name=cat_loop}
                {if !$smarty.foreach.cat_loop.first}<br />{/if}{$cat}
                {/foreach}
                </dd>
              </dl>
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
{/strip}{/footer_script}
            <div id="Privacy" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-4">{'Who can see this photo?'|@translate}</dt>
                <dd class="col-sm-8">
                  <div class="dropdown">
                    <button class="btn btn-secondary btn-raised dropdown-toggle ellipsis" type="button" id="dropdownPermissions" data-toggle="dropdown" aria-expanded="true">
                      {$available_permission_levels[$current.level]}
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownPermissions">
{foreach from=$available_permission_levels item=label key=level}
                      <li id="permission-{$level}" role="presentation" class="dropdown-item permission-li {if $current.level == $level} active{/if}"><a class="dropdown-link" tabindex="-1" href="javascript:setPrivacyLevel({$current.id},{$level},'{$label}')">{$label}</a></li>
{/foreach}
                    </ul>
                  </div>
                </dd>
              </dl>
            </div>
{/if}
          </div>
        </div>
      </div>
    </div>
{/if}

    <!-- metadata -->
    <div id="metadata" class="col-lg-6 col-12">
{if isset($metadata)}
      <div class="card">
        <div class="card-body mb-2">
          <h4 class="card-title">{'EXIF Metadata'|@translate}</h4>
          <div id="metadata" class="d-flex flex-column">
{foreach from=$metadata item=meta}
{foreach from=$meta.lines item=value key=label}
            <div>
              <dl class="row mb-0">
                <dt class="col-sm-4">{$label}</dt>
                <dd class="col-sm-8">{$value}</dd>
              </dl>
            </div>
{/foreach}
{/foreach}
          </div>
        </div>
      </div>
{/if}
    </div>
   <!-- comments -->
{if isset($comment_add) || $COMMENT_COUNT > 0}
    <div id="comments" class="col-lg-6 col-12">
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
      <ul class="nav nav-pills p-2">
    {if $COMMENT_COUNT > 0}
        <li class="active"><a href="#viewcomments" data-toggle="tab">{$COMMENT_COUNT|@translate_dec:'%d comment':'%d comments'}</a></li>
    {/if}
    {if isset($comment_add)}
        <li{if $COMMENT_COUNT == 0} class="active"{/if}><a href="#addcomment" data-toggle="tab">{'Add a comment'|@translate}</a></li>
    {/if}
      </ul>
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
          <button type="submit" class="btn btn-primary btn-raised">{'Submit'|@translate}</button>
        </form>
      </div>
    {/if}
    </div>
  {/if}
{/if}
  </div>

{if !empty($navbar) }
  <div class="row">
    {include file='navigation_bar.tpl' fragment='comments'|@get_extent:'navbar'}
  </div>
{/if}

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}

</div>
