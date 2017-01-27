<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div class="navbar-brand"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'Profile'|@translate}</a></div>
        </div>
    </div>
</nav>

{include file='infos_errors.tpl'}

{$PROFILE_CONTENT}
