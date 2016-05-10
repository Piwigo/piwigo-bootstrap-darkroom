{combine_css path="themes/bootstrapdefault/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>{'Bootstrap Darkroom'|@translate} {$TABSHEET_TITLE}</h2>
</div>
<form method="post" class="properties">
    <input type="hidden" name="boostrap_darkroom_settings" value="true" />
    <div id="configContent">
        <fieldset class="mainConf">
            <legend>{'Slick carousel lazyload method'|@translate}</legend>
            <ul style="float; left;">
                <li>
                    <select name="slick_lazyload">
                        <option value="ondemand"{if $theme_config_extra->slick_lazyload == 'ondemand'} selected="selected"{/if}>ondemand</option>
                        <option value="progressive"{if $theme_config_extra->slick_lazyload == 'progressive'} selected="selected"{/if}>progressive</option>
                    </select>
                </li>
            </ul>
            <dl>
                <dt>ondemand</dt>
                <dd>{'Load only currently active images on page load, other images as they are requested. This keeps the initial page size low.'|@translate}</dd>
                <dt>progressive</dt>
                <dd>{'Load currently active images first, then all other images. Depending on the size of your albums this can cause each page access loading several MBs of thumbnails.'|@translate}</dd>
            </dl>
        </fieldset>
    </div>
    <p class="formButtons">
        <input type="submit" name="submit" value="Save settings">
    </p>
</form>
