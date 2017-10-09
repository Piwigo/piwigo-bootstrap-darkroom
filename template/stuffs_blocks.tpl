{foreach from=$blocks item=block key=key}
<div id="stuffs_block_{$block.ID}" class="container{if $theme_config->fluid_width}-fluid{/if} pwgstuffs-container">
  {if isset($block.TITLE)}
  <nav class="navbar pwgstuffs-navbar">
    <div class="container{if $theme_config->fluid_width}-fluid{/if}">
      <div class="navbar-header">
        {if isset($block.TITLE_URL)}
          <a class="navbar-brand" href="{$block.TITLE_URL}">{$block.TITLE}</a>
        {else}
          <div class="navbar-brand">{$block.TITLE}</div>
        {/if}
      </div>
          <div>
          {if !empty($block.U_EDIT)}
            <ul class="navbar-nav">
              <li class="nav-item">
               <a class="nav-link" href="{$block.U_EDIT}" title="{'edit'|translate}">
                  <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'edit'|@translate}</span>
                </a>
              </li>
            </ul>
          {/if}
          </div>
    </div>
  </nav>
  {/if}

  <div class="row pwgstuffs-content">
    {include file=$block.TEMPLATE}
  </div>
</div>
{/foreach}
