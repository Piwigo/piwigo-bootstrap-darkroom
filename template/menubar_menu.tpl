<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Menu'|@translate} <span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
{if isset($block->data.qsearch) and  $block->data.qsearch==true and !$theme_config_extra->quicksearch_navbar}
        <form class="navbar-form" role="search" action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch" onsubmit="return this.q.value!='' && this.q.value!=qsearch_prompt;">
            <div class="form-group">
                <input type="text" name="q" id="qsearchInput" class="form-control" placeholder="{'Quick search'|@translate}" />
            </div>
        </form>
        <li class="divider"></li>
{/if}
{foreach from=$block->data item=link}
{if is_array($link)}
        <li>
            <a href="{$link.URL}" title="{$link.TITLE}"{if isset($link.REL)} {$link.REL}{/if}>{$link.NAME}
                {if isset($link.COUNTER)}<span class="badge">{$link.COUNTER}</span>{/if}
            </a>
        </li>
{/if}
{/foreach}
    </ul>
</li>
