<!-- personalised menu bar -->
<li id="AMMPersonalisedMenu{$block->id}" class="nav-item dropdown AMMPersonalisedMenu">
  <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{$block->get_title()}</a>
  <div class="dropdown-menu dropdown-menu-right" role="menu">
    {$block->data}
  </div>
</li>
