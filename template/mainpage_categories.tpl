{footer_script}
    var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png", max_requests = {$maxRequests};
{/footer_script}
{* this might sound ridiculous, but we want to fit the thumbnails to 90% of col-xs-12 without them being too blurry *}
{assign var=width value=520}
{assign var=height value=360}
{define_derivative name='derivative_params' width=$width height=$height crop=true}
{define_derivative name='derivative_params_square' type=IMG_SQUARE}
<div class="row">
{foreach from=$category_thumbnails item=cat name=cat_loop}
{if $theme_config->category_wells == 'never' || ($theme_config->category_wells == 'mobile_only' && get_device() == 'desktop')}
{assign var=derivative value=$pwg->derivative($derivative_params, $cat.representative.src_image)}
{if !$derivative->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
{* this needs a fixed size else it messes up the grid on tablets *}
{include file="grid_classes.tpl" width=260 height=180}
  <div class="col-outer mt-3 {if isset($smarty.cookies.view) and $smarty.cookies.view == 'list'}col-12{else}{$col_class}{/if}" data-grid-classes="{$col_class}">
  <div class="card card-thumbnail {if isset($cat.path_ext)}path-ext-{$cat.path_ext}{/if} {if isset($cat.file_ext)}file-ext-{$cat.file_ext}{/if}">
      <div class="h-100">
        <a href="{$cat.URL}" class="ripple{if isset($smarty.cookies.view) and $smarty.cookies.view != 'list'} d-block{/if}">
          <img class="{if isset($smarty.cookies.view) and $smarty.cookies.view == 'list'}card-img-left{else}card-img-top{/if} thumb-img" {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}themes/bootstrap_darkroom/img/transparent.png" data-src="{$derivative->get_url()}"{/if} alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '|@strip_tags:false} - {'display this album'|@translate}">
        </a>
        <div class="card-body">
          <h5 class="card-title ellipsis {if !empty($cat.icon_ts)} recent{/if}">
          <a href="{$cat.URL}">{$cat.NAME}</a>
          {if !empty($cat.icon_ts)}
            <img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" alt="(!)">
          {/if}
          </h5>
          <div class="card-text">
{if not empty($cat.DESCRIPTION)}
              <div class="description {if $theme_config->cat_descriptions} d-block{/if}">{$cat.DESCRIPTION}</div>
{/if}
{if isset($cat.INFO_DATES) }
              <div class="info-dates">{$cat.INFO_DATES}</div>
{/if}
          </div>
        </div>
{if $theme_config->cat_nb_images}
        <div class="card-footer text-muted"><div class="d-inline-block ellipsis">{str_replace('<br>', ', ', $cat.CAPTION_NB_IMAGES)}</div></div>
{/if}
      </div>
    </div>
  </div>
{else}
{assign var=derivative_square value=$pwg->derivative($derivative_params_square, $cat.representative.src_image)}
{if !$derivative_square->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
  <div class="col-outer col-12">
    <div class="card">
      <div class="card-body p-0">
        <a href="{$cat.URL}">
          <div class="media h-100">
            <img class="d-flex mr-3" {if $derivative_square->is_cached()}src="{$derivative_square->get_url()}"{else}src="{$ROOT_URL}themes/bootstrap_darkroom/img/transparent.png" data-src="{$derivative_square->get_url()}"{/if} alt="{$cat.TN_ALT}">
            <div class="media-body pt-2">
              <h4 class="mt-0 mb-1">{$cat.NAME}</h4>
{if not empty($cat.DESCRIPTION)}
              <div class="description">{$cat.DESCRIPTION}</div>
{/if}
{if isset($cat.INFO_DATES) }
              <div>{$cat.INFO_DATES}</div>
{/if}
{if $theme_config->cat_nb_images}
              <div class="text-muted">{str_replace('<br>', ', ', $cat.CAPTION_NB_IMAGES)}</div>
{/if}
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
{/if}
{/foreach}
</div>
