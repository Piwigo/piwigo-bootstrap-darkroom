{html_head} 
<link rel="alternate" type="application/rss+xml" title="{'Photos only RSS feed'|@translate}" href="{$U_FEED_IMAGE_ONLY}"> 
<link rel="alternate" type="application/rss+xml" title="{'Complete RSS feed (photos, comments)'|@translate}" href="{$U_FEED}"> 
{/html_head}

<nav class="navbar navbar-contextual navbar-expand-lg">
    <div class="container">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'Notification'|@translate}</a></div>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container">
    <div class="card">
        <h4 class="card-header">
            {'Notification'|@translate}
        </h4>
        <div class="card-body notification">
            <p>{'The RSS notification feed provides notification on news from this website : new photos, updated albums, new comments. Use a RSS feed reader.'|@translate}</p>
            <p><a href="{$U_FEED_IMAGE_ONLY}">{'Photos only RSS feed'|@translate}</a></p>
            <p><a href="{$U_FEED}">{'Complete RSS feed (photos, comments)'|@translate}</a></p>
        </div>
    </div>
</div>
