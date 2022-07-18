{if !$current.selected_derivative->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
    {footer_script}var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png"{/footer_script}
{/if}
{if preg_match("/(mp4|m4v)$/", $current.path)}
{if $current.height < $current.width}
<div id="video-modal" class="col-lg-8 col-md-10 col-sm-12 mx-auto">
{if $current.height / $current.width * 100 < 60}
  <div class="embed-responsive embed-responsive-16by9">
{else}
  <div class="embed-responsive embed-responsive-custom" style="padding-bottom:{$current.height / $current.width * 100}%">
{/if}
{else}
<div id="video-modal" class="col-lg-3 col-md-5 col-sm-6 col-xs-8 mx-auto">
  <div class="embed-responsive embed-responsive-9by16">
{/if}
    <video id="video" class="embed-responsive-item" width="100%" height="auto" controls preload="auto" poster="{$current.selected_derivative->get_url()}">
      <source src="{$ROOT_URL}{$current.path}" type="video/mp4"></source>
    </video>
  </div>
</div>
{else}
<img class="{if isset($current.path_ext)}path-ext-{$current.path_ext}{/if} {if isset($current.file_ext)}file-ext-{$current.file_ext}{/if}" {if $current.selected_derivative->is_cached()}src="{$current.selected_derivative->get_url()}" {$current.selected_derivative->get_size_htm()}{else}src="{$ROOT_URL}themes/bootstrap_darkroom/img/transparent.png" data-src="{$current.selected_derivative->get_url()}"{/if} alt="{$ALT_IMG}" id="theMainImage" usemap="#map{$current.selected_derivative->get_type()}" title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE_ESC} - {$ALT_IMG}{/if}">

{foreach from=$current.unique_derivatives item=derivative key=derivative_type}{strip}
    <map name="map{$derivative->get_type()}">
        {assign var='size' value=$derivative->get_size()}
        {if isset($previous)}
            <area shape=rect coords="0,0,{($size[0]/4)|@intval},{$size[1]}" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE_ESC}" alt="{$previous.TITLE_ESC}">
        {/if}
        <area shape=rect coords="{($size[0]/4)|@intval},0,{($size[0]/1.34)|@intval},{($size[1]/4)|@intval}" href="{$U_UP}" title="{'Thumbnails'|@translate}" alt="{'Thumbnails'|@translate}">
        {if isset($next)}
            <area shape=rect coords="{($size[0]/1.33)|@intval},0,{$size[0]},{$size[1]}" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE_ESC}" alt="{$next.TITLE_ESC}">
        {/if}
    </map>
{/strip}{/foreach}
{/if}
