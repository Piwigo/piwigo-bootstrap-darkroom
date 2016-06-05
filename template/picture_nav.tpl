{footer_script require='jquery'}
{literal}
if ($('.jumbotron').length > 0) {
    var $affix_height = $('.navbar-main').height() + $('.jumbotron').outerHeight();
    $('.navbar-secondary').affix({ offset: {top: $affix_height } });
    $('.navmenu').css('top', $affix_height);
} else {
    $('.navbar-secondary').affix({ offset: {top: 50} });
}
{/literal}
$('.navmenu').on('show.bs.offcanvas', function() {
    if ($('ul.navmenu-nav').contents().length === 0) {
        console.log($('ul.navbar-nav').contents());
        $($('ul.navbar-nav').contents()).appendTo('ul.navmenu-nav');
        $('ul.navmenu-nav').find('.dropdown-menu').addClass('dropdown-menu-right');
        $('ul.navmenu-nav').find('.dropdown-toggle').attr('aria-haspopup', 'true');
    }
{if $theme_config_extra->bootswatch}
    $('.navmenu').css('background-color', $('.navbar-default').css('background-color'));
{/if}
});
$('.navmenu').on('hidden.bs.offcanvas', function() {
    if ($('ul.navmenu-nav').contents().length > 0) {
        $($('ul.navmenu-nav').contents()).appendTo('ul.navbar-nav');
        $('ul.navmenu-nav').find('.dropdown-menu-right').removeClass('dropdown-menu-right');
        $('ul.navmenu-nav').find('.dropdown-toggle').attr('aria-haspopup', '');
    }
});
{/footer_script}
<div id="picture-nav" class="navmenu navmenu-default navmenu-fixed-right offcanvas" role="navigation">
    <ul class="nav navmenu-nav"></ul>
</div>
    <nav class="navbar navbar-default navbar-fixed-top navbar-secondary">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#picture-nav">
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
{if $theme_config_extra->bootswatch}
        $('.navbar-default .navbar-brand a').css('color', $('.navbar-default .navbar-brand').css('color'));
{/if}
});
{/strip}{/footer_script}
            </div>
            <div class="navbar-right navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    {include file='picture_nav_ul.tpl' usefor='navbar'}
                </ul>
            </div>
        </div>
    </nav>
