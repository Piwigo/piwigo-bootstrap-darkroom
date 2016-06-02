{if $theme_config_extra->bootswatch}
{footer_script require='jquery'}
var nav_bg = $('.navbar').css('background-color');
$('.navmenu').css('background-color', nav_bg);
{/footer_script}
{/if}

<div id="picture-nav" class="navmenu navmenu-default navmenu-fixed-right offcanvas" role="navigation">
    {include file='picture_nav_ul.tpl' usefor='navmenu'}
</div>
<div class="canvas">
    <nav class="navbar navbar-default navbar-fixed-top navbar-secondary">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#picture-nav" data-recalc="false" data-canvas=".canvas">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-brand">{$SECTION_TITLE}{$LEVEL_SEPARATOR}<a href>{$current.TITLE}</a> [{$PHOTO}]</div>
{footer_script require='jquery'}{strip}
$(document).ready(function() {
if (!navigator.userAgent.match(/rv:11/)) {
 var $nrLevels = $('.navbar-secondary .navbar-brand a').length,
     $html;
 while ($nrLevels > 2) {
   $('.navbar-secondary .navbar-brand a')[0].remove();
   $nrLevels = $('.navbar-secondary .navbar-brand a').length;
   $html = $('.navbar-secondary .navbar-brand').html().replace(/^ \/ /, "");
   if ($nrLevels === 2) {
      $('.navbar-secondary .navbar-brand').html('<a href="{$U_HOME}" title="{'Home'|@translate}"><span class="glyphicon glyphicon-home"></span><span class="glyphicon-text">{'Home'|@translate}</span></a>{$LEVEL_SEPARATOR}' + $html);
   } else {
      $('.navbar-secondary .navbar-brand').html($html);
   }
 }
}
});
{/strip}{/footer_script}
            </div>
            <div class="navbar-right navbar-collapse collapse">
                {include file='picture_nav_ul.tpl' usefor='navbar'}
            </div>
        </div>
    </nav>
</div>
