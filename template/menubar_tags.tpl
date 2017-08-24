<li class="nav-item dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{'Related tags'|@translate} <span class="caret"></span></a>
    <ul class="dropdown-menu dropdown-menu-scrollable" role="menu">
{foreach from=$block->data item=tag}
		<li class="nav-item">
            {strip}<a class="nav-link tagLevel{$tag.level}" href=
{if isset($tag.U_ADD)}
                "{$tag.U_ADD}" title="{$tag.counter|@translate_dec:'%d photo is also linked to current tags':'%d photos are also linked to current tags'}" rel="nofollow">+
{else}
                "{$tag.URL}" title="{'display photos linked to this tag'|@translate}">
{/if}
                {$tag.name}</a>{/strip}
        </li>
{/foreach}
    </ul>
</li>
