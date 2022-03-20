<li id="relatedCategoriesDropdownMenu" class="nav-item dropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{'Related albums'|@translate}</a>
    <div class="dropdown-menu dropdown-menu-right" role="menu">
{foreach from=$block->data.MENU_CATEGORIES item=cat}
       <{if isset($cat.url)}a href="{$cat.url}"{else}span{/if} class="dropdown-item" data-level="{($cat.LEVEL -1)}">{$cat.name}
  {if !empty($cat.count_images)}
        <span class="badge badge-primary ml-2" title="{if isset($cat.TITLE)}{$cat.TITLE}{/if}">{$cat.count_images}</span>
  {/if}
  {if !empty($cat.count_categories) }
        <span class="badge badge-secondary ml-2" title="{'sub-albums'|translate}">{$cat.count_categories}</span>
  {/if}
       </{if isset($cat.url)}a{else}span{/if}>
{/foreach}
    </div>
</li>
{footer_script require='jquery'}{strip}
$('#relatedCategoriesDropdownMenu').on('show.bs.dropdown', function() {
  $(this).find('.dropdown-item').each(function() {
    var level = $(this).data('level');
    var padding = parseInt($(this).css('padding-left'));
    if (level > 0) {
      $(this).css('padding-left', (padding + 10 * level) + 'px')
    }
  });
});
{/strip}{/footer_script}
