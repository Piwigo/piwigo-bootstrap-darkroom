            <!-- Start of menubar.tpl -->
            <ul class="nav navbar-nav">
{assign var="discover_menu_exists" value=false}
{foreach from=$blocks key=id item=block}
{if not empty($block->template)}
{if $id != "mbMenu" && $id != "mbSpecials" && $id != "mbIdentification"}
{include file=$block->template|@get_extent:$id }
{/if}
{if $discover_menu_exists == false && ($id == "mbSpecials" or $id == "mbMenu")}
<li class="dropdown">                                                                                                                                                   
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Discover'|@translate} <span class="caret"></span></a>                                                  
    <ul class="dropdown-menu" role="menu">
    {if not empty($blocks.mbMenu->template)}
    {include file=$blocks.mbMenu->template}
    {/if}
    {if not empty($blocks.mbSpecials->template)}
    {if not empty($blocks.mbMenu->template)}
    <li role="separator" class="divider"></li>
    {/if}
    {include file=$blocks.mbSpecials->template}
    {/if}
    </ul>
</li>
{assign var="discover_menu_exists" value=true}
{/if}
{else}
{$block->raw_content}
{/if}
{/foreach}

{* use foreach again for plugin compatibility, no idea why $blocks.mbIdentification->template breaks SocialConnect, for example *}
{foreach from=$blocks key=id item=block}
{if not empty($block->template) && $id == "mbIdentification"}
{include file=$block->template|@get_extent:$id }
{/if}
{/foreach}
            </ul>
            <!-- End of menubar.tpl -->
