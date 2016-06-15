{combine_css path="themes/bootstrapdefault/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>{'Bootstrap Default'|@translate} {$TABSHEET_TITLE}</h2>
</div>
<form method="post" class="properties">
    <input type="hidden" name="boostrapdefault_settings" value="true" />
    <div id="configContent">
        <fieldset class="mainConf">
            <legend>{'Bootstrap theme'|@translate}</legend>
            <p><em>This setting is overridden by Bootstrap Default</em><p>
            <ul>
                <li>
                    <select name="bootstrap_theme" disabled="disabled">
                        <option value="none"{if $theme_config->bootstrap_theme == 'none'} selected="selected"{/if}>None</option>
                        <option value="default"{if $theme_config->bootstrap_theme == 'default'} selected="selected"{/if}>Default</option>
                    </select>
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Picture page display'|@translate}</legend>
            <p><em>This setting is overridden by Bootstrap Default</em><p>
            <ul>
                <li>
                    <label class="radio">
                        <input type="radio" name="picture_page" value="normal"{if $theme_config->picture_page == 'normal'} checked="checked"{/if} disabled="disabled"/>
                        {'Normal'|@translate}
                    </label>
                    <label class="radio">
                        <input type="radio" name="picture_page" value="more-space"{if $theme_config->picture_page == 'more-space'} checked="checked"{/if} disabled="disabled"/>
                        {'More space*'|@translate}
                    </label>
                </li>
            </ul>
            <br />
            <span>* Hides the top menu and jumbotron containing the page title and banner</span>
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
    <p class="formButtons">
        <input type="submit" name="submit" value="Save settings">
    </p>
</form>
{footer_script require='jquery'}{strip}
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
{/strip}{/footer_script}
