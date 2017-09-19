<nav class="navbar navbar-contextual navbar-expand-lg navbar-dark bg-secondary sticky-top mb-5">
    <div class="container">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'Profile'|@translate}</a></div>
    </div>
</nav>

{include file='infos_errors.tpl'}

{$PROFILE_CONTENT}
