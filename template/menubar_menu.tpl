{if isset($blocks.mbMenu->data.qsearch) and  $blocks.mbMenu->data.qsearch==true and !$theme_config_extra->quicksearch_navbar}
      <li class="nav-item">
        <form class="navbar-form" role="search" action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch" onsubmit="return this.q.value!='' && this.q.value!=qsearch_prompt;">
            <div class="form-group">
                <input type="text" name="q" id="qsearchInput" class="form-control" placeholder="{'Quick search'|@translate}" />
            </div>
        </form>
      </li>
      <li class="divider"></li>
{/if}
{foreach from=$blocks.mbMenu->data item=link}
{if is_array($link)}
      <li class="nav-item">
          <a class="nav-link" href="{$link.URL}" title="{$link.TITLE}"{if isset($link.REL)} {$link.REL}{/if}>{$link.NAME}
              {if isset($link.COUNTER)}<span class="badge">{$link.COUNTER}</span>{/if}
          </a>
      </li>
{/if}
{/foreach}
