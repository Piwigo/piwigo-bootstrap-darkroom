<nav class="navbar navbar-contextual navbar-expand-lg {$theme_config->navbar_contextual_style} {$theme_config->navbar_contextual_bg} sticky-top mb-5">
    <div class="container{if $theme_config->fluid_width}-fluid{/if}">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'Tags'|@translate}</a></div>
        <ul class="navbar-nav justify-content-end">
{if $display_mode != 'cloud'}
            <li class="nav-item">
                <a class="nav-link" href="{$U_CLOUD}" title="{'show tag cloud'|@translate}">
                    <i class="fas fa-cloud fa-fw" aria-hidden="true"></i><span class="d-lg-none"> {'show tag cloud'|@translate}</span>
                </a>
            </li>
{/if}
{if $display_mode != 'letters'}
            <li class="nav-item">
                <a class="nav-link" href="{$U_LETTERS}" title="{'group by letters'|@translate}" rel="nofollow">
                    <i class="fas fa-sort-alpha-down fa-fw" aria-hidden="true"></i><span class="d-lg-none"> {'group by letters'|@translate}</span>
                </a>
            </li>
{/if}
{if isset($loaded_plugins['tag_groups']) && $display_mode != 'groups'}
            <li class="nav-item">
                <a class="nav-link" href="{$U_TAG_GROUPS}" title="{'show tag groups'|@translate}" rel="nofollow">
                    <i class="fas fa-tags fa-fw" aria-hidden="true"></i><span class="d-lg-none"> {'show tag groups'|@translate}</span>
                </a>
            </li>
{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
        </ul>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container{if $theme_config->fluid_width}-fluid{/if}">

{if $display_mode == 'cloud' and isset($tags)}
{if $theme_config->tag_cloud_type == 'basic'}
    <div id="tagCloud">
{foreach from=$tags item=tag}
        <span><a href="{$tag.URL}" class="tagLevel{$tag.level}" title="{$tag.counter|@translate_dec:'%d photo':'%d photos'}">{$tag.name}</a></span>
{/foreach}
    </div>
{else}
{combine_script id='jquery.awesomeCloud' load='footer' path="themes/bootstrap_darkroom/js/jquery.awesomeCloud.js"}
{footer_script require='jquery.awesomeCloud'}{strip}
    $(document).ready(function(){
        $("#tagCloudCanvas").awesomeCloud({
            "size" : {
                "grid": 12,
                "factor": 0,
                "normalize": false
            },
            "options": {
                "color": "gradient",
                "rotationRatio": 0.2,
            },
            "color": {
                "start": $('#tagCloudGradientStart').css('color'),
                "end": $('#tagCloudGradientEnd').css('color')
            },
            "font": "'Helvetica Neue',Helvetica,Arial,sans-serif",
            "shape": "circle"
        });
    });
{/strip}{/footer_script}
    <div id="tagCloudCanvas">
{foreach from=$tags item=tag}
        <span data-weight="{$tag.counter}"><a href="{$tag.URL}">{$tag.name}</a></span>
{/foreach}
    </div>
    <div id="tagCloudGradientStart"></div>
    <div id="tagCloudGradientEnd"></div>
{/if}
{/if}

{if $display_mode == 'letters' and isset($letters)}
    <div id="tagLetters">
{foreach from=$letters item=letter}
        <div class="card w-100 mb-3">
            <div class="card-header">{$letter.TITLE}</div>
            <div class="list-group list-group-flush">
    {foreach from=$letter.tags item=tag}
                <a href="{$tag.URL}" class="list-group-item list-group-item-action" title="{$tag.name}">{$tag.name}<span class="badge badge-secondary ml-2">{$tag.counter|@translate_dec:'%d photo':'%d photos'}</span></a>
    {/foreach}
            </div>
        </div>
{/foreach}
    </div>
{/if}

</div> <!-- content -->
