<nav class="navbar navbar-contextual navbar-expand-lg {$theme_config->navbar_contextual_style} {$theme_config->navbar_contextual_bg} sticky-top mb-5">
    <div class="container{if $theme_config->fluid_width}-fluid{/if}">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'User comments'|@translate}</a></div>
    </div>
</nav>

{include file='infos_errors.tpl'}

{$shortname = $theme_config->comments_disqus_shortname}
{if $theme_config->comments_type == 'disqus' and !empty($shortname)}
{else}
<div class="container{if $theme_config->fluid_width}-fluid{/if}">
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
                    <div class="col-sm-4">
                        <select name="cat" id="cat" class="form-control">
                            <option value="0">------------</option>
{html_options options=$categories selected=$categories_selected}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="since" class="col-sm-2 control-label">{'Since'|@translate}</label>
                    <div class="col-sm-4">
                        <select name="since" class="form-control">
{html_options options=$since_options selected=$since_options_selected}
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="card my-3">
            <h4 class="card-header">
                {'Display'|@translate}
            </h4>
            <div class="card-body">
                <div class="form-group">
                    <label for="sort_by" class="col-sm-2 control-label">{'Sort by'|@translate}</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="sort_by">
{html_options options=$sort_by_options selected=$sort_by_options_selected}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sort_order" class="col-sm-2 control-label">{'Sort order'|@translate}</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="sort_order">
{html_options options=$sort_order_options selected=$sort_order_options_selected}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="items_number" class="col-sm-2 control-label">{'Number of items'|@translate}</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="items_number">
{html_options options=$item_number_options selected=$item_number_options_selected}
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <input type="submit" value="{'Filter and display'|@translate}" class="btn btn-primary btn-raised">
    </form>
</div>

{if isset($comments)}
<a name="comments"></a>
<div class="container{if $theme_config->fluid_width}-fluid{/if} comment-search">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12 col-xs-12">
{if isset($COMMENT_LIST)}
  {$COMMENT_LIST}
{else}
  {include file='comment_list.tpl' comment_derivative_params=$derivative_params}
{/if}
        </div>
    </div>
</div>
{/if}

{if !empty($navbar) }
<div class="container{if $theme_config->fluid_width}-fluid{/if}">
{include file='navigation_bar.tpl' fragment='comments'|@get_extent:'navbar'}
</div>
{/if}
{/if}
