{combine_css path="themes/bootstrap_darkroom/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>Bootstrap Darkroom {$TABSHEET_TITLE}</h2>
</div>
<form method="post" class="properties">
    <input type="hidden" name="boostrap_darkroom_settings" value="true" />
    <div id="configContent">
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
