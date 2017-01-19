{foreach from=$blocks item=block key=key}
<div id="stuffs_block_{$block.ID}" class="container pwgstuffs-container">
  {if isset($block.TITLE)}
  <nav class="navbar navbar-default pwgstuffs-navbar">
    <div class="container-fluid">
      <div class="navbar-header">
        {if isset($block.TITLE_URL)}
          <a class="navbar-brand" href="{$block.TITLE_URL}">{$block.TITLE}</a>
        {else}
          <div class="navbar-brand">{$block.TITLE}</div>
        {/if}
      </div>
          <div class="navbar-right">
          {if !empty($block.U_EDIT)}
            <ul class="nav navbar-nav">
              <li>
                <a href="{$block.U_EDIT}" title="{'edit'|translate}">
                  <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'edit'|@translate}</span>
                </a>
              </li>
            </ul>
          {/if}
          </div>
    </div>
  </nav>
  {/if}

  <div class="row">
    {include file=$block.TEMPLATE}
  </div>
</div>
{/foreach}
