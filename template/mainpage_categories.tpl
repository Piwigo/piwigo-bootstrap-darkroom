{footer_script}
    var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png", max_requests = {$maxRequests};
{/footer_script}
{* this might sound ridiculous, but we want to fit the thumbnails to 90% of col-xs-12 without them being too blurry *}
{assign var=width value=520}
{assign var=height value=360}
{define_derivative name='derivative_params' width=$width height=$height crop=true}
{define_derivative name='derivative_params_square' type=IMG_SQUARE}
{foreach from=$category_thumbnails item=cat name=cat_loop}
{if $theme_config->category_wells == 'never' || ($theme_config->category_wells == 'mobile_only' && get_device() == 'desktop')}
{assign var=derivative value=$pwg->derivative($derivative_params, $cat.representative.src_image)}
{if !$derivative->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
{* this needs a fixed size else it messes up the grid on tablets *}
{include file="grid_classes.tpl" width=260 height=180}
<div class="col-outer mt-5 {if $smarty.cookies.view == 'list'}col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12{else}{$col_class}{/if}" data-grid-classes="{$col_class}">
  <div class="card card-thumbnail">
    <a href="{$cat.URL}"{if $theme_config->bootstrap_theme == 'material'} class="ripple h-100"{/if}>
      <img class="card-img-top" {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}themes/bootstrap_darkroom/img/transparent.png" data-src="{$derivative->get_url()}"{/if} alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '|@strip_tags:false} - {'display this album'|@translate}">
      <div class="card-body">
        <h4 class="card-title ellipsis{if !empty($cat.icon_ts)} recent{/if}">{$cat.NAME}</h4>
        <div class="card-text">
{if not empty($cat.DESCRIPTION)}
            <div class="description">{$cat.DESCRIPTION}</div>
{/if}
{if isset($cat.INFO_DATES) }
            <p>{$cat.INFO_DATES}</p>
{/if}
        </div>
      </div>
      <div class="card-footer text-muted">{$cat.CAPTION_NB_IMAGES}</div>
    </a>
  </div>
</div>
{else}
{assign var=derivative_square value=$pwg->derivative($derivative_params_square, $cat.representative.src_image)}
{if !$derivative_square->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
<a class="w-100 mb-2" href="{$cat.URL}">
 <div class="card card-body bg-dark">
  <div class="media">
      <img class="d-flex mr-3" {if $derivative_square->is_cached()}src="{$derivative_square->get_url()}"{else}src="{$ROOT_URL}themes/bootstrap_darkroom/img/transparent.png" data-src="{$derivative_square->get_url()}"{/if} alt="{$cat.TN_ALT}">
      <div class="media-body">
        <h4 class="mt-0 mb-1">{$cat.NAME}</h4>
{if isset($cat.INFO_DATES) }
        <p>{$cat.INFO_DATES}</p>
{/if}
{if not empty($cat.DESCRIPTION)}
        <p class="description">{$cat.DESCRIPTION}</p>
{/if}
        <p><small>{$cat.CAPTION_NB_IMAGES}</small></p>
      </div>
  </div>
 </div>
</a>
{/if}
{/foreach}
