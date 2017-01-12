{foreach from=$blocks item=block key=key}
<div id="stuffs_block_{$block.ID}" class="content">
  {if isset($block.TITLE)}
  <nav class="navbar navbar-default" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <div class="navbar-brand">
    {if isset($block.TITLE_URL)}
          <a href="{$block.TITLE_URL}">{$block.TITLE}</a>
    {else}
          {$block.TITLE}
    {/if}
        </div>
      </div>
      <div class="navbar-right">
        <ul class="nav navbar-nav">
    {if !empty($block.U_EDIT)}
          <li>
            <a href="{$block.U_EDIT}" title="{'edit'|translate}">
              <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'edit'|@translate}</span>
            </a>
          </li>
    {/if}
        </ul>
      </div>
    </div>
  </nav>
  {/if}

  <div class="container">
  {include file=$block.TEMPLATE}
  </div>
</div>
{/foreach}
