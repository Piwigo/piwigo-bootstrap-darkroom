<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$block->get_title()|strip_tags:true} <span class="caret"></span></a>
  <ul class="dropdown-menu dropdown-menu-scrollable" role="menu">
  <li>{strip}
    <a href="{$block->data.U_LIST}">
{if $block->data.NB_COL == 0}
      {'You have no collection'|translate}
{else}
      {$pwg->l10n_dec('You have %d collection', 'You have %d collections', $block->data.NB_COL)}
{/if}
    </a>
  {/strip}</li>
  <li class="divider"></li>
{if $block->data.collections}
  {foreach from=$block->data.collections item=col}{strip}
		<li>
      <a href="{$col.u_edit}">
        {$col.name}
        &nbsp;<span class="badge" title="{$cat.TITLE}">{$col.nb_images}</span>
      </a>
    </li>
  {/strip}{/foreach}
  {if isset($block->data.MORE)}
    <li class="divider"></li>
    <li><a href="{$block->data.U_LIST}">{'%d more...'|translate:$block->data.MORE}</a></li>
  {/if}
	</ul>
{/if}
  </ul>
</li>
