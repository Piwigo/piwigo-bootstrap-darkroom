            <!-- Start of menubar.tpl -->
            <ul class="nav navbar-nav">
{foreach from=$blocks key=id item=block}
{if not empty($block->template)}
{if $id != "mbMenu" && $id != "mbSpecials" && $id != "mbIdentification"}
{include file=$block->template|@get_extent:$id }
{/if}
{if $id == "mbMenu"}
<li class="dropdown">                                                                                                                                                                                       
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Discover'|@translate} <span class="caret"></span></a>                                                                                          
    <ul class="dropdown-menu" role="menu">
    {include file=$block->template|@get_extent:$id }
    <li role="separator" class="divider"></li>
    {include file=$blocks.mbSpecials->template}
    </ul>
</li>
{/if}
{else}
{$block->raw_content}
{/if}
{/foreach}
{include file=$blocks.mbIdentification->template}
            </ul>
            <!-- End of menubar.tpl -->
