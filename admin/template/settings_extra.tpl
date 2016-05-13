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
                </li>
            </ul>
            <blockquote>
            <dl>
                <dt>ondemand</dt>
                <dd>{'Load only currently active images on page load, other images as they are requested. This keeps the initial page size low.'|@translate}</dd>
                <dt>progressive</dt>
                <dd>{'Load currently active images first, then all other images. Depending on the size of your albums this can cause each page access loading several MBs of thumbnails.'|@translate}</dd>
            </dl>
            </blockquote>
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
                </li>
            </ul>
            <blockquote>Show a jumbotron banner on the categroy pages. It is still disabled on mobile devices.</blockquote>
        </fieldset>
    </div>
    <p class="formButtons">
        <input type="submit" name="submit" value="Save settings">
    </p>
</form>
