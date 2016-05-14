{combine_css path="themes/bootstrap_darkroom/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>{'Bootstrap Darkroom'|@translate} {$TABSHEET_TITLE}</h2>
</div>
<form method="post" class="properties">
    <input type="hidden" name="boostrap_darkroom_settings" value="true" />
    <div id="configContent">
        <fieldset class="mainConf">
            <legend>{'Slick carousel settings'|@translate}</legend>
            <h4>lazyLoad method</h4>
            <ul>
                <li>
                    <select name="slick_lazyload">
                        <option value="ondemand"{if $theme_config_extra->slick_lazyload == 'ondemand'} selected="selected"{/if}>ondemand</option>
                        <option value="progressive"{if $theme_config_extra->slick_lazyload == 'progressive'} selected="selected"{/if}>progressive</option>
                    </select>
                    <span class="info">"ondemand" will load the image as soon as you slide to it. "progressive" loads all images one after another when the page loads (use carefully!).</span>
                </li>
            </ul>
            <h4>infinite looping</h4>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_infinite"{if $theme_config_extra->slick_infinite} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">Infinitely scroll through images in an album</span>
                </li>
            </ul>
            <h4>center mode</h4>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_centered"{if $theme_config_extra->slick_centered} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">Display the currently selected image in the middle. Looks best with infinite looping enabled.</span>
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
    </div>
    <p class="formButtons">
        <input type="submit" name="submit" value="Save settings">
    </p>
</form>
