{foreach from=$blocks.mbSpecials->data item=link}
		<li class="nav-item"><a class="nav-link" href="{$link.URL}" title="{$link.TITLE}"{if isset($link.REL)} {$link.REL}{/if}>{$link.NAME}</a></li>
{/foreach}
