<div class="container">
    <form method="post" name="profile" action="{$F_ACTION}" id="profile" class="form-horizontal">
        <div class="panel panel-primary">
            <div class="panel-heading">
                {'Registration'|@translate}
            </div>
            <div class="panel-body">
              <fieldset>
{if isset($loaded_plugins['user_custom_fields'])}
{$UCF_PROFILE_ADD}
{else}
                <div class="form-group">
                    <label class="col-sm-2 control-label">{'Username'|@translate}</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">{$USERNAME}</p>
                    </div>
                </div>
{if not $SPECIAL_USER} {* can modify password + email*}
                <div class="form-group">
                    <label for="mail_address" class="col-sm-2 control-label">{'Email address'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="text" name="mail_address" id="mail_address" class="form-control" value="{$EMAIL}" placeholder="{'Email address'|@translate}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">{'Password'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="password" name="password" id="password" class="form-control" value="" placeholder="{'Password'|@translate}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="use_new_pwd" class="col-sm-2 control-label">{'New password'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="password" name="use_new_pwd" id="use_new_pwd" class="form-control" value="" placeholder="{'New password'|@translate}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="passwordConf" class="col-sm-2 control-label">{'Confirm Password'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="password" name="passwordConf" id="passwordConf" class="form-control" value="" placeholder="{'Confirm Password'|@translate}">
                    </div>
                </div>
{/if}
              </fieldset>   
{if !$ALLOW_USER_CUSTOMIZATION}
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input class="btn btn-default" type="submit" name="validate" value="{'Submit'|@translate}">
                        <input class="btn btn-default" type="reset" name="reset" value="{'Reset'|@translate}">
                    </div>
                </div>
{/if}
{/if}
            </div>
        </div>
{if $ALLOW_USER_CUSTOMIZATION}
        <div class="panel panel-primary">
            <div class="panel-heading">
                {'Preferences'|@translate}
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="nb_image_page" class="col-sm-2 control-label">{'Number of photos per page'|@translate}</label>
                    <div class="col-sm-1">
                        <input type="text" maxlength="3" name="nb_image_page" id="nb_image_page" class="form-control" value="{$NB_IMAGE_PAGE}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="theme" class="col-sm-2 control-label">{'Theme'|@translate}</label>
                    <div class="col-sm-4 html-options">
{html_options name=theme options=$template_options selected=$template_selection}
                    </div>
                </div>
                <div class="form-group">
                    <label for="language" class="col-sm-2 control-label">{'Language'|@translate}</label>
                    <div class="col-sm-4 html-options">
{html_options name=language options=$language_options selected=$language_selection}
                    </div>
                </div>
                <div class="form-group">
                    <label for="recent_period" class="col-sm-2 control-label">{'Recent period'|@translate}</label>
                    <div class="col-sm-1">
                        <input type="text" size="3" maxlength="2" name="recent_period" id="recent_period" class="form-control" value="{$RECENT_PERIOD}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="expand" class="col-sm-2 control-label">{'Expand all albums'|@translate}</label>
                    <div class="col-sm-10 html-radios-inline radio">
{html_radios name='expand' options=$radio_options selected=$EXPAND}
                    </div>
                </div>
{if $ACTIVATE_COMMENTS}
                <div class="form-group">
                    <label for="show_nb_comments" class="col-sm-2 control-label">{'Show number of comments'|@translate}</label>
                    <div class="col-sm-10 html-radios-inline radio">
{html_radios name='show_nb_comments' options=$radio_options selected=$NB_COMMENTS}
                    </div>
                </div>
{/if}
                <div class="form-group">
                    <label for="show_nb_hits" class="col-sm-2 control-label">{'Show number of hits'|@translate}</label>
                    <div class="col-sm-10 html-radios-inline radio">
{html_radios name='show_nb_hits' options=$radio_options selected=$NB_HITS}
                    </div>
                </div>
            </div>
        </div>

        <input class="btn btn-default btn-primary" type="submit" name="validate" value="{'Submit'|@translate}">
        <input class="btn btn-default" type="reset" name="reset" value="{'Reset'|@translate}">
        <input class="btn btn-default" type="submit" name="reset_to_default" value="{'Reset to default values'|@translate}">
{/if}
        <input type="hidden" name="redirect" value="{$REDIRECT}">
        <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
    </form>
</div>
