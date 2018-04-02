<div class="container{if $theme_config->fluid_width}-fluid{/if} pwgstuffs-container">
    <div class="row">
{foreach from=$blocks item=block key=key}
{if !empty($block.given_width) || !empty($block.WIDTH)}
{if !empty($block.WIDTH)}
{assign var=bwidth value=$block.WIDTH}
{else}
{assign var=bwidth value=$block.given_width}
{/if}
{if $bwidth < 100 && $bwidth >= 75}
{assign var=col_classes value='col-12 col-lg-9'}
{elseif $bwidth < 75 && $bwidth >= 66}
{assign var=col_classes value='col-12 col-lg-8'}
{elseif $bwidth < 66 && $bwidth >= 50}
{assign var=col_classes value='col-12 col-lg-6'}
{elseif $bwidth < 50 && $bwidth >= 33}
{assign var=col_classes value='col-12 col-lg-4'}
{elseif $bwidth < 33}
{assign var=col_classes value='col-12 col-md-6 col-lg-3'}
{else}
{assign var=col_classes value='col-12'}
{/if}
{else}
{assign var=col_classes value='col-12'}
{/if}
        <div id="stuffs_block_{$block.ID}" class="pwgstuffs-col {$col_classes}">
{if isset($block.TITLE)}
            <nav class="navbar pwgstuffs-navbar">
                <div class="navbar-header">
                    {if isset($block.TITLE_URL)}
                    <a class="navbar-brand" href="{$block.TITLE_URL}">{$block.TITLE}</a>
                    {else}
                    <div class="navbar-brand">{$block.TITLE}</div>
                    {/if}
                </div>
                {if !empty($block.U_EDIT)}
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="{$block.U_EDIT}" title="{'edit'|translate}">
                            <i class="fas fa-pencil-alt" title="{'edit'|@translate}"></i>
                        </a>
                    </li>
                </ul>
                {/if}
            </nav>
{/if}

            <div class="pwgstuffs-content">
                {include file=$block.TEMPLATE}
            </div>
        </div>
{/foreach}
    </div>
</div>
