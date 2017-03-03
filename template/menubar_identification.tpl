<li class="dropdown" id="identificationDropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">{'Identification'|@translate} <span class="caret"></span></a>
    <ul class="dropdown-menu" role="menu">
{strip}
    {if isset($USERNAME)}
        <li><a href="#">{'Hello'|@translate} {$USERNAME}!</a></li>
        <li class="divider"></li>
	{/if}
    {if isset($U_LOGIN)}
            <form class="navbar-form" method="post" action="{$U_LOGIN}" id="quickconnect">
                <div class="form-group">
                    <input class="form-control" type="text" name="username" id="username" value="" placeholder="{'Username'|@translate}">
                    <input class="form-control" type="password" name="password" id="password" placeholder="{'Password'|@translate}">
                    {if $AUTHORIZE_REMEMBERING}
                    <label for="remember_me">
                        <input type="checkbox" name="remember_me" id="remember_me" value="1"> {'Auto login'|@translate}
                    </label>
                    <br />
                    {/if}
                    <input type="hidden" name="redirect" value="{$smarty.server.REQUEST_URI|@urlencode}">
                    <input class="btn btn-primary" type="submit" name="login" value="{'Login'|@translate}">
                    <!--
                    <span class="categoryActions">
                    {if isset($U_REGISTER)}
                        <a href="{$U_REGISTER}" title="{'Create a new account'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
                            <span class="pwg-icon pwg-icon-register"> </span>
                        </a>
                    {/if}
                        <a href="{$U_LOST_PASSWORD}" title="{'Forgot your password?'|@translate}" class="pwg-state-default pwg-button">
                            <span class="pwg-icon pwg-icon-lost-password"> </span>
                        </a>
                    </span>
                    -->
                </div>
            </form>
            <li class="divider"></li>
    {/if}
	{if isset($U_REGISTER)}
	    <li><a href="{$U_REGISTER}" title="{'Create a new account'|@translate}" rel="nofollow">{'Register'|@translate}</a></li>
	{/if}
	{if isset($U_LOGIN)}
	    <li><a href="{$U_LOGIN}" rel="nofollow">{'Login'|@translate}</a></li>
	{/if}
	{if isset($U_LOGOUT)}
	    <li><a href="{$U_LOGOUT}">{'Logout'|@translate}</a></li>
	{/if}
	{if isset($U_PROFILE)}
	    <li><a href="{$U_PROFILE}" title="{'customize the appareance of the gallery'|@translate}">{'Customize'|@translate}</a></li>
	{/if}
	{if isset($U_ADMIN)}
	    <li><a href="{$U_ADMIN}" title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a></li>
	{/if}
{/strip}
    </ul>
</li>
