<nav class="navbar navbar-contextual navbar-expand-lg">
    <div class="container">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'User comments'|@translate}</a></div>
    </div>
</nav>

{include file='infos_errors.tpl'}

{$shortname = $theme_config->comments_disqus_shortname}
{if $theme_config->comments_type == 'disqus' and !empty($shortname)}
{else}
<div class="container">
    <form action="{$F_ACTION}" method="get" class="form-horizontal">
        <div class="card">
            <h4 class="card-header">
                {'Filter'|@translate}
            </h4>
            <div class="card-body">
                <div class="form-group">
                    <label for="keyword" class="col-sm-2 control-label">{'Keyword'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="text" name="keyword" id="keyword" value="{$F_KEYWORD}" class="form-control" placeholder="{'Keyword'|@translate}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">{'Author'|@translate}</label>
                    <div class="col-sm-4">
                        <input type="text" name="author" id="author" value="{$F_AUTHOR}" class="form-control" placeholder="{'Author'|@translate}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="cat" class="col-sm-2 control-label">{'Album'|@translate}</label>
                    <div class="col-sm-4 html-options">
                        <select name="cat" id="cat">
                            <option value="0">------------</option>
{html_options options=$categories selected=$categories_selected}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="since" class="col-sm-2 control-label">{'Since'|@translate}</label>
                    <div class="col-sm-4 html-options">
{html_options name=since options=$since_options selected=$since_options_selected}
                    </div>
                </div>
            </div>
        </div>
        <div class="card my-md-3">
            <h4 class="card-header">
                {'Display'|@translate}
            </h4>
            <div class="card-body">
                <div class="form-group">
                    <label for="sort_by" class="col-sm-2 control-label">{'Sort by'|@translate}</label>
                    <div class="col-sm-4 html-options">
{html_options name=sort_by options=$sort_by_options selected=$sort_by_options_selected}
                    </div>
                </div>
                <div class="form-group">
                    <label for="sort_order" class="col-sm-2 control-label">{'Sort order'|@translate}</label>
                    <div class="col-sm-4 html-options">
{html_options name=sort_order options=$sort_order_options selected=$sort_order_options_selected}
                    </div>
                </div>
                <div class="form-group">
                    <label for="items_number" class="col-sm-2 control-label">{'Number of items'|@translate}</label>
                    <div class="col-sm-4 html-options">
                        {html_options name=items_number options=$item_number_options selected=$item_number_options_selected}
                    </div>
                </div>
            </div>
        </div>
        <input type="submit" value="{'Filter and display'|@translate}" class="btn btn-default">
    </form>
</div>

{if isset($comments)}
<a name="comments"></a>
<div class="container comment-search">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
{include file='comment_list.tpl' comment_derivative_params=$derivative_params}
        </div>
    </div>
</div>
{/if}

{if !empty($navbar) }
<div class="container">
{include file='navigation_bar.tpl' fragment='comments'|@get_extent:'navbar'}
</div>
{/if}
{/if}
