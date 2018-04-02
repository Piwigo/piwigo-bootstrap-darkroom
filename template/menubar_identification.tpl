<li class="nav-item dropdown" id="identificationDropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{if isset($USERNAME)}<i class="fas fa-user"></i> {$USERNAME}{else}{'Login'|@translate}{/if}</a>
    <div class="dropdown-menu dropdown-menu-right" role="menu">
{strip}
    {if isset($USERNAME)}
        <div class="dropdown-header">{'Hello'|@translate} {$USERNAME}!</div>
        <div class="dropdown-divider"></div>
    {/if}
    {if isset($U_LOGIN)}
        <div class="dropdown-header">
            <form class="navbar-form" method="post" action="{$U_LOGIN}" id="quickconnect">
                <div class="form-group">
                    <input class="form-control mb-2" type="text" name="username" id="username" value="" placeholder="{'Username'|@translate}">
                    <input class="form-control" type="password" name="password" id="password" placeholder="{'Password'|@translate}">
                </div>
                {if $AUTHORIZE_REMEMBERING}
                <div class="form-check checkbox">
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" name="remember_me" id="remember_me" value="1">{/strip} {'Auto login'|@translate}{strip}
                    </label>
                </div>
                {/if}
                <input type="hidden" name="redirect" value="{$smarty.server.REQUEST_URI|@urlencode}">
                <button type="submit" class="btn btn-primary btn-raised" name="login">{'Login'|@translate}</button>
            </form>
         </div>
         {if isset($U_REGISTER)||isset($U_LOGOUT)||isset($U_PROFILE)||isset($U_ADMIN)}
         <div class="dropdown-divider"></div>
         {/if}
    {/if}
    {if isset($U_REGISTER)}
         <a class="dropdown-item" href="{$U_REGISTER}" title="{'Create a new account'|@translate}" rel="nofollow">{'Register'|@translate}</a>
    {/if}
    {if isset($U_LOGOUT)}
        <a class="dropdown-item" href="{$U_LOGOUT}">{'Logout'|@translate}</a>
    {/if}
    {if isset($U_PROFILE)}
        <a class="dropdown-item" href="{$U_PROFILE}" title="{'customize the appareance of the gallery'|@translate}">{'Customize'|@translate}</a>
    {/if}
    {if isset($U_ADMIN)}
        <a class="dropdown-item" href="{$U_ADMIN}" title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a>
    {/if}
{/strip}
    </div>
</li>
