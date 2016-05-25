{if !empty($thumbnails)}
{footer_script}
  var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png", max_requests = {$maxRequests};
{/footer_script}
{if $derivative_params->type == "thumb"}
{assign var=width value=260}
{assign var=height value=180}
{else}
{assign var=width value=$derivative_params->sizing->ideal_size[0]}
{assign var=height value=$derivative_params->sizing->ideal_size[1]}
{/if}
{define_derivative name='derivative_params' width=$width height=$height crop=true}
<style>
    .placeholder-{$width} {
        width: {$width}px;
        height: {$height}px;
        background: url({$ROOT_URL}{$themeconf.icon_dir}/img_small.png) no-repeat center;
    }
</style>
{assign var=idx value=0}
{foreach from=$thumbnails item=thumbnail}
{assign var=derivative value=$pwg->derivative($derivative_params, $thumbnail.src_image)}
{if !$derivative->is_cached()}
{combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
{/if}
{include file="grid_classes.tpl" width=$width height=$height}
<div class="col-outer {if $smarty.cookies.view == 'list'}col-lg-12 col-md-12 col-sm-12 col-xs-12{else}{$col_class}{/if}" data-grid-classes="{$col_class}">
    <div class="col-inner">
        <a class="col-thumbnail" href="{$thumbnail.URL}" data-index="{$idx}">
            <div class="placeholder-{$width}">
                <img {if $derivative->is_cached()}src="{$derivative->get_url()}"{else}src="{$ROOT_URL}themes/bootstrapdefault/img/transparent.png"
                     data-src="{$derivative->get_url()}"{/if}
                     alt="{$thumbnail.TN_ALT}"
                     title="{$thumbnail.TN_TITLE}">
            </div>
        </a>
{assign var=idx value=$idx+1}
{if $SHOW_THUMBNAIL_CAPTION }
        <div class="caption">
            <h3 class="title">
                <a href="{$thumbnail.URL}" class="ellipsis{if !empty($thumbnail.icon_ts)} recent{/if}">{$thumbnail.NAME}</a>
{if !empty($thumbnail.icon_ts)}
                <img title="{$thumbnail.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent.png" alt="(!)">
{/if}
            </h3>
{if isset($thumbnail.NB_COMMENTS)}
            <p class="{if 0==$thumbnail.NB_COMMENTS}zero {/if}nb-comments">
                {$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}
            </p>
{/if}

{if isset($thumbnail.NB_HITS)}
            <p class="{if 0==$thumbnail.NB_HITS}zero {/if}nb-hits">
                {$pwg->l10n_dec('%d view', '%d views',$thumbnail.NB_HITS)}
            </p>
{/if}
        </div>
{/if}
    </div>
</div>
{/foreach}
{/if}
