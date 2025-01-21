{footer_script require='jquery'}
{literal}$(document).ready(function() { $("#wrapper").css({"position":"relative","overflow-x":"hidden"}); });{/literal}
{/footer_script}
<div id="sidebar">
    <div id="info-content" class="info">
        <dl id="standard" class="imageInfoTable">
            <h4>{'Information'|@translate}</h4>
{if $display_info.author and isset($INFO_AUTHOR)}
            <div id="Author" class="imageInfo">
                <dt>{'Author'|@translate}</dt>
                <dd>{$INFO_AUTHOR}</dd>
            </div>
{/if}
{if isset($CR_INFO_NAME) && !empty($CR_INFO_NAME)}
            <div id="Copyright" class="imageInfo">
                <dt>{'Copyright'|@translate}</dt>
                <dd>{if isset($CR_INFO_URL)}<a href="{$CR_INFO_URL}">{$CR_INFO_NAME}</a>{else}{$CR_INFO_NAME}{/if}</dd>
            </div>
{/if}
{if $display_info.created_on and isset($INFO_CREATION_DATE)}
            <div id="datecreate" class="imageInfo">
                <dt>{'Created on'|@translate}</dt>
                <dd>{$INFO_CREATION_DATE}</dd>
            </div>
{/if}
{if $display_info.posted_on}
            <div id="datepost" class="imageInfo">
                <dt>{'Posted on'|@translate}</dt>
                <dd>{$INFO_POSTED_DATE}</dd>
            </div>
{/if}
{if $display_info.visits}
            <div id="visits" class="imageInfo">
                <dt>{'Visits'|@translate}</dt>
                <dd>{$INFO_VISITS}</dd>
            </div>
{/if}
{if $display_info.dimensions and isset($INFO_DIMENSIONS)}
            <div id="Dimensions" class="imageInfo">
                <dt>{'Dimensions'|@translate}</dt>
                <dd>{$INFO_DIMENSIONS}</dd>
            </div>
{/if}
{if $display_info.file}
            <div id="File" class="imageInfo">
                <dt>{'File'|@translate}</dt>
                <dd>{$INFO_FILE}</dd>
            </div>
{/if}
{if $display_info.filesize and isset($INFO_FILESIZE)}
            <div id="Filesize" class="imageInfo">
                <dt>{'Filesize'|@translate}</dt>
                <dd>{$INFO_FILESIZE}</dd>
            </div>
{/if}
{if $display_info.tags and isset($related_tags)}
            <div id="Tags" class="imageInfo">
                <dt>{'Tags'|@translate}</dt>
                <dd>
                    {foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}<a href="{$tag.URL}">{$tag.name}</a>{/foreach}
                </dd>
            </div>
{/if}
{if $display_info.categories and isset($related_categories)}
            <div id="Categories" class="imageInfo">
                <dt>{'Albums'|@translate}</dt>
                <dd>
{foreach from=$related_categories item=cat name=cat_loop}
                {if !$smarty.foreach.cat_loop.first}<br />{/if}{$cat}
{/foreach}
                </dd>
            </div>
{/if}
{if isset($PDF_NB_PAGES) and $current.path_ext=="pdf" }
  <div id="Pages" class="imageInfo">
    <dt>{'Pages'|@translate}</dt>
    <dd>{$PDF_NB_PAGES}</td>
  </div>
{/if}
{if $display_info.rating_score and isset($rate_summary)}
            <div id="Average" class="imageInfo">
                <dt>{'Rating score'|@translate}</dt>
                <dd>
                {if $rate_summary.count}
                        <span id="ratingScore">{$rate_summary.score}</span> <span id="ratingCount">({$rate_summary.count|@translate_dec:'%d rate':'%d rates'})</span>
                {else}
                        <span id="ratingScore">{'no rate'|@translate}</span> <span id="ratingCount"></span>
                {/if}
                </dd>
            </div>
{/if}

{if isset($rating)}
            <div id="rating" class="imageInfo">
                <dt id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</dt>
                <dd>
                        <form action="{$rating.F_ACTION}" method="post" id="rateForm" style="margin:0;">
                        <div>
                        {foreach from=$rating.marks item=mark name=rate_loop}
                        {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
                                <span class="rateButtonStarFull" data-value="{$mark}"></span>
                        {else}
                                <span class="rateButtonStarEmpty" data-value="{$mark}"></span>
                        {/if}
                        {/foreach}
                        {strip}{combine_script id='core.scripts' path='themes/default/js/scripts.js' load='async'}
                        {combine_script id='rating' require='core.scripts' path='themes/bootstrap_darkroom/js/rating.js' load='async'}
                        {footer_script require='jquery'}
                                var _pwgRatingAutoQueue = _pwgRatingAutoQueue||[];
                                _pwgRatingAutoQueue.push( {ldelim}rootUrl: '{$ROOT_URL}', image_id: {$current.id},
                                        onSuccess : function(rating) {ldelim}
                                                var e = document.getElementById("updateRate");
                                                if (e) e.innerHTML = "{'Update your rating'|@translate|@escape:'javascript'}";
                                                e = document.getElementById("ratingScore");
                                                if (e) e.innerHTML = rating.score;
                                                e = document.getElementById("ratingCount");
                                                if (e) {ldelim}
                                                        if (rating.count == 1) {ldelim}
                                                                e.innerHTML = "({'%d rate'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
                                                        {rdelim} else {ldelim}
                                                                e.innerHTML = "({'%d rates'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
                                                        {rdelim}
                                                {rdelim}
                                                $('#averageRate').find('span').each(function() {ldelim}
                                                        $(this).addClass(rating.average > $(this).data('value') - 0.5 ? 'rateButtonStarFull' : 'rateButtonStarEmpty');
                                                        $(this).removeClass(rating.average > $(this).data('value') - 0.5 ? 'rateButtonStarEmpty' : 'rateButtonStarFull');
                                                {rdelim});
                                        {rdelim}
                                {rdelim});
                        {/footer_script}
                        {/strip}
                        </div>
                        </form>
                </dd>
           </div>
{/if}
{if isset($metadata)}
<div id="metadata" class="imageInfo">
{foreach from=$metadata item=meta}
            <br />
            <h4>{$meta.TITLE}</h4>
{foreach from=$meta.lines item=value key=label}
            <dt>{$label}</dt>
            <dd>{$value}</dd>
{/foreach}
{/foreach}
</div>
{/if}
        </dl>
    </div>
    <div class="handle">
        <a id="info-link" href="#">
            <span class="fas fa-info" aria-hidden="true"></span>
        </a>
    </div>
</div>
