<li class="nav-item dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$block->get_title()|strip_tags:true}</a>
    <div class="dropdown-menu dropdown-menu-right" role="menu">
        {strip}<a class="dropdown-item" href="{$block->data.U_LIST}">
                {if $block->data.NB_COL == 0}
                {'You have no collection'|translate}
                {else}
                {$pwg->l10n_dec('You have %d collection', 'You have %d collections', $block->data.NB_COL)}
                {/if}
        {/strip}</a>
        <div class="divider"></div>
        {if $block->data.collections}
        {foreach from=$block->data.collections item=col}{strip}
	<a class="dropdown-item" href="{$col.u_edit}">{$col.name}<span class="badge badge-secondary ml-2" title="{$cat.TITLE}">{$col.nb_images}</span></a>
        {/strip}{/foreach}
        {if isset($block->data.MORE)}
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="{$block->data.U_LIST}">{'%d more...'|translate:$block->data.MORE}</a>
        {/if}
        {/if}
    </div>
</li>
