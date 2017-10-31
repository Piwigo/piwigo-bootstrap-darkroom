        <!-- Start of footer.tpl -->
        <div class="copyright container{if $theme_config->fluid_width}-fluid{/if}">
            <div class="text-center">
{if isset($debug.TIME)}
                {'Page generated in'|@translate} {$debug.TIME} ({$debug.NB_QUERIES} {'SQL queries in'|@translate} {$debug.SQL_TIME}) -
{/if}
                {*
                    Please, do not remove this copyright. If you really want to,
                            contact us on http://piwigo.org to find a solution on how
                            to show the origin of the script...
                *}
                {'Powered by'|@translate}	<a href="{$PHPWG_URL}" class="Piwigo">Piwigo</a>
{$VERSION}
{if isset($CONTACT_MAIL)}
                | <a href="mailto:{$CONTACT_MAIL}?subject={'A comment on your site'|@translate|@escape:url}">{'Contact webmaster'|@translate}</a>
{/if}
{if isset($TOGGLE_MOBILE_THEME_URL)}
                | {'View in'|@translate} : <a href="{$TOGGLE_MOBILE_THEME_URL}">{'Mobile'|@translate}</a> | <b>{'Desktop'|@translate}</b>
{/if}

{if isset($footer_elements)}
{foreach from=$footer_elements item=v}
{$v}
{/foreach}
{/if}
            </div>
        </div>
</div>
{if isset($debug.QUERIES_LIST)}
        <div id="debug">
{$debug.QUERIES_LIST}
        </div>
{/if}
{if $theme_config->photoswipe && (($BODY_ID == "thePicturePage" && !empty($thumbnails)) || !empty($THUMBNAILS))}
{include file='_photoswipe_div.tpl'}
{/if}

{include file='_plugin_fixes_js.tpl'}

{if preg_match('/^material/', $theme_config->bootstrap_theme)}
{footer_script require='bootstrap'}
 $('body').bootstrapMaterialDesign();
{/footer_script}
{/if}
{get_combined_scripts load='footer'}
</body>
</html>
