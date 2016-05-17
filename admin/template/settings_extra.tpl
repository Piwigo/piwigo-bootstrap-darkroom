{combine_css path="themes/bootstrap_darkroom/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>{'Bootstrap Darkroom'|@translate} {$TABSHEET_TITLE}</h2>
</div>
<form method="post" class="properties">
    <input type="hidden" name="boostrap_darkroom_settings" value="true" />
    <div id="configContent">
        <fieldset class="mainConf">
            <legend>{'Theme colors'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="bootswatch"{if $theme_config_extra->bootswatch} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">Use a Bootswatch Theme. This overrides Darkroom's default colors with a theme from <a href="https://bootswatch.com/">https://bootswatch.com</a>!</span>
                </li>
            </ul>
            <label id="bootswatch_theme_label" labelfor="bootswatch_theme">Bootswatch theme</label>
            <select id="bootswatch_theme" name="bootswatch_theme"></select>
{footer_script require="jquery"}
var select = $("#bootswatch_theme");
var label = $("#bootswatch_theme_label");
var cur_theme = '{$theme_config_extra->bootswatch_theme}';
function getBootswatchThemes() {
    $.getJSON("https://bootswatch.com/api/3.json", function (data) {
      var themes = data.themes;
      select.show();
      label.show();

      themes.forEach(function(value, index){
        $name = value.name;
        $lname = $name.toLowerCase();
        select.append($("<option />")
              .val($lname)
              .text($name));

        if ($lname === cur_theme) {
           $('option[value=' + $lname + ']').attr('selected', 'selected');
        }
      });

    }, "json").fail(function(){
        $(".alert").toggleClass("alert-info alert-danger");
        $(".alert h4").text("Failed to load available Bootswatch Themes!");
    });
}

$(document).ready(function() {
  if ($('input[name=bootswatch]').is(':checked')) {
    getBootswatchThemes();
  }
});

$('input[name=bootswatch]').change(function() {
  if ($('input[name=bootswatch]').is(':checked')) {
    getBootswatchThemes();
  } else {
    select.empty();
    select.hide();
    label.hide();
  }   
});
{/footer_script}
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Slick carousel settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_enabled"{if $theme_config_extra->slick_enabled} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">Enable the slick carousel on the picture page.</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label labelfor="slick_lazyload">lazyLoad method</label>
                    <select name="slick_lazyload">
                        <option value="ondemand"{if $theme_config_extra->slick_lazyload == 'ondemand'} selected="selected"{/if}>ondemand</option>
                        <option value="progressive"{if $theme_config_extra->slick_lazyload == 'progressive'} selected="selected"{/if}>progressive</option>
                    </select>
                    <span class="info">"ondemand" will load the image as soon as you slide to it. "progressive" loads all images one after another when the page loads (use carefully!).</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_infinite"{if $theme_config_extra->slick_infinite} checked="checked"{/if}>
                        Infinite looping
                    </label>
                    <span class="info">Infinitely scroll through images in an album</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_centered"{if $theme_config_extra->slick_centered} checked="checked"{/if}>
                        Center mode 
                    </label>
                    <span class="info">Display the currently selected image in the middle. Works best with infinite looping enabled.</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'PhotoSwipe settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="photoswipe"{if $theme_config_extra->photoswipe} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">Enable PhotoSwipe fullscreen slideshow. Disable if you prefer to use Plugins like Fotorama or Piwigo's default slideshow.</span>
                </li>
                <li>
                    <label labelfor="photoswipe_interval">Autoplay interval</label>
                    <input type="number" name="photoswipe_interval" value="{$theme_config_extra->photoswipe_interval}" min="1000" max="50000"> milliseconds
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Show the jumbotron'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="show_jumbotron"{if $theme_config_extra->show_jumbotron} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">Show a jumbotron banner on the categroy pages. It is still disabled on mobile devices.</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Picture information'|@translate}</legend>
            <ul>
                <li>
                    <select name="picture_info">
                        <option value="tabs"{if $theme_config_extra->picture_info == 'tabs'} selected="selected"{/if}>Tabs below the image</option>
                        <option value="sidebar"{if $theme_config_extra->picture_info == 'sidebar'} selected="selected"{/if}>Sidebar (like Boostrap Default)</option>
                        <option value="notatall"{if $theme_config_extra->picture_info == 'notatall'} selected="selected"{/if}>Not at all</option>
                    </select>
                    <span class="info">Choose display type for the picture infos on the picture page.</span>
                </li>
            </ul>
            <p>Note: on mobile devices, the Tabs are forced as the Sidebar button would overlay the main picture.</p>
        </fieldset>
    </div>
    <p class="formButtons">
        <input type="submit" name="submit" value="Save settings">
    </p>
</form>
