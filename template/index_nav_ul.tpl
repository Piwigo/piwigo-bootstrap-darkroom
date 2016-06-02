{footer_script require='jquery'}
$(document).ready(function() {
  $('ul.navmenu-nav').find('.dropdown-menu').addClass('dropdown-menu-right');
  $('ul.navmenu-nav').find('.dropdown-toggle').attr('aria-haspopup', 'true');
});
{/footer_script}
    <ul class="nav {$usefor}-nav">
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
                    {strip}<a href="{$U_SLIDESHOW}#start-slideshow" id="startSlideshow" title="{'slideshow'|@translate}" rel="nofollow">
                        <span class="glyphicon glyphicon-play"></span><span class="glyphicon-text">{'slideshow'|@translate}</span>
                    </a>{/strip}
                </li>
{if $theme_config_extra->photoswipe}
{* remove ?slideshow handler here *}
{footer_script require="jquery"}
$('#startSlideshow')[0].search = "";
{/footer_script}
{/if}
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
{if ((!empty($CATEGORIES) && !isset($GDThumb)) || (!empty($THUMBNAILS) && !isset($GThumb) && !isset($GDThumb))) && ($theme_config_extra->category_wells == 'never' || ($theme_config_extra->category_wells == 'mobile_only' && get_device() == 'desktop'))}
                <li id="btn-grid"{if $smarty.cookies.view != 'list'} class="active"{/if}><a href="#"><span class="glyphicon glyphicon-th"></span></a></li>
                <li id="btn-list"{if $smarty.cookies.view == 'list'} class="active"{/if}><a href="#"><span class="glyphicon glyphicon-th-list"></span></a></li>
{/if}
