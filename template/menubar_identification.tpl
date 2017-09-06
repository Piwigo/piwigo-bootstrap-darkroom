<li class="nav-item dropdown" id="identificationDropdown">
    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{if isset($USERNAME)}<i class="fa fa-user"></i> {$USERNAME}{else}{'Login'|@translate}{/if} <span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
{strip}
    {if isset($USERNAME)}
        <li class="dropdown-header">{'Hello'|@translate} {$USERNAME}!</li>
        <li class="dropdown-divider"></li>
    {/if}
    {if isset($U_LOGIN)}
        <li class="dropdown-header">
            <form class="navbar-form" method="post" action="{$U_LOGIN}" id="quickconnect">
                <div class="form-group">
                    <input class="form-control" type="text" name="username" id="username" value="" placeholder="{'Username'|@translate}">
                    <input class="form-control" type="password" name="password" id="password" placeholder="{'Password'|@translate}">
                </div>
                {if $AUTHORIZE_REMEMBERING}
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember_me" id="remember_me" value="1">{/strip} {'Auto login'|@translate}{strip}
                    </label>
                </div>
                {/if}
                <input type="hidden" name="redirect" value="{$smarty.server.REQUEST_URI|@urlencode}">
                <button type="submit" class="btn btn-primary" name="login">{'Login'|@translate}</button>
            </form>
         </li>
         <li class="dropdown-divider"></li>
    {/if}
    {if isset($U_REGISTER)}
         <li class="dropdown-item"><a href="{$U_REGISTER}" title="{'Create a new account'|@translate}" rel="nofollow">{'Register'|@translate}</a></li>
    {/if}
    {if isset($U_LOGOUT)}
        <li class="dropdown-item"><a href="{$U_LOGOUT}">{'Logout'|@translate}</a></li>
    {/if}
    {if isset($U_PROFILE)}
        <li class="dropdown-item"><a href="{$U_PROFILE}" title="{'customize the appareance of the gallery'|@translate}">{'Customize'|@translate}</a></li>
    {/if}
    {if isset($U_ADMIN)}
        <li class="dropdown-item"><a href="{$U_ADMIN}" title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a></li>
    {/if}
{/strip}
    </ul>
</li>
