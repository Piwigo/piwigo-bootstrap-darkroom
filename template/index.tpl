<!-- Start of index.tpl -->
{combine_script id='core.switchbox' require='jquery' path='themes/default/js/switchbox.js'}
{combine_script id='cookie' require='jquery' path="themes/bootstrapdefault/js/jquery.cookie.js"}
{combine_script id='equalheights' require='jquery' path="themes/bootstrapdefault/js/jquery.equalheights.js"}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">
                {$TITLE}
{if isset($chronology.TITLE)}
                {$LEVEL_SEPARATOR}{$chronology.TITLE}
{/if}
            </div>
        </div>
        <div class="navbar-right navbar-collapse collapse" id="primary-nav">
            <ul class="nav navbar-nav">
{if !empty($image_orders)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-sort"></span><span class="glyphicon-text">{'Sort order'|@translate}</span><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$image_orders item=image_order name=loop}
                        <li{if $image_order.SELECTED} class="active"{/if}><a href="{$image_order.URL}" rel="nofollow">{$image_order.DISPLAY}</a></li>
{/foreach}
                    </ul>
                </li>
{/if}
{if !empty($image_derivatives)}
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-picture"></span><span class="glyphicon-text">{'Photo sizes'|@translate}</span><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
{foreach from=$image_derivatives item=image_derivative name=loop}
                        <li{if $image_derivative.SELECTED} class="active"{/if}><a href="{$image_derivative.URL}" rel="nofollow">{$image_derivative.DISPLAY}</a></li>
{/foreach}
                    </ul>
                </li>
{/if}
{if isset($favorite)}
                <li>
                    <a href="{$favorite.U_FAVORITE}" title="{'Delete all photos from your favorites'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-heart"></span><span class="glyphicon-text">{'Delete all photos from your favorites'|@translate}</span>
                    </a>
                </li>
{/if}
{if isset($U_EDIT)}
                <li>
                    <a href="{$U_EDIT}" title="{'Edit album'|@translate}">
                        <span class="glyphicon glyphicon-pencil"></span><span class="glyphicon-text">{'Edit'|@translate}</span>
                    </a>
                </li>
{/if}
{if isset($U_CADDIE)}
                <li>
                    <a href="{$U_CADDIE}" title="{'Add to caddie'|@translate}">
                        <span class="glyphicon glyphicon-plus-sign"></span><span class="glyphicon-text">{'Caddie'|@translate}</span>
                    </a>
                </li>
{/if}
{if isset($U_SEARCH_RULES)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
                <li>
                    <a href="{$U_SEARCH_RULES}" onclick="bd_popup(this.href); return false;" title="{'Search rules'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-search"></span><span class="glyphicon-text">(?)</span>
                    </a>
                </li>
{/if}
{if isset($U_SLIDESHOW)}
                <li>
                    {strip}<a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-play"></span><span class="glyphicon-text">{'slideshow'|@translate}</span>
                    </a>{/strip}
                </li>
{/if}
{if isset($U_MODE_FLAT)}
                <li>
                    {strip}<a href="{$U_MODE_FLAT}" title="{'display all photos in all sub-albums'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-th-large"></span><span class="glyphicon-text">{'display all photos in all sub-albums'|@translate}</span>
                    </a>{/strip}
                </li>
{/if}
{if isset($U_MODE_NORMAL)}
                <li>
                    {strip}<a href="{$U_MODE_NORMAL}" title="{'return to normal view mode'|@translate}">
                        <span class="glyphicon glyphicon-home"></span><span class="glyphicon-text">{'return to normal view mode'|@translate}</span>
                    </a>{/strip}
                </li>
{/if}
{if isset($U_MODE_POSTED)}
                <!--
                <li>
                    {strip}<a href="{$U_MODE_POSTED}" title="{'display a calendar by posted date'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-calendar"></span><span class="glyphicon-text">{'Calendar'|@translate}</span>
                    </a>{/strip}
                </li>
                -->
{/if}
{if isset($U_MODE_CREATED)}
                <!--
                <li>
                    {strip}<a href="{$U_MODE_CREATED}" title="{'display a calendar by creation date'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-calendar"></span><span class="glyphicon-text">{'Calendar'|@translate}</span>
                    </a>{/strip}
                </li>
                -->
{/if}
{if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
{if (!empty($CATEGORIES) && !isset($GDThumb)) || (!empty($THUMBNAILS) && !isset($GThumb) && !isset($GDThumb)) }
                <li id="btn-grid"{if $smarty.cookies.view != 'list'} class="active"{/if}><a href="#"><span class="glyphicon glyphicon-th"></span></a></li>
                <li id="btn-list"{if $smarty.cookies.view == 'list'} class="active"{/if}><a href="#"><span class="glyphicon glyphicon-th-list"></span></a></li>
{/if}
            </ul>
        </div>
    </div>
</nav>

{include file='infos_errors.tpl'}

<a name="content"></a>
<div class="container">
{if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

<!--
{if isset($chronology_views)}
<div class="calendarViews">{'View'|@translate}:
    <a id="calendarViewSwitchLink" href="#">
        {foreach from=$chronology_views item=view}{if $view.SELECTED}{$view.CONTENT}{/if}{/foreach}
    </a>
    <div id="calendarViewSwitchBox" class="switchBox">
        {foreach from=$chronology_views item=view name=loop}{if !$smarty.foreach.loop.first}<br>{/if}
            <span{if !$view.SELECTED} style="visibility:hidden"{/if}>&#x2714; </span><a href="{$view.VALUE}">{$view.CONTENT}</a>
        {/foreach}
    </div>
    {footer_script}(SwitchBox=window.SwitchBox||[]).push("#calendarViewSwitchLink", "#calendarViewSwitchBox");{/footer_script}
</div>
{/if}

{if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
{/if}
-->

{if !empty($CONTENT_DESCRIPTION)}
    <h4>
        {$CONTENT_DESCRIPTION}
    </h4>
{/if}
    <div id="content" class="row {if $smarty.cookies.view == 'list'}content-list{else}content-grid{/if}">
{if !empty($CONTENT)}
    <!-- Start of content -->
    {$CONTENT}
    <!-- End of content -->
{/if}

{if !empty($CATEGORIES)}
    <!-- Start of categories -->
{$CATEGORIES}
{footer_script}{literal}$(document).ready(function(){$('#content img').load(function(){$('#content .col-inner').equalHeights()})});{/literal}{/footer_script}
    <!-- End of categories -->
{/if}

{if !empty($THUMBNAILS)}
        <!-- Start of thumbnails -->
        <div id="thumbnails">{$THUMBNAILS}</div>
{footer_script}{literal}$(document).ready(function(){$('#content img').load(function(){$('#content .col-inner').equalHeights()})});{/literal}{/footer_script}
        <!-- End of thumbnails -->
{/if}
    </div>
</div>
{if !empty($cats_navbar) || !empty($thumb_navbar)}
<div class="container">
{if !empty($cats_navbar)}
    {include file='navigation_bar.tpl' fragment="content"|@get_extent:'navbar' navbar=$cats_navbar}
{/if}
{if !empty($thumb_navbar) && !isset($rv_tscroller_enabled)}
    {include file='navigation_bar.tpl' fragment="content"|@get_extent:'navbar' navbar=$thumb_navbar}
{/if}
</div>
{/if}

{if !empty($category_search_results)}
<div class="container">
    <h3 class="category_search_results">{'Album results for'|@translate} <em><strong>{$QUERY_SEARCH}</strong></em></h3>
    <p>
        <em><strong>
{foreach from=$category_search_results item=res name=res_loop}
{if !$smarty.foreach.res_loop.first} &mdash; {/if}
            {$res}
{/foreach}
        </strong></em>
    </p>
</div>
{/if}

{if !empty($tag_search_results)}
<div class="container">
    <h3 class="tag_search_results">{'Tag results for'|@translate} <em><strong>{$QUERY_SEARCH}</strong></em></h3>
    <p>
        <em><strong>
{foreach from=$tag_search_results item=tag name=res_loop}
{if !$smarty.foreach.res_loop.first} &mdash; {/if}
            <a href="{$tag.URL}">{$tag.name}</a>
{/foreach}
        </strong></em>
    </p>
</div>
{/if}

<div class="container">
{if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>

{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
<!-- End of index.tpl -->
