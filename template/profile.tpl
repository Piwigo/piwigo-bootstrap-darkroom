<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div class="navbar-brand"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'Profile'|@translate}</a></div>
        </div>
    </div>
</nav>
{if $theme_config_extra->bootstrap_theme == 'bootswatch' || $theme_config_extra->bootstrap_theme == 'material' }
{footer_script require='jquery'}
$('.navbar-default .navbar-brand a').css('color', $('.navbar-default .navbar-brand').css('color'));
{/footer_script}
{/if}

{include file='infos_errors.tpl'}

{$PROFILE_CONTENT}
