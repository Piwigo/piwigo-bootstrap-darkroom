<li class="nav-item dropdown">
<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$block->get_title()} <span class="caret"></span></a>
  <ul class="dropdown-menu dropdown-menu-scrollable" role="menu">
{foreach from=$block->data item=data}
    <li class="nav-item">
        <a class="nav-link" href="{$data.URL}">{$data.LABEL}</a>
    </li>
{/foreach}
  </ul>
</li>
