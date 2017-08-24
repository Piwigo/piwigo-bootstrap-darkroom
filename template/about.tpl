<nav class="navbar navbar-expand-lg navbar-contextual">
    <div class="container">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'About'|@translate}</a></div>
        <ul class="navbar-nav justify-content-end">
             {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
        </ul>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container">
    <div class="card">
        <h4 class="card-header">{'About'|@translate}</h4>
        <div class="card-body">
{$ABOUT_MESSAGE}
{if isset($THEME_ABOUT) }
            <ul>
                <li>{$THEME_ABOUT}</li>
            </ul>
{/if}
{if not empty($about_msgs)}
{foreach from=$about_msgs item=elt}
{$elt}
{/foreach}
{/if}
        </div>
    </div>
</div>
