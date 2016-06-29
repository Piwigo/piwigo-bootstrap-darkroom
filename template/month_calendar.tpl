{if !empty($chronology_navigation_bars)}
{foreach from=$chronology_navigation_bars item=bar}
<div id="calendar-nav" class="well">
	{if isset($bar.previous)}
        <div class="btn-group btn-group-sm pull-left" role="group" aria-label="calendar-previous"><a class="btn btn-default" href="{$bar.previous.URL}"><span class="glyphicon glyphicon-menu-left"></span> {$bar.previous.LABEL}</a></div>
	{/if}
	{if isset($bar.next)}
        <div class="btn-group btn-group-sm pull-right" role="group" aria-label="calendar-next"><a class="btn btn-default" href="{$bar.next.URL}">{$bar.next.LABEL} <span class="glyphicon glyphicon-menu-right"></span></a></div>
	{/if}
	{if empty($bar.items)}
		&nbsp;
	{else}
        <div id="calendar-nav-buttons" class="btn-group">
           {if gettype(reset(reset($bar.items))) == 'string' || (!isset($bar.previous) && !isset($bar.next))}
           {foreach from=$bar.items item=item}
           {if !isset($item.URL)}
           <a class="btn btn-default" disabled="disabled">{$item.LABEL}</a>
           {else}
           <a class="btn btn-default" title="{$item.NB_IMAGES|@translate_dec:'%d photo':'%d photos'}" href="{$item.URL}">{$item.LABEL}</a>
           {/if}
           {/foreach}
           {else}
           <table class="table table-condensed">
             <tbody>
                {assign var=i value=0}
		{foreach from=$bar.items item=item}
                {if $i == 0}
                <tr>
                {/if}
		{if !isset($item.URL)}
		<td>{$item.LABEL}</td>
		{else}
		<td class="btn-default"><a{if isset($item.NB_IMAGES)} title="{$item.NB_IMAGES|@translate_dec:'%d photo':'%d photos'}"{/if} href="{$item.URL}">{$item.LABEL}</a></td>
		{/if}
                {if $i == 6}{assign var=i value=0}
                </tr>
                {else}{assign var=i value=$i+1}
                {/if}
		{/foreach}
             </tbody>
           </table>
           {/if}
        </div>
	{/if}
</div>
{/foreach}
{/if}

{if !empty($chronology_calendar.calendar_bars)}
{foreach from=$chronology_calendar.calendar_bars item=bar}
<div class="panel panel-primary">
    <div class="panel-heading"><a href="{$bar.U_HEAD}">{$bar.HEAD_LABEL}</a> <span class="badge">{$bar.NB_IMAGES}</span></div>
        <div class="panel-body">
            <div class="btn-group">
	      {foreach from=$bar.items item=item}
  	      <a class="btn btn-default btn-sm" href="{if isset($item.URL)}{$item.URL}{else}#{/if}">{$item.LABEL}{if isset($item.NB_IMAGES)} <span class="badge">{$item.NB_IMAGES}</span>{/if}</a>
	      {/foreach}
        </div>
    </div>
</div>
{/foreach}
{/if}

{if isset($chronology_calendar.month_view)}
<table class="calMonth">
 <thead>
 <tr>
 {foreach from=$chronology_calendar.month_view.wday_labels item=wday}
	<th>{$wday}</th>
 {/foreach}
 </tr>
 </thead>
{html_style}
.calMonth TD, .calMonth .calImg{
	width:{$chronology_calendar.month_view.CELL_WIDTH}px;height:{$chronology_calendar.month_view.CELL_HEIGHT}px
}
{/html_style}
 {foreach from=$chronology_calendar.month_view.weeks item=week}
 <tr>
 	{foreach from=$week item=day}
 	{if !empty($day)}
 		{if isset($day.IMAGE)}
 			<td class="calDayCellFull">
	 			<div class="calBackDate">{$day.DAY}</div><div class="calForeDate">{$day.DAY}</div>
	 			<div class="calImg">
					<a href="{$day.U_IMG_LINK}">
 						<img src="{$day.IMAGE}" alt="{$day.IMAGE_ALT}" title="{$day.NB_ELEMENTS|@translate_dec:'%d photo':'%d photos'}">
					</a>
				</div>
 		{else}
 			<td class="calDayCellEmpty">{$day.DAY}
 		{/if}
 	{else}{*blank cell first or last row only*}
 		<td>
 	{/if}
 	</td>
 	{/foreach}{*day in week*}
 </tr>
 {/foreach}{*week in month*}
</table>
{/if}

