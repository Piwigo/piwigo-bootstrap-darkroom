{combine_css path="themes/bootstrap_darkroom/selectize.js/dist/css/selectize.bootstrap2.css"}
{combine_script id='jquery.selectize' load='footer' require='jquery' path="themes/bootstrap_darkroom/selectize.js/dist/js/standalone/selectize.min.js"}
{footer_script require='jquery'}
    jQuery(document).ready(function() {
    jQuery("#authors, #tags, #categories").each(function() {
    jQuery(this).selectize({
    plugins: ['remove_button'],
    maxOptions:jQuery(this).find("option").length
    });
    })
    });
{/footer_script}

<nav class="navbar navbar-contextual navbar-expand-lg">
    <div class="container">
        <div class="navbar-brand mr-auto"><a href="{$U_HOME}">{'Home'|@translate}</a>{$LEVEL_SEPARATOR}<a href>{'Search'|@translate}</a></div>
        <ul class="navbar-nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link" href="{$U_HELP}" onclick="bd_popup(this.href); return false;" title="{'Help'|@translate}">
                    <i class="fa fa-question" aria-hidden="true"></i>
                </a>
            </li>
{if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
        </ul>
    </div>
</nav>

{include file='infos_errors.tpl'}

<div class="container">
    <form method="post" name="search" action="{$F_SEARCH_ACTION}">
        <div class="card">
            <h4 class="card-header">
                {'Search for words'|@translate}
            </h4>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-7 col-md-9 col-sm-12 col-xs-12">
                        <input type="text" id="search_allwords" name="search_allwords" class="form-control" />
                    </div>
                </div>
                <div class="form-group radio">
                    <label class="radio-inline">
                        <input type="radio" name="mode" value="AND" checked="checked">{'Search for all terms'|@translate}
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="mode" value="OR">{'Search for any term'|@translate}
                    </label>
                </div>
                <label>{'Apply on properties'|translate}</label>
                <div class="form-group checkbox">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="fields[]" value="name" checked="checked"> {'Photo title'|translate}
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="fields[]" value="comment" checked="checked"> {'Photo description'|translate}
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="fields[]" value="file" checked="checked"> {'File name'|translate}
                    </label>
{if isset($TAGS)}
                    <label class="checkbox-inline">
                        <input type="checkbox" name="search_in_tags" value="tags"> {'Tags'|translate}
                    </label>
{/if}
                </div>
            </div>
        </div>
{if count($AUTHORS)>=1}
        <div class="card mt-3">
            <h4 class="card-header">
                {'Search for Author'|@translate}
            </h4>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-7 col-md-9 col-sm-12 col-xs-12">
                        <select id="authors" placeholder="{'Type in a search term'|translate}" name="authors[]" multiple>
{foreach from=$AUTHORS item=author}
                            <option value="{$author.author|strip_tags:false|escape:html}">{$author.author|strip_tags:false} ({$author.counter|translate_dec:'%d photo':'%d photos'})</option>
{/foreach}
                        </select>
                    </div>
                </div>
            </div>
        </div>
{/if}
{if isset($TAGS)}
        <div class="card mt-md-3">
            <h4 class="card-header">
                {'Search tags'|@translate}
            </h4>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-7 col-md-9 col-sm-12 col-xs-12">
                        <select id="tags" placeholder="{'Type in a search term'|translate}" name="tags[]" multiple>
{foreach from=$TAGS item=tag}
                            <option value="{$tag.id}">{$tag.name} ({$tag.counter|translate_dec:'%d photo':'%d photos'})</option>
{/foreach}
                        </select>
                    </div>
                </div>
                <div class="form-group radio">
                    <label class="radio-inline">
                        <input type="radio" name="tag_mode" value="AND" checked="checked"> {'All tags'|@translate}
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="tag_mode" value="OR"> {'Any tag'|@translate}
                    </label>
                </div>
            </div>
        </div>
{/if}
        <div class="card mt-3">
            <h4 class="card-header">
                {'Search by date'|@translate}
            </h4>
            <div class="card-body">
                <label>{'Kind of date'|@translate}</label>
                <div class="form-group radio">
                    <label class="radio-inline">
                        <input type="radio" name="date_type" value="date_creation" checked="checked"> {'Creation date'|@translate}
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="date_type" value="date_available"> {'Post date'|@translate}
                    </label>
                </div>
                <label>{'Date'|@translate}</label>
                <div class="form-group form-inline">
                    <select id="start_day" name="start_day" class="form-control">
                        <option value="0">--</option>
{section name=day start=1 loop=32}
                        <option value="{$smarty.section.day.index}" {if $smarty.section.day.index==$START_DAY_SELECTED}selected="selected"{/if}>{$smarty.section.day.index}</option>
{/section}
                    </select>
                    <select id="start_month" name="start_month" class="form-control">
{html_options options=$month_list selected=$START_MONTH_SELECTED}
                    </select>
                    <input id="start_year" name="start_year" type="text" size="4" maxlength="4" class="form-control">
                    <input id="start_linked_date" name="start_linked_date" type="hidden" size="10" disabled="disabled">
                    <a class="date_today" href="#" onClick="document.getElementById('start_day').value={$smarty.now|date_format:"%d"};document.getElementById('start_month').value={$smarty.now|date_format:"%m"};document.getElementById('start_year').value={$smarty.now|date_format:"%Y"};return false;">{'today'|@translate}</a>
                </div>
                <label>{'End-Date'|@translate}</label>
                <div class="form-group form-inline">
                    <select id="end_day" name="end_day" class="form-control">
                        <option value="0">--</option>
{section name=day start=1 loop=32}
                        <option value="{$smarty.section.day.index}" {if $smarty.section.day.index==$END_DAY_SELECTED}selected="selected"{/if}>{$smarty.section.day.index}</option>
{/section}
                    </select>
                    <select id="end_month" name="end_month" class="form-control">
{html_options options=$month_list selected=$END_MONTH_SELECTED}
                    </select>
                    <input id="end_year" name="end_year" type="text" size="4" maxlength="4" class="form-control">
                    <input id="end_linked_date" name="end_linked_date" type="hidden" size="10" disabled="disabled">
                    <a class="date_today" href="#" onClick="document.getElementById('end_day').value={$smarty.now|date_format:"%d"};document.getElementById('end_month').value={$smarty.now|date_format:"%m"};document.getElementById('end_year').value={$smarty.now|date_format:"%Y"};return false;">{'today'|@translate}</a>
                 </div>
            </div>
        </div>
        <div class="card my-3">
            <h4 class="card-header">
                {'Search in albums'|@translate}
            </h4>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-7 col-md-9 col-sm-12 col-xs-12">
                        <select id="categories" name="cat[]" multiple>
{html_options options=$category_options selected=$category_options_selected}
                        </select>
                    </div>
                </div>
                <div class="form-group checkbox">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="subcats-included" value="1" checked="checked"> {'Search in sub-albums'|@translate}
                    </label>
                </div>
            </div>
        </div>
        <input type="submit" name="submit" value="{'Submit'|@translate}" class="btn btn-default btn-primary">
        <input type="reset" value="{'Reset'|@translate}" class="btn btn-default">
    </form>
</div>

<script type="text/javascript"><!--
    document.getElementById('search_allwords').focus();
//--></script>
