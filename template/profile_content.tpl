<div class="container">
    <form method="post" name="profile" action="{$F_ACTION}" id="profile" class="form-horizontal">
        <div class="card">
            <h4 class="card-header">
                {'Registration'|@translate}
            </h4>
            <div class="card-body">
              <fieldset>
{if isset($loaded_plugins['user_custom_fields'])}
{$UCF_PROFILE_ADD}
{else}
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">{'Username'|@translate}</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" placeholder="{$USERNAME}" readonly/>
                    </div>
                </div>
{if not $SPECIAL_USER} {* can modify password + email*}
                <div class="form-group row">
                    <label for="mail_address" class="col-sm-3 col-form-label">{'Email address'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="text" name="mail_address" id="mail_address" class="form-control" value="{$EMAIL}" placeholder="{'Email address'|@translate}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-3 col-form-label">{'Password'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="password" name="password" id="password" class="form-control" value="" placeholder="{'Password'|@translate}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="use_new_pwd" class="col-sm-3 col-form-label">{'New password'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="password" name="use_new_pwd" id="use_new_pwd" class="form-control" value="" placeholder="{'New password'|@translate}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passwordConf" class="col-sm-3 col-form-label">{'Confirm Password'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="password" name="passwordConf" id="passwordConf" class="form-control" value="" placeholder="{'Confirm Password'|@translate}">
                    </div>
                </div>
{/if}
              </fieldset>   
{if !$ALLOW_USER_CUSTOMIZATION}
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input class="btn btn-primary btn-raised" type="submit" name="validate" value="{'Submit'|@translate}">
                        <input class="btn btn-primary btn-raised" type="reset" name="reset" value="{'Reset'|@translate}">
                    </div>
                </div>
{/if}
{/if}
            </div>
        </div>
{if $ALLOW_USER_CUSTOMIZATION}
        <div class="card my-3">
            <h4 class="card-header">
                {'Preferences'|@translate}
            </h4>
            <div class="card-body">
                <div class="form-group row">
                    <label for="nb_image_page" class="col-sm-3 col-form-label">{'Number of photos per page'|@translate}</label>
                    <div class="col-sm-1">
                        <input type="text" maxlength="3" name="nb_image_page" id="nb_image_page" class="form-control" value="{$NB_IMAGE_PAGE}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="theme" class="col-sm-3 col-form-label">{'Theme'|@translate}</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="theme">
{html_options options=$template_options selected=$template_selection}
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="language" class="col-sm-3 col-form-label">{'Language'|@translate}</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="language">
{html_options options=$language_options selected=$language_selection}
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="recent_period" class="col-sm-3 col-form-label">{'Recent period'|@translate}</label>
                    <div class="col-sm-1">
                        <input type="text" size="3" maxlength="2" name="recent_period" id="recent_period" class="form-control" value="{$RECENT_PERIOD}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="expand" class="col-sm-3 col-form-label">{'Expand all albums'|@translate}</label>
                    <div class="col-sm-6 html-radios-inline radio">
{html_radios name='expand' options=$radio_options selected=$EXPAND}
                    </div>
                </div>
{if $ACTIVATE_COMMENTS}
                <div class="form-group row">
                    <label for="show_nb_comments" class="col-sm-3 col-form-label">{'Show number of comments'|@translate}</label>
                    <div class="col-sm-6 html-radios-inline radio">
{html_radios name='show_nb_comments' options=$radio_options selected=$NB_COMMENTS}
                    </div>
                </div>
{/if}
                <div class="form-group row">
                    <label for="show_nb_hits" class="col-sm-3 col-form-label">{'Show number of hits'|@translate}</label>
                    <div class="col-sm-9 html-radios-inline radio">
{html_radios name='show_nb_hits' options=$radio_options selected=$NB_HITS}
                    </div>
                </div>
            </div>
        </div>

        <input class="btn btn-primary btn-raised" type="submit" name="validate" value="{'Submit'|@translate}">
        <input class="btn btn-info btn-raised" type="reset" name="reset" value="{'Reset'|@translate}">
        <input class="btn btn-warning btn-raised" type="submit" name="reset_to_default" value="{'Reset to default values'|@translate}">
{/if}
        <input type="hidden" name="redirect" value="{$REDIRECT}">
        <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
    </form>
</div>
