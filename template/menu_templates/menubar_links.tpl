<!-- links menu bar -->
<li id="AMMlinksDropdownMenu" class="nav-item dropdown">
  <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{if $block->get_title() != ""}{$block->get_title()}{else}{'Links'|translate}{/if}</a>
  <div class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$block->data.LINKS item=link}
    <a class="dropdown-item" href="{$link.url}"{if $link.mode == 0} target="_blank"{/if}>{if $block->data.icons=='y'}<img src="{$link.icon}" class="mr-1"/>{/if} {$link.label}</a>
{/foreach}
  </div>
</li>
