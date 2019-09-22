<div class="container{if $theme_config->fluid_width}-fluid{/if}">
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
                    <label for="username" class="col-12 col-md-3 col-form-label">{'Username'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <input id="username" class="form-control-plaintext" type="text" value="{$USERNAME}" readonly/>
                    </div>
                </div>
{if not $SPECIAL_USER} {* can modify password + email*}
                <div class="form-group row">
                    <label for="mail_address" class="col-12 col-md-3 col-form-label">{'Email address'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <input type="text" name="mail_address" id="mail_address" class="form-control" value="{$EMAIL}" placeholder="{'Email address'|@translate}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-12 col-md-3 col-form-label">{'Password'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <input type="password" name="password" id="password" class="form-control" value="" placeholder="{'Password'|@translate}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="use_new_pwd" class="col-12 col-md-3 col-form-label">{'New password'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <input type="password" name="use_new_pwd" id="use_new_pwd" class="form-control" value="" placeholder="{'New password'|@translate}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passwordConf" class="col-12 col-md-3 col-form-label">{'Confirm Password'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <input type="password" name="passwordConf" id="passwordConf" class="form-control" value="" placeholder="{'Confirm Password'|@translate}">
                    </div>
                </div>
{/if}
              </fieldset>   
{if !$ALLOW_USER_CUSTOMIZATION}
                <div class="form-group row">
                    <div class="col-12 col-md-offset-2 col-12 col-md-10">
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
                    <label for="nb_image_page" class="col-12 col-md-3 col-form-label">{'Number of photos per page'|@translate}</label>
                    <div class="col-12 col-md-2">
                        <input type="text" maxlength="3" name="nb_image_page" id="nb_image_page" class="form-control" value="{$NB_IMAGE_PAGE}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="theme" class="col-12 col-md-3 col-form-label">{'Theme'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <select class="form-control" name="theme">
{html_options options=$template_options selected=$template_selection}
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="language" class="col-12 col-md-3 col-form-label">{'Language'|@translate}</label>
                    <div class="col-12 col-md-4">
                        <select class="form-control" name="language">
{html_options options=$language_options selected=$language_selection}
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="recent_period" class="col-12 col-md-3 col-form-label">{'Recent period'|@translate}</label>
                    <div class="col-12 col-md-2">
                        <input type="text" size="3" maxlength="2" name="recent_period" id="recent_period" class="form-control" value="{$RECENT_PERIOD}">
                    </div>
                </div>
                <label class="col-12 col-lg-4 form-check-label float-left pl-0">{'Expand all albums'|@translate}</label>
                <div class="col-12 col-lg-8">
{foreach from=$radio_options key=option item=value}
                    <div class="form-check form-check-inline radio">
                        <label for="expand" class="form-check-label">
                          <input name="expand" type="radio" class="form-check-input" value="{$option}" {if $option === $EXPAND}checked="checked"{/if}>
                          {$value}
                        </label>
                    </div>
{/foreach}
                </div>
{if $ACTIVATE_COMMENTS}
                <label class="col-12 col-lg-4 form-check-label float-left pl-0">{'Show number of comments'|@translate}</label>
                <div class="col-12 col-lg-8">
{foreach from=$radio_options key=option item=value}
                    <div class="form-check form-check-inline radio">
                        <label for="show_nb_comments" class="form-check-label">
                          <input name="show_nb_comments" type="radio" class="form-check-input" value="{$option}" {if $option === $NB_COMMENTS}checked="checked"{/if}>
                            {$value}
                        </label>
                    </div>
{/foreach}
                </div>
{/if}
                <label class="col-12 col-lg-4 form-check-label float-left pl-0">{'Show number of hits'|@translate}</label>
                <div class="col-12 col-lg-8">
{foreach from=$radio_options key=option item=value}
                    <div class="form-check form-check-inline radio">
                        <label for="show_nb_hits" class="form-check-label">
                          <input name="show_nb_hits" type="radio" class="form-check-input" value="{$option}" {if $option === $NB_HITS}checked="checked"{/if}>
                          {$value}
                        </label>
                    </div>
{/foreach}
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
