<li class="nav-item dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$block->get_title()|strip_tags:true}</a>
    <ul class="dropdown-menu dropdown-menu-right dropdown-menu-scrollable" role="menu">
        <li class="dropdown-item">{strip}
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
	<li class="dropdown-item">
            <a href="{$col.u_edit}">
                {$col.name}
        &nbsp;       <span class="badge" title="{$cat.TITLE}">{$col.nb_images}</span>
            </a>
        </li>
        {/strip}{/foreach}
        {if isset($block->data.MORE)}
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><a href="{$block->data.U_LIST}">{'%d more...'|translate:$block->data.MORE}</a></li>
        {/if}
        {/if}
    </ul>
</li>
