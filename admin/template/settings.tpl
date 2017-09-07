{combine_css path="themes/bootstrap_darkroom/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>Bootstrap Darkroom {$TABSHEET_TITLE}</h2>
</div>

<ul class="tabs">
  <li class="tab-link current" data-tab="appearance">{'Appearance'|@translate}</li>
  <li class="tab-link" data-tab="components">{'Components'|@translate}</li>
</ul>
  

<form method="post" class="properties">
    <input type="hidden" name="boostrap_darkroom_settings" value="true" />
    <div id="configContent">
      <div id="appearance" class="tab-content current">
        <fieldset class="mainConf">
            <legend>{'Bootstrap theme'|@translate}</legend>
            <ul>
                <li>
                    <label labelfor="bootstrap_theme">{'Color theme'|@translate}</label>
                    <select name="bootstrap_theme">
                        <option value="darkroom"{if $theme_config->bootstrap_theme == 'darkroom'} selected="selected"{/if}>Darkroom</option>
                        <option value="bootswatch"{if $theme_config->bootstrap_theme == 'bootswatch'} selected="selected"{/if}>Bootswatch</option>
                        <option value="material"{if $theme_config->bootstrap_theme == 'material'} selected="selected"{/if}>Material</option>
                        <option value="none"{if $theme_config->bootstrap_theme == 'none'} selected="selected"{/if}>{'None'|@translate}</option>
                    </select>
                </li>
            <ul>
            <label id="bootswatch_theme_label" labelfor="bootswatch_theme">{'Bootswatch theme'|@translate}</label>
            <select id="bootswatch_theme" name="bootswatch_theme"></select>
            <label id="material_color_label" labelfor="material_color">{'Material color'|@translate}</label>
            <select id="material_color" name="material_color"></select>
            <div id="theme_preview"></div>
            <dl id="boostrap_theme_descr" class="dl-horizontal">
                <dt>Darkroom</dt><dd>{'Bootstrap Darkroom\'s custom dark color theme'|@translate}</dd>
                <dt>Bootswatch</dt><dd>{'A color theme from'|@translate} <a href="https://bootswatch.com">https://bootswatch.com</a></dd>
                <dt>Material</dt><dd>Material design {'from'|@translate} <a href="http://fezvrasta.github.io/bootstrap-material-design">http://fezvrasta.github.io/bootstrap-material-design</a></dd>
                <dt>{'None'|@translate}</dt><dd>{'No color theme'|@translate}</dd> 
            </dl>
        </fieldset>
      </div>
      <div id="components" class="tab-content">
        <fieldset class="mainConf">
            <legend>Slick Carousel {'Settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_enabled"{if $theme_config->slick_enabled} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">{'Enable the slick carousel below the main image on the picture page'|@translate}.</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label labelfor="slick_lazyload">{'lazyLoad method'|@translate}</label>
                    <select name="slick_lazyload">
                        <option value="ondemand"{if $theme_config->slick_lazyload == 'ondemand'} selected="selected"{/if}>ondemand</option>
                        <option value="progressive"{if $theme_config->slick_lazyload == 'progressive'} selected="selected"{/if}>progressive</option>
                    </select>
                    <span class="info"><em>ondemand</em> {'will load the image as soon as you slide to it'|@translate}. <em>progressive</em> {'loads all images one after another when the page loads (use carefully!)'|@translate}.</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_infinite"{if $theme_config->slick_infinite} checked="checked"{/if}>
                        {'Infinite looping'|@translate}
                    </label>
                    <span class="info">{'Endlessly scroll through album images'|@translate}</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_centered"{if $theme_config->slick_centered} checked="checked"{/if}>
                        {'Center mode'|@translate}
                    </label>
                    <span class="info">{'Display the currently selected image in the middle. Works best with infinite looping enabled.'|@translate}</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>PhotoSwipe {'Settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="photoswipe"{if $theme_config->photoswipe} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">{'Enable PhotoSwipe fullscreen slideshow. Disable if you prefer to use Plugins like Fotorama or Piwigo\'s default slideshow.'|@translate}</span>
                </li>
                <li>
                    <label labelfor="photoswipe_interval">{'Autoplay interval'|@translate}</label>
                    <input type="number" name="photoswipe_interval" value="{$theme_config->photoswipe_interval}" min="1000" max="50000"> {'milliseconds'|@translate}
                </li>
                <li>
                    <label class="font-checkbox">
                       <span class="icon-check"></span>
                       <input type="checkbox" name="photoswipe_metadata"{if $theme_config->photoswipe_metadata} checked="checked"{/if}>
                       {'Show basic EXIF metadata'|@translate}
                    </label>
                    <span class="info">{'For more information on metadata visit'|@translate} <a href="https://github.com/tkuther/piwigo-bootstrap-darkroom/wiki/EXIF-Metadata-in-PhotoSwipe">Wiki:EXIF-Metadata-in-PhotoSwipe</a></span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>Jumbotron {'Settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="show_jumbotron"{if $theme_config->show_jumbotron} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">{'Show a jumbotron banner on the categroy pages.'|@translate}</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Site logo'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="logo_image_enabled"{if $theme_config->logo_image_enabled} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">{'Display a site logo image instead of plain text'|@translate}</span>
                </li>
                <li>
                    <label>
                        {'Path'|@translate}
                        <input type="text" name="logo_image_path"size="50" {if $theme_config->logo_image_path != ""}value="{$theme_config->logo_image_path}"{else}placeholder="relative/path/to/image"{/if}>
                    </label>
                    <span class="info">{'The path to the image, relative to your Piwigo installation folder'|@translate}</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Quick search'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="quicksearch_navbar"{if $theme_config->quicksearch_navbar} checked="checked"{/if}>
                        {'Quick search'|@translate} {'directly in the navigation bar'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Picture page display'|@translate}</legend>
            <ul>
                <li>
                    <label labelfor="picture_info">{'Picture info display position'|@translate}</label>
                    <select name="picture_info">
                        <option value="tabs"{if $theme_config->picture_info == 'tabs'} selected="selected"{/if}>{'Tabs below the image'|@translate}</option>
                        <option value="sidebar"{if $theme_config->picture_info == 'sidebar'} selected="selected"{/if}>{'Sidebar (like Boostrap Default)'|@translate}</option>
                        <option value="disabled"{if $theme_config->picture_info == 'disabled'} selected="selected"{/if}>{'Disabled'|@translate}</option>
                    </select>
                    <span class="info">{'Note: on mobile devices the Tabs are forced, because the Sidebar button would overlay the main picture.'|@translate}</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Category page display'|@translate}</legend>
            <ul>
                <li>
                    <label labelfor="category_wells">{'Display categories as Bootstrap media wells'|@translate}</label>
                    <select name="category_wells">
                        <option value="never"{if $theme_config->category_wells == 'never'} selected="selected"{/if}>{'Never'|@translate}</option>
                        <option value="always"{if $theme_config->category_wells == 'always'} selected="selected"{/if}>{'Always'|@translate}</option>
                        <option value="mobile_only"{if $theme_config->category_wells == 'mobile_only'} selected="selected"{/if}>{'On mobile devices only'|@translate}</option>
                    </select>
                    <span class="info">{'This will display categories as media wells with squared thumbnails, similar to the smartpocket mobile theme.'|@translate}</span>
                </li>
                <li>
                    <label class="font-checkbox">
                       <span class="icon-check"></span>
                       <input type="checkbox" name="cat_descriptions"{if $theme_config->cat_descriptions} checked=checked{/if}>
                       {'Display category description in grid view'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Thumbnail page display'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="thumbnail_caption"{if $theme_config->thumbnail_caption} checked="checked"{/if}>
                        {'Show image caption'|@translate}
                    </label>
                </li>
                <li>
                    <label labelfor="thumbnail_linkto">{'Link thumbnail to'|@translate}</label>
                    <select name="thumbnail_linkto">
                        <option value="picture"{if $theme_config->thumbnail_linkto == 'picture'} selected="selected"{/if}>{'Picture details page'|@translate}</option>
                        <option value="photoswipe"{if $theme_config->thumbnail_linkto == 'photoswipe'} selected="selected"{/if}>{'PhotoSwipe Slideshow'|@translate}</option>
                        <option value="photoswipe_mobile_only"{if $theme_config->thumbnail_linkto == 'photoswipe_mobile_only'} selected="selected"{/if}>{'Photoswipe Slideshow (Mobile devices only)'|@translate}</option>
                    </select>
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Social integration'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_enabled"{if $theme_config->social_enabled} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                </li>
                <li id="social_twitter">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_twitter"{if $theme_config->social_twitter}  checked="checked"{/if}>
                        {'Twitter'|@translate}
                    </label>
                </li>
                <li id="social_facebook">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_facebook"{if $theme_config->social_facebook}  checked="checked"{/if}>
                        {'Facebook'|@translate}
                    </label>
                </li>
                <li id="social_google_plus">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_google_plus"{if $theme_config->social_google_plus}  checked="checked"{/if}>
                        {'Google+'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Comments'|@translate}</legend>
            <ul>
                <li>
                    <label class="radio">
                        <input type="radio" name="comments_type" value="piwigo"{if $theme_config->comments_type == 'piwigo'} checked="checked"{/if} />
                        {'Piwigo'|@translate}
                    </label>
                    <label class="radio">
                        <input id="comments_radio_disqus" type="radio" name="comments_type" value="disqus"{if $theme_config->comments_type == 'disqus'} checked="checked"{/if} />
                        {'Disqus'|@translate}
                    </label>
                </li>
                <li id="comments_type_disqus">
                    <label for="comments_disqus_shortname">{'Disqus shortname'|@translate}</label><br />
                    <input id="comments_disqus_shortname" name="comments_disqus_shortname" type="text" value="{$theme_config->comments_disqus_shortname}" size="50" />
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Tag cloud'|@translate}</legend>
            <ul>
                <li>
                    <label class="radio">
                        <input type="radio" name="tag_cloud_type" value="basic"{if $theme_config->tag_cloud_type == 'basic'} checked="checked"{/if} />
                        {'Basic'|@translate}
                    </label>
                    <label class="radio">
                        <input type="radio" name="tag_cloud_type" value="html5"{if $theme_config->tag_cloud_type == 'html5'} checked="checked"{/if} />
                        {'HTML 5 canvas'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Custom CSS'|@translate}</legend>
            <textarea name="custom_css" cols="80" rows="10">{if $theme_config->custom_css}{$theme_config->custom_css}{/if}</textarea>
        </fieldset>
      </div>
    </div>
    <p class="formButtons">
        <input type="submit" name="submit" value="{'Save Settings'|@translate}">
    </p>
</form>
{footer_script require="jquery"}
(function(){
    var targets = {                                                                                                                                                                            
        'input[name="social_enabled"]': ['#social_twitter', '#social_facebook', '#social_google_plus'],
        '#comments_radio_disqus': ['#comments_type_disqus'],
    };
                                                                                                                                                                                               
    for (selector in targets) {
        for (target of targets[selector]) {
            jQuery(target).toggle(jQuery(selector).is(':checked'));                                                                                                                            
                                                                                                                                                                                                   
            (function(target){                                                                                                                                                                 
                jQuery(selector).on('change', function() {                                                                                                                                     
                    jQuery(target).toggle($(this).is(':checked'));                                                                                                                             
                });
            })(target);                                                                                                                                                                        
        }                                                                                                                                                                                      
    };                                                                                                                                                                                         
}());

$(document).ready(function(){
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');

    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
})


var select_bootswatch = $("#bootswatch_theme");
var label_bootswatch = $("#bootswatch_theme_label");
var select_material = $("#material_color");
var label_material = $("#material_color_label");
var preview = $("#theme_preview");
var cur_theme = '{$theme_config->bootswatch_theme}';
function getBootswatchThemes() {
    $.getJSON("https://bootswatch.com/api/3.json", function (data) {
      var themes = data.themes;
      select_bootswatch.show();
      label_bootswatch.show();

      themes.forEach(function(value, index){
        $name = value.name;
        $lname = $name.toLowerCase();
        select_bootswatch.append($("<option />")
              .val($lname)
              .text($name));

        if ($lname === cur_theme) {
           $('option[value=' + $lname + ']').attr('selected', 'selected');
        }
      });
      preview.html('<img src="themes/bootstrap_darkroom/components/bootswatch/' + select_bootswatch.val() + '/thumbnail.png" width="50%" style="padding: 10px 0;"/>');
      preview.show();

    }, "json").fail(function(){
        $(".alert").toggleClass("alert-info alert-danger");
        $(".alert h4").text("Failed to load available Bootswatch Themes!");
    });

}

function getMaterialColors() {
  var colors = ['red', 'pink', 'purple', 'deep-purple', 'indigo', 'light-blue', 'cyan', 'teal', 'light-green', 'lime', 'yellow', 'amber', 'orange', 'deep-orange', 'brown', 'grey', 'blue-grey'];
  var lcolor = colors.length;
  var cur_color = '{$theme_config->material_color}';
  select_material.show();
  label_material.show();
  
  for (var i = 0; i < lcolor; i++) {
    select_material.append($("<option />")
          .val(colors[i])
          .text(colors[i]));

    if (colors[i] === cur_color) {
      $('option[value=' + colors[i] + ']').attr('selected', 'selected');
    }
  }

  preview.html('<img src="themes/bootstrap_darkroom/admin/img/material-' + select_material.val() + '.png" style="padding: 10px 0;"/>');
  preview.show();
}

$(document).ready(function() {
  if ($('select[name=bootstrap_theme]').val() === 'bootswatch') {
    getBootswatchThemes();
  } else if ($('select[name=bootstrap_theme]').val() === 'material') {
    getMaterialColors();
  } else {
    preview.html('<img src="themes/bootstrap_darkroom/admin/img/' + $('select[name=bootstrap_theme]').val() + '.png" style="padding: 10px 0;"/>');
    preview.show();
  }
 
  link_target = $('select[name=thumbnail_linkto]').val();
  if (!$('input[name=photoswipe]').is(':checked') && link_target !== 'photoswipe') {
    $('select[name=thumbnail_linkto]').val('picture');
    $('select[name=thumbnail_linkto] option[value=photoswipe]').attr('disabled', 'disabled');
    $('select[name=thumbnail_linkto] option[value=photoswipe_mobile_only]').attr('disabled', 'disabled');
  }

});

$('select[name=bootstrap_theme]').change(function() {
  if ($('select[name=bootstrap_theme]').val() === 'bootswatch') {
    getBootswatchThemes();
    select_material.empty();
    select_material.hide();
    label_material.hide();
  } else {
    select_bootswatch.empty();
    select_bootswatch.hide();
    label_bootswatch.hide();
    preview.hide();
    if ($('select[name=bootstrap_theme]').val() === 'material') {
      getMaterialColors();
    } else {
      select_material.empty();
      select_material.hide();
      label_material.hide();
      preview.html('<img src="themes/bootstrap_darkroom/admin/img/' + $('select[name=bootstrap_theme]').val() + '.png" style="padding: 10px 0;"/>');
      preview.show();
    }
  }
});
$(select_bootswatch).change(function() {
    preview.html('<img src="themes/bootstrap_darkroom/components/bootswatch/' + select_bootswatch.val() + '/thumbnail.png" width="50%" style="padding: 10px 0;"/>');
});
$(select_material).change(function() {
    preview.html('<img src="themes/bootstrap_darkroom/admin/img/material-' + select_material.val() + '.png" style="padding: 10px 0;"/>');
});

$('input[name=photoswipe]').change(function() {
  curr = $('select[name=thumbnail_linkto]').val();
  if (!$(this).is(':checked') && curr !== 'picture') {
    $('select[name=thumbnail_linkto]').val('picture');
    $('select[name=thumbnail_linkto] option[value=photoswipe]').attr('disabled', 'disabled');
    $('select[name=thumbnail_linkto] option[value=photoswipe_mobile_only]').attr('disabled', 'disabled');
  } else {
    $('select[name=thumbnail_linkto] option[value=photoswipe]').removeAttr('disabled');
    $('select[name=thumbnail_linkto] option[value=photoswipe_mobile_only]').removeAttr('disabled');
  }
});
{/footer_script}
