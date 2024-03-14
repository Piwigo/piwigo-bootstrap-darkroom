{if isset($blocks.mbMenu->data.qsearch) and  $blocks.mbMenu->data.qsearch==true and !$theme_config->quicksearch_navbar}
      <div class="dropdown-header">
        <form class="navbar-form" role="search" action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch" onsubmit="return this.q.value!='' && this.q.value!=qsearch_prompt;">
            <div class="form-group">
                <input type="text" name="q" id="qsearchInput" class="form-control" placeholder="{'Quick search'|@translate}" />
            </div>
        </form>
      </div>
      <div class="dropdown-divider"></div>
{/if}
{foreach from=$blocks.mbMenu->data item=link}
{if is_array($link)}
      <a class="dropdown-item" href="{$link.URL}"{if isset($link.TITLE)} title="{$link.TITLE}"{/if}{if isset($link.REL)} {$link.REL}{/if}>{$link.NAME}
          {if isset($link.COUNTER)}<span class="badge badge-secondary ml-2">{$link.COUNTER}</span>{/if}
      </a>
{/if}
{/foreach}
