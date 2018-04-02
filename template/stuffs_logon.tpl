{include file='infos_errors.tpl'}
    <div class="card">
        <div class="card-header">
            {'Login'|@translate}
        </div>
        <div class="card-body">
            <form action="{$block.F_LOGIN_ACTION}" method="post" name="login_form" class="form-inline">
                <div class="form-group mb-2">
                    <label for="username" class="sr-only">{'Username'|@translate}</label>
                    <div class="col">
                        <input tabindex="1" class="form-control" type="text" name="username" id="username" placeholder="{'Username'|@translate}">
                    </div>
                </div>
                <div class="form-group mb-2">
                    <label for="password" class="sr-only">{'Password'|@translate}</label>
                    <div class="col">
                        <input tabindex="2" class="form-control" type="password" name="password" id="password" placeholder="{'Password'|@translate}">
                    </div>
                </div>
{if $block.authorize_remembering}
                <div class="form-group mb-2">
                  <div class="col">
                    <div class="form-check form-check-inline checkbox">
                        <label class="form-check-label">
                            <input class="form-check-input" tabindex="3" type="checkbox" name="remember_me" id="remember_me" value="1"> {'Auto login'|@translate}
                        </label>
                    </div>
                  </div>
                </div>
{/if}
                <div class="col-12">
                    <input type="hidden" name="redirect" value="{$smarty.server.REQUEST_URI|@urlencode}">
                    <input tabindex="4" type="submit" name="login" value="{'Submit'|@translate}" class="btn btn-primary btn-raised">
                </div>
            </form>
            {if isset($block.U_REGISTER)}
            <div class="col-12 pt-2">
                <a href="{$block.U_REGISTER}" title="{'Register'|@translate}">
                    <span class="fas fa-user"></span> {'Register'|@translate}
                </a>
            </div>
            {/if}
            {if isset($block.U_LOST_PASSWORD)}
            <div class="col-12 pt-2">
                <a href="{$block.U_LOST_PASSWORD}" title="{'Forgot your password?'|@translate}">
                    <span class="fas fa-lock"></span> {'Forgot your password?'|@translate}
                </a>
            </div>
            {/if}
        </div>
    </div>
<script type="text/javascript"><!--
    document.getElementById('username').focus();
//--></script>
