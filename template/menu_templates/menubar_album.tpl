<li id="AMMalbumMenu{$block->data.album_id}" class="nav-item dropdown AMMalbumMenu">
    <a href="{$block->data.link}" class="nav-link{if count($block->data.album) > 0} dropdown-toggle" data-toggle="dropdown{/if}">{$block->data.name}</a>
    <div class="dropdown-menu dropdown-menu-right" role="menu">
{assign var='ref_level' value=0}
{foreach from=$block->data.album item=cat}
        <a class="dropdown-item{if $cat.SELECTED} active{/if}" data-level="{($cat.LEVEL -1)}" href="{$cat.URL}">
            {$cat.NAME}
{if $cat.count_images > 0}
            <span class="badge badge-secondary ml-2" title="{$cat.TITLE}">{$cat.count_images}</span>
{/if}
{if !empty($cat.icon_ts)}
            <span class="album-recent ml-2" title="{$cat.icon_ts.TITLE}">✻</span>
{/if}
        </a>
{/foreach}
{* The data.nbPictures is always empty, no need to display anything
        <div class="dropdown-divider"></div>
        <div class="dropdown-header">{$block->data.nbPictures|@translate_dec:'%d photo':'%d photos'}</div>
*}
    </div>
</li>
{footer_script require='jquery'}{strip}
$('#categoriesDropdownMenu').on('show.bs.dropdown', function() {
  $(this).find('a.dropdown-item').each(function() {
    var level = $(this).data('level');
    var padding = parseInt($(this).css('padding-left'));
    if (level > 0) {
      $(this).css('padding-left', (padding + 10 * level) + 'px')
    }
  });
});
{/strip}{/footer_script}
