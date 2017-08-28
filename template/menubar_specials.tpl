{foreach from=$blocks.mbSpecials->data item=link}
		<li class="dropdown-item"><a href="{$link.URL}" title="{$link.TITLE}"{if isset($link.REL)} {$link.REL}{/if}>{$link.NAME}</a></li>
{/foreach}
