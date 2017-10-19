<li class="nav-item dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{'Related tags'|@translate}</a>
    <div class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$block->data item=tag}
        {strip}<a class="dropdown-item tagLevel{$tag.level}" href=
{if isset($tag.U_ADD)}
                "{$tag.U_ADD}" title="{$tag.counter|@translate_dec:'%d photo is also linked to current tags':'%d photos are also linked to current tags'}" rel="nofollow">+
{else}
                "{$tag.URL}" title="{'display photos linked to this tag'|@translate}">
{/if}
                {$tag.name}
        </a>{/strip}
{/foreach}
    </div>
</li>
