<nav class="navbar navbar-expand-lg navbar-contextual {$theme_config->navbar_contextual_style} {$theme_config->navbar_contextual_bg} sticky-top mb-5">
    <div class="container{if $theme_config->fluid_width}-fluid{/if}">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'About'|@translate}</a></div>
        <ul class="navbar-nav justify-content-end">
             {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
        </ul>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container{if $theme_config->fluid_width}-fluid{/if}">
    <div class="card">
        <h4 class="card-header">{'About'|@translate}</h4>
        <div class="card-body">
          {$ABOUT_MESSAGE}
{if isset($THEME_ABOUT) }
          {$THEME_ABOUT}
{/if}

{if not empty($about_msgs)}
{foreach from=$about_msgs item=elt}
{$elt}
{/foreach}
{/if}
          <div><a href="https://github.com/tkuther/piwigo-bootstrap-darkroom">Bootstrap Darkroom Theme</a> by Thomas Kuther.</div>
          <div><a href="https://thenounproject.com/DmitryBaranovskiy/collection/photo/">Photography Icons</a> by <a href="https://thenounproject.com/DmitryBaranovskiy/">Dmitry Baranovskiy</a>, licensed under <a href="https://creativecommons.org/licenses/by/3.0/us/">Creative Commons 3.0</a>.
        </div>
    </div>
</div>
