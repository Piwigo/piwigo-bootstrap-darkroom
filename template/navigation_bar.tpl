<nav class="mt-5" aria-label="Page navigation">
    <ul class="pagination justify-content-center">
{if isset($navbar.URL_FIRST)}
        <li class="page-item"><a class="page-link" href="{$navbar.URL_FIRST}{if $fragment}#{$fragment}{/if}" rel="first"><i class="fas fa-fast-backward" title="{'First'|@translate}"></i></a></li>
        <li class="page-item"><a class="page-link" href="{$navbar.URL_PREV}{if $fragment}#{$fragment}{/if}" rel="prev"><i class="fas fa-backward" title="{'Previous'|@translate}"></i></a></li>
{else}
        <li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-fast-backward" title="{'First'|@translate}"></i></a></li>
        <li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-backward" title="{'Previous'|@translate}"></i></a></li>
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
        <li class="page-item"><a class="page-link" href="{$navbar.URL_NEXT}{if $fragment}#{$fragment}{/if}" rel="next"><i class="fas fa-forward" title="{'Next'|@translate}"></i></a></li>
        <li class="page-item"><a class="page-link" href="{$navbar.URL_LAST}{if $fragment}#{$fragment}{/if}" rel="last"><i class="fas fa-fast-forward" title="{'Last'|@translate}"></i></a></li>
{else}
        <li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-forward" title="{'Next'|@translate}"></i></a></li>
        <li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-fast-forward" title="{'Last'|@translate}"></i></a></li>
{/if}
    </ul>
</nav>
