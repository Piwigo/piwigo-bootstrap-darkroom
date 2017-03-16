<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div class="navbar-brand"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'About'|@translate}</a></div>
        </div>
    </div>
    <div class="navbar-right">
       <ul class="nav navbar-nav">
             {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
       </ul>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            {'About'|@translate}
        </div>
        <div class="panel-body">
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
