{function name=collectionsMenuItem}
{function collectionsMenuItem}
<a class="dropdown-item" id="menu-info-coll-{$coll_id}" href="{$coll_edit}" {if $coll_id == "coll_template"}style="display:none"{/if}>
    {$coll_name}
    <span class="badge badge-secondary ml-2" >{$coll_nb_images}</span>
</a>
{/function}
{/function}


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
        <div id="menu-info-coll-container">
            {collectionsMenuItem
              coll_id = "coll_template" 
              coll_name = "coll_name"
              coll_edit = "coll_edit"
              coll_nb_images = "coll_nb_images"
            }
            {if $block->data.collections}
            {foreach from=$block->data.collections item=col}{strip}
                {collectionsMenuItem
                  coll_id = $col.id
                  coll_name = $col.name
                  coll_edit = $col.u_edit
                  coll_nb_images = $col.nb_images
                }
            {/strip}{/foreach}
        </div>
        {if isset($block->data.MORE)}
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="{$block->data.U_LIST}">{'%d more...'|translate:$block->data.MORE}</a>
        {/if}
        {/if}
    </div>
</li>
