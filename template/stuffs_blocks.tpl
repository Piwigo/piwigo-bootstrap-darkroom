{foreach from=$blocks item=block key=key}
<div class="container pwgstuffs-container">
  <div id="stuffs_block_{$block.ID}" class="panel panel-primary">
    {if isset($block.TITLE)}
    <div class="panel-heading">
    {if isset($block.TITLE_URL)}
          <a href="{$block.TITLE_URL}">{$block.TITLE}</a>
    {else}
          {$block.TITLE}
    {/if}
      <div class="pull-right">
      {if !empty($block.U_EDIT)}
          <a href="{$block.U_EDIT}" title="{'edit'|translate}">
            <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'edit'|@translate}</span>
          </a>
      {/if}
      </div>
    </div>
    {/if}

    <div class="panel-body">
    {include file=$block.TEMPLATE}
    </div>
  </div>
</div>
{/foreach}
