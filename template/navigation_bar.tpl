<nav class="mt-5" aria-label="Page navigation">
    <ul class="pagination justify-content-center">
{if isset($navbar.URL_FIRST)}
        <li class="page-item"><a class="page-link" href="{$navbar.URL_FIRST}{if $fragment}#{$fragment}{/if}" rel="first">{'First'|@translate}</a></li>
        <li class="page-item"><a class="page-link" href="{$navbar.URL_PREV}{if $fragment}#{$fragment}{/if}" rel="prev">{'Previous'|@translate}</a></li>
{else}
        <li class="page-item disabled"><a class="page-link" href="#">{'First'|@translate}</a></li>
        <li class="page-item disabled"><a class="page-link" href="#">{'Previous'|@translate}</a></li>
{/if}
{assign var='prev_page' value=0}
{foreach from=$navbar.pages key=page item=url}
{if $page == $navbar.CURRENT_PAGE}
        <li class="page-item active"><a class="page-link" href="#">{$page}</a></li>
{else}
        <li class="page-item"><a class="page-link" href="{$url}{if $fragment}#{$fragment}{/if}">{$page}</a></li>
{/if}
{assign var='prev_page' value=$page}
{/foreach}

{if isset($navbar.URL_NEXT)}
        <li class="page-item"><a class="page-link" href="{$navbar.URL_NEXT}{if $fragment}#{$fragment}{/if}" rel="next">{'Next'|@translate}</a></li>
        <li class="page-item"><a class="page-link" href="{$navbar.URL_LAST}{if $fragment}#{$fragment}{/if}" rel="last">{'Last'|@translate}</a></li>
{else}
        <li class="page-item disabled"><a class="page-link" href="#">{'Next'|@translate}</a></li>
        <li class="page-item disabled"><a class="page-link" href="#">{'Last'|@translate}</a></li>
{/if}
    </ul>
</nav>
