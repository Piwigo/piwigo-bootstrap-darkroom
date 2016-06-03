<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Albums'|@translate} <span class="caret"></span></a>
    <ul class="dropdown-menu dropdown-menu-scrollable" role="menu">
{assign var='ref_level' value=0}
{foreach from=$block->data.MENU_CATEGORIES item=cat}
        <li {if $cat.SELECTED}class="active"{/if}{if $cat.LEVEL > 1} style="padding-left: {$cat.LEVEL * 5}px;"{/if}>
            <a href="{$cat.URL}">{$cat.NAME}
{if $cat.count_images > 0}
                <span class="badge" title="{$cat.TITLE}">{$cat.count_images}</span>
{/if}
{if !empty($cat.icon_ts)}
                <img title="{$cat.icon_ts.TITLE}" src="{$ROOT_URL}{$themeconf.icon_dir}/recent{if $cat.icon_ts.IS_CHILD_DATE}_by_child{/if}.png" class="icon" alt="(!)">
{/if}
            </a>
        </li>
{/foreach}
        <li class="divider"></li>
        <li><a href="#">{$block->data.NB_PICTURE|@translate_dec:'%d photo':'%d photos'}</a></li>
    </ul>
</li>
