{strip}
<a class="addCollection" data-id="%id%" data-cols="[%collections%]" rel="nofollow">
    <span class="fas fa-star"></span>
{if not isset($UC_IN_EDIT)}
    <span>{'Add to collection'|translate}</span>
{else}
    <span>{'Remove from collection'|translate}</span>
{/if}
</a>
{/strip}