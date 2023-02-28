{if isset($smarty.server.HTTP_X_FORWARDED_PROTO)}
    {assign var=http_scheme value=$smarty.server.HTTP_X_FORWARDED_PROTO scope=parent}
{elseif isset($smarty.server.HTTPS) and $smarty.server.HTTPS == "on"}
    {assign var=http_scheme value='https' scope=parent}
{else}
    {assign var=http_scheme value='http' scope=parent}
{/if}
