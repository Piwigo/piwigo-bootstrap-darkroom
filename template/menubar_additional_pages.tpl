<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$block->get_title()} <span class="caret"></span></a>
  <ul class="dropdown-menu dropdown-menu-scrollable" role="menu">
    {foreach from=$block->data item=data}
        <li>
            <a href="{$data.URL}">{$data.LABEL}</a>
        </li>
    {/foreach}
  </ul>
</li>
