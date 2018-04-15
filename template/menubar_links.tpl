<li class="nav-item dropdown" id="linksDropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{'Links'|@translate}</a>
    <div class="dropdown-menu dropdown-menu-right" role="menu">
    {foreach from=$block->data item=link}
        <a href="{$link.URL}" class="dropdown-item external"{if isset($link.new_window)} onclick="window.open(this.href, '{$link.new_window.NAME}','{$link.new_window.FEATURES}'); return false;"{/if}>{$link.LABEL}</a>
    {/foreach}
    </div>
</li>
