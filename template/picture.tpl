<!-- Start of picture.tpl -->
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/bootstrap_darkroom/node_modules/jQuery-Touch-Events/src/jquery.mobile-events.min.js' require='jquery' load='footer'}
{/if}

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

{$PICTURE_NAV}

<div id="main-picture-container" class="container{if $theme_config->fluid_width}-fluid{/if}">
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

  <div id="theImage" class="row d-block justify-content-center mb-3">
    {$ELEMENT_CONTENT}
  </div>

{if $theme_config->picture_info == 'sidebar'}
    {include file='picture_info_sidebar.tpl'}
{/if}

  <div id="theImageComment" class="row justify-content-center mb-3">
{if isset($COMMENT_IMG)}
    <div class="text-center col-lg-10 col-md-12 mx-auto">
      <section id="important-info">
        <h5 class="imageComment">{$COMMENT_IMG}</h5>
      </section>
    </div>
{/if}
  </div>

{include file="http_scheme.tpl"}
{if $theme_config->social_enabled}
  <div id="theImageShareButtons" class="row justify-content-center{if !$theme_config->slick_enabled} pb-4{/if}">
    <section id="share">
{if $theme_config->social_twitter}
        <a href="http://twitter.com/share?text={$current.TITLE}&amp;url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           onclick="window.open(this.href, 'twitter-share', 'width=550,height=235');return false;" title="Share on Twitter"{if $theme_config->social_buttons} class="btn btn-sm btn-social btn-raised btn-twitter"{/if}>
            <i class="fab fa-twitter"></i>{if $theme_config->social_buttons} Twitter{/if}
        </a>
{/if}
{if $theme_config->social_facebook}
        <a href="https://www.facebook.com/sharer/sharer.php?u={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           onclick="window.open(this.href, 'facebook-share','width=580,height=296');return false;" title="Share on Facebook"{if $theme_config->social_buttons} class="btn btn-sm btn-social btn-raised btn-facebook"{/if}>
            <i class="fab fa-facebook"></i>{if $theme_config->social_buttons} Facebook{/if}
        </a>
{/if}
{if $theme_config->social_pinterest}
        <a href="https://www.pinterest.com/pin/create/button/?url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}{if isset($current.derivatives.large)}&media={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}/../{$current.derivatives.large->get_url()}{/if}"
           onclick="window.open(this.href, 'pinterest-share', 'width=490,height=530');return false;" title="Pin on Pinterest"{if $theme_config->social_buttons} class="btn btn-sm btn-social btn-raised btn-pinterest"{/if}>
            <i class="fab fa-pinterest"></i>{if $theme_config->social_buttons} Pinterest{/if}
        </a>
{/if}
{if $theme_config->social_vk}
        <a href="https://vkontakte.ru/share.php?url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}{if isset($current.derivatives.large)}&image={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}/../{$current.derivatives.large->get_url()}{/if}"
           onclick="window.open(this.href, 'vk-share', 'width=490,height=530');return false;" title="Share on VK"{if $theme_config->social_buttons} class="btn btn-sm btn-social btn-raised btn-vk"{/if}>
            <i class="fab fa-vk"></i>{if $theme_config->social_buttons} VK{/if}
        </a>
{/if}
    </section>
  </div>
{/if}
</div>

<div id="carousel-container" class="container">
{if !empty($thumbnails) && ($theme_config->slick_enabled || $theme_config->photoswipe)}
  <div id="theImageCarousel" class="row mx-0{if !$theme_config->slick_enabled} d-none{/if}">
    <div class="col-lg-10 col-md-12 mx-auto">
      <div id="thumbnailCarousel" class="slick-carousel{if $theme_config->slick_centered} center{/if}">
  {assign var=idx value=0}
  {foreach from=$thumbnails item=thumbnail}
  {assign var=derivative value=$pwg->derivative($derivative_params_square, $thumbnail.src_image)}
  {if !$theme_config->slick_infinite}
    {assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
    {assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
    {assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
  {/if}
  {* Do NOT load thumbnails.loader.js here: this carousel is a slick, which already has
     its own lazy loading (data-lazy, see _slick_js.tpl). Stacking the core's asynchronous
     loader on top made both mechanisms assign src on the same <img>. See the img below. *}
  {if $theme_config->photoswipe && !$theme_config->slick_infinite}
        <div class="text-center{if $thumbnail.id eq $current.id && !$theme_config->slick_infinite} thumbnail-active{/if}">
          <a {if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" {if !$theme_config->slick_infinite}data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{/if}{/if}{if $theme_config->download_enabled} data-download="{$ROOT_URL}action.php?id={$thumbnail.id}&amp;part=e&amp;download"{/if}>
  {else}
        <div class="text-center{if $thumbnail.id eq $current.id} thumbnail-active{/if}">
          <a href="{$thumbnail.URL}">
  {/if}
            {* A single URL in data-lazy, whatever the cache state: get_url() already returns
               a generating URL (i.php?/...) when the derivative does not exist yet, and it
               serves the image bytes on a plain GET. slick needs nothing else. *}
            <img data-lazy="{$derivative->get_url()}" alt="{$thumbnail.TN_ALT}" title="{if isset($thumbnail.TN_TITLE)}{$thumbnail.TN_TITLE}{/if}" class="img-fluid {if isset($thumbnail.path_ext)}path-ext-{$thumbnail.path_ext}{/if} {if isset($thumbnail.file_ext)}file-ext-{$thumbnail.file_ext}{/if}">
          </a>
        </div>
  {assign var=idx value=$idx+1}
  {/foreach}
      </div>
    </div>
  </div>

  {if $theme_config->photoswipe && $theme_config->slick_infinite}
  <div id="photoSwipeData" class="d-none">
    {assign var=idx value=0}
    {foreach from=$thumbnails item=thumbnail}
    {assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
    {assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
    {assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
    <a{if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{/if}{if $theme_config->download_enabled} data-download="{$ROOT_URL}action.php?id={$thumbnail.id}&amp;part=e&amp;download"{/if}></a>
{assign var=idx value=$idx+1}
    {/foreach}
  </div>
  {/if}
  {if $theme_config->slick_enabled && sizeOf($thumbnails) > 1}
    {include file="_slick_js.tpl"}
  {/if}
  {if $theme_config->photoswipe && !$theme_config->slick_infinite}
    {include file="_photoswipe_js.tpl" selector="#thumbnailCarousel"}
  {/if}
  {if $theme_config->photoswipe && $theme_config->slick_infinite}
    {include file="_photoswipe_js.tpl" selector="#photoSwipeData"}
  {/if}
{/if}
</div>

<div id="info-container" class="container{if $theme_config->fluid_width}-fluid{/if}">
  <div id="theImageInfos" class="row justify-content-center">
{if $theme_config->picture_info == 'cards'}
    {include file='picture_info_cards.tpl'}
{elseif $theme_config->picture_info == 'tabs'}
    {include file='picture_info_tabs.tpl'}
{elseif $theme_config->picture_info == 'sidebar' || $theme_config->picture_info == 'disabled'}
    <div class="col-lg-8 col-md-10 col-12 mx-auto">
      {include file='picture_info_comments.tpl'}
    </div>
{/if}
  </div>

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}

</div>
