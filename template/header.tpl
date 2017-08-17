<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={$CONTENT_ENCODING}">
    <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
{if $meta_ref_enabled}
{if isset($INFO_AUTHOR)}
    <meta name="author" content="{$INFO_AUTHOR|@strip_tags:false|@replace:'"':' '}">
{/if}
{if isset($related_tags)}
    <meta name="keywords" content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
{/if}
{if isset($COMMENT_IMG)}
    <meta name="description" content="{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{else}
    <meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{/if}
{/if}

    <title>{if $PAGE_TITLE!=l10n('Home') && $PAGE_TITLE!=$GALLERY_TITLE}{$PAGE_TITLE} | {/if}{$GALLERY_TITLE}</title>
    <link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">
    <link rel="icon" sizes="192x192" href="{$ROOT_URL}themes/bootstrapdefault/img/logo.png">
    <link rel="apple-touch-icon" sizes="192x192" href="{$ROOT_URL}themes/bootstrapdefault/img/logo.png">
    <link rel="start" title="{'Home'|@translate}" href="{$U_HOME}" >
    <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php">
{if isset($first.U_IMG)}
    <link rel="first" title="{'First'|@translate}" href="{$first.U_IMG}">
{/if}
{if isset($previous.U_IMG)}
    <link rel="prev" title="{'Previous'|@translate}" href="{$previous.U_IMG}">
{/if}
{if isset($next.U_IMG)}
    <link rel="next" title="{'Next'|@translate}" href="{$next.U_IMG}">
{/if}
{if isset($last.U_IMG)}
    <link rel="last" title="{'Last'|@translate}" href="{$last.U_IMG}">
{/if}
{if isset($U_UP)}
    <link rel="up" title="{'Thumbnails'|@translate}" href="{$U_UP}">
{/if}
{if isset($U_PREFETCH)}
    <link rel="prefetch" href="{$U_PREFETCH}">
{/if}
{if isset($U_CANONICAL)}
    <link rel="canonical" href="{$U_CANONICAL}">
{/if}
{if not empty($page_refresh)}
    <meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">
{/if}

{strip}
{if $theme_config_extra->bootstrap_theme == 'bootswatch'}
    {combine_css path="themes/bootstrap_darkroom/components/bootswatch/{$theme_config_extra->bootswatch_theme}/bootstrap.min.css" order=-20}
    {combine_css path="themes/bootstrap_darkroom/css/bootswatch/navmenu-{$theme_config_extra->bootswatch_theme}.css" order=-5}
{else}
    {combine_css path="themes/bootstrapdefault/bootstrap/dist/css/bootstrap.min.css" order=-20}
{/if}
{if $theme_config_extra->bootstrap_theme == 'default'}
    {combine_css path="themes/bootstrapdefault/bootstrap/dist/css/bootstrap-theme.min.css" order=-18}
{/if}
    {combine_css path='themes/bootstrap_darkroom/components/jasny-bootstrap/dist/css/jasny-bootstrap.min.css' order=-15}
    {combine_css path='themes/bootstrap_darkroom/components/font-awesome/css/font-awesome.min.css' order=-14}
{foreach from=$themes item=theme}
{if $theme.load_css}
    {combine_css path="themes/`$theme.id`/theme.css" order=-10}
{/if}
{if !empty($theme.local_head)}{include file=$theme.local_head load_css=$theme.load_css}{/if}
{/foreach}
{if $theme_config_extra->bootstrap_theme == 'darkroom'}
    {combine_css path="themes/bootstrap_darkroom/css/darkroom-colors.css" order=-5}
{/if}
{if $theme_config_extra->bootstrap_theme == 'material'}
    {combine_css path="themes/bootstrap_darkroom/components/roboto/roboto.css" order=-6}
{if $theme_config_extra->material_color == 'teal'}
    {combine_css path="themes/bootstrap_darkroom/components/bootstrap-material-design/dist/css/bootstrap-material-design.min.css" order=-5}
    {combine_css path="themes/bootstrap_darkroom/components/bootstrap-material-design/dist/css/ripples.min.css" order=-4}
    {combine_css path="themes/bootstrap_darkroom/css/material-colors/teal/navmenu.css" order=-3}
{else}
    {combine_css path="themes/bootstrap_darkroom/css/material-colors/{$theme_config_extra->material_color}/bootstrap-material-design.min.css" order=-5}
    {combine_css path="themes/bootstrap_darkroom/css/material-colors/{$theme_config_extra->material_color}/ripples.min.css" order=-5}
    {combine_css path="themes/bootstrap_darkroom/css/material-colors/{$theme_config_extra->material_color}/navmenu.css" order=-5}
{/if}
{/if}
    {combine_css path="themes/bootstrap_darkroom/css/fixplugins.css" order=9999}
{if file_exists("local/bootstrapdefault/custom.css")}
    {combine_css path="local/bootstrapdefault/custom.css" order=10000}
{/if}
{get_combined_css}
{if $BODY_ID == 'theAdditionalPage' || $BODY_ID == 'theHomePage' || $bootstrap_darkroom_core_js_in_header == true }
{assign var=loc value="header"}
{else}
{assign var=loc value="footer"} 
{/if}
{combine_script id='jquery' path='themes/bootstrap_darkroom/components/jquery/dist/jquery.min.js' load=$loc}
{combine_script id='jquery.ajaxmanager' require='jquery' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' require='jquery.ajaxmanager' path='themes/default/js/thumbnails.loader.js' load='footer'}
{combine_script id='darkroom.common' require='jquery' path='themes/bootstrap_darkroom/js/common.js' load='footer'}
{combine_script id='bootstrap' require='jquery' path='themes/bootstrapdefault/bootstrap/dist/js/bootstrap.min.js' load=$loc}
{combine_script id='jasny.boostrap' require='bootstrap' path='themes/bootstrap_darkroom/components/jasny-bootstrap/dist/js/jasny-bootstrap.min.js' load='footer'}
{combine_script id=$themeconf.name require='bootstrap' path='themes/bootstrapdefault/js/theme.js' load='footer'}
{if $theme_config_extra->bootstrap_theme == 'material'}
    {combine_script id='material.js' require='bootstrap' path='themes/bootstrap_darkroom/components/bootstrap-material-design/dist/js/material.min.js' load='footer'}
    {combine_script id='ripples.js' require='material.js' path='themes/bootstrap_darkroom/components/bootstrap-material-design/dist/js/ripples.min.js' load='footer'}
    {footer_script require='material.js' require='ripples.js'}
        $.material.init()
    {/footer_script}
{/if}
{/strip}
{get_combined_scripts load='header'}
{if not empty($head_elements)}
    {foreach from=$head_elements item=elt}{$elt}
    {/foreach}
{/if}
</head>

<body id="{$BODY_ID}">
    <div id="the_page">
{if $BODY_ID != 'thePicturePage'}
        <!-- Bootstrap navbar, moved to the header as variables are missing in menubar.tpl, actual menus remain in menubar.tpl -->
        <nav class="navbar navbar-default navbar-main" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menubar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
{if $theme_config_extra->logo_image_enabled && $theme_config_extra->logo_image_path !== ''}
                    <a class="navbar-brand" href="{$U_HOME}"><img class="responsive" src="{$ROOT_URL}{$theme_config_extra->logo_image_path}" alt="{$GALLERY_TITLE}"/></a>
{else}
                    <a class="navbar-brand" href="{$U_HOME}">{$GALLERY_TITLE}</a>
{/if}
                </div>
                <div class="collapse navbar-collapse navbar-right" id="navbar-menubar">
{if $theme_config_extra->quicksearch_navbar}
                <form class="navbar-form" role="search" action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch" onsubmit="return this.q.value!='' && this.q.value!=qsearch_prompt;">
                    <div class="form-group">
                        <input type="text" name="q" id="qsearchInput" class="form-control" placeholder="{'Search'|@translate}" />
                    </div>
                </form>
{/if}
{$MENUBAR}
                </div>
            </div>
        </nav>
{/if}

{if !isset($slideshow) && $BODY_ID != 'thePicturePage' && $theme_config_extra->show_jumbotron}
        <div class="jumbotron">
            <div class="container">
                <div id="theHeader">{$PAGE_BANNER}</div>
            </div>
        </div>
{/if}

{if not empty($header_msgs)}
{foreach from=$header_msgs item=msg}
{/foreach}
{/if}

{if not empty($header_notes)}
{foreach from=$header_notes item=note}
{/foreach}
{/if}

{include file='_plugin_fixes_js.tpl'}
<!-- End of header.tpl -->
