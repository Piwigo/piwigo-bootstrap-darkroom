{if !empty($thumbnails)}
{footer_script}
  var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png"{if isset($maxRequests)}, max_requests = {$maxRequests}{/if};
{/footer_script}
{if $derivative_params->type == "thumb"}
{assign var=width value=520}
{assign var=height value=360}
{assign var=rwidth value=260}
{assign var=rheight value=180}
{else}
{assign var=width value=$derivative_params->sizing->ideal_size[0]}
{assign var=height value=$derivative_params->sizing->ideal_size[1]}
{assign var=rwidth value=$width}
{assign var=rheight value=$height}
{/if}
{define_derivative name='derivative_params' width=$width height=$height crop=true}
{assign var=idx value=0+$START_ID}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
{if !$derivative->is_cached()}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
{include file="grid_classes.tpl" width=$rwidth height=$rheight}
<div class="col-outer {if $smarty.cookies.view == 'list'}col-12{else}{$col_class}{/if}" data-grid-classes="{$col_class}">
    <div class="card card-thumbnail">
      <div class="h-100">
        <a href="{$thumbnail.URL}" data-index="{$idx}" class="ripple{if $smarty.cookies.view != 'list'} d-block{/if}">
            <img class="{if $smarty.cookies.view == 'list'}card-img-left{else}card-img-top{/if}" {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}themes/bootstrap_darkroom/img/transparent.png" data-src="{$derivative->get_url()}"{/if} alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}">
{if isset($loaded_plugins['UserCollections']) && !isset($U_LOGIN)}
            <div class="addCollection" data-id="{$thumbnail.id}" data-cols="[{$thumbnail.COLLECTIONS}]"><i class="fas fa-star"></i><span class="ml-2">{'Collections'|@translate}</span></div>
{/if}
        </a>
{assign var=idx value=$idx+1}
{if $SHOW_THUMBNAIL_CAPTION}
        <div class="card-body{if !$theme_config->thumbnail_caption && $smarty.cookies.view != 'list'} d-none{/if}{if !$theme_config->thumbnail_caption} list-view-only{/if}">
            <h6 class="card-title">
{if $theme_config->thumbnail_desc}
            {if !empty($thumbnail.DESCRIPTION)}
                <div id="content-description" class="py-3{if $theme_config->thumbnail_cat_desc == 'simple'} text-center{/if}">
            {if $theme_config->thumbnail_cat_desc == 'simple'}
                    <h5>{$thumbnail.DESCRIPTION}</h5>
            {else}
                    {$thumbnail.DESCRIPTION}
            {/if}
                </div>
            {/if}
{else}
                <a href="{$thumbnail.URL}" class="ellipsis{if !empty($thumbnail.icon_ts)} recent{/if}">{$thumbnail.NAME}</a>
{/if}
{if !empty($thumbnail.icon_ts)}
                <img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" alt="(!)">
{/if}
            </h6>
{if isset($thumbnail.NB_COMMENTS) || isset($thumbnail.NB_HITS)}
            <div class="card-text">
  {if isset($thumbnail.NB_COMMENTS)}
                <p class="text-muted {if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
                    {$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}
                </p>
  {/if}
  {if isset($thumbnail.NB_HITS)}
                <p class="text-muted {if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
                    {$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}
                </p>
  {/if}
            </div>
{/if}
        </div>
{/if}
      </div>
    </div>
</div>
{/foreach}
{/if}
