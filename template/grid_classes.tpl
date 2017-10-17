{* Content container widths, taken from bootstrap.css. Must be updated to match for accurate grid calcuations if image
size menu is enabled in child theme *}
{assign var=width_xxl value=1410}
{assign var=width_xl value=1170}
{assign var=width_lg value=970}
{assign var=width_md value=750}
{assign var=width_sm value=540}
{assign var=col_padding value={$col_padding|default:'5'}}

{assign var=col_class value=""}

{if $theme_config->fluid_width && $theme_config->fluid_width_col_xxl}
{if $width > ($width_xxl - (4 * $col_padding)) / 2}
    {$col_class = $col_class|cat:"col-xxl-12"}
{elseif $width > ($width_xxl - (6 * $col_padding)) / 3}
    {$col_class = $col_class|cat:"col-xxl-4"}
{elseif $width > ($width_xxl - (8 * $col_padding)) / 4}
    {$col_class = $col_class|cat:"col-xxl-3"}
{elseif $width <= ($width_xxl - (8 * $col_padding)) / 4 && $width > ($width_xxl - (12 * $col_padding)) / 6}
    {$col_class = $col_class|cat:"col-xxl-2"}
{else}
    {$col_class = $col_class|cat:"col-xxl-1"}
{/if}
{/if}

{* Calulate grid for xlarge desktops *}
{if $width > ($width_xl - (4 * $col_padding)) / 2}
    {$col_class = $col_class|cat:" col-xl-12"}
{elseif $width > ($width_xl - (6 * $col_padding)) / 3}
    {$col_class = $col_class|cat:" col-xl-6"}
{elseif $width > ($width_xl - (8 * $col_padding)) / 4}
    {$col_class = $col_class|cat:" col-xl-4"}
{elseif $width <= ($width_xl - (8 * $col_padding)) / 4 && $width > ($width_xl - (12 * $col_padding)) / 6}
    {$col_class = $col_class|cat:" col-xl-3"}
{else}
    {$col_class = $col_class|cat:" col-xl-2"}
{/if}

{* Calulate grid for large desktops *}
{if $width > ($width_lg - (4 * $col_padding)) / 2}
    {$col_class = $col_class|cat:" col-lg-12"}
{elseif $width > ($width_lg - (6 * $col_padding)) / 3}
    {$col_class = $col_class|cat:" col-lg-6"}
{elseif $width > ($width_lg - (8 * $col_padding)) / 4}
    {$col_class = $col_class|cat:" col-lg-4"}
{elseif $width <= ($width_lg - (8 * $col_padding)) / 4 && $width > ($width_lg - (12 * $col_padding)) / 6}
    {$col_class = $col_class|cat:" col-lg-3"}
{else}
    {$col_class = $col_class|cat:" col-lg-2"}
{/if}

{* Calulate grid for md desktops *}
{if $width > ($width_md - (4 * $col_padding)) / 2}
    {$col_class = $col_class|cat:" col-md-12"}
{elseif $width > ($width_md - (6 * $col_padding)) / 3}
    {$col_class = $col_class|cat:" col-md-6"}
{elseif $width > ($width_md - (8 * $col_padding)) / 4}
    {$col_class = $col_class|cat:" col-md-4"}
{elseif $width <= ($width_md - (8 * $col_padding)) / 4 && $width > ($width_md - (12 * $col_padding)) / 6}
    {$col_class = $col_class|cat:" col-md-3"}
{else}
    {$col_class = $col_class|cat:" col-md-2"}
{/if}

{* Calulate grid for tablets *}
{if $width > ($width_sm - (4 * $col_padding)) / 2}
    {$col_class = $col_class|cat:" col-sm-12"}
{elseif $width > ($width_sm - (6 * $col_padding)) / 3}
    {$col_class = $col_class|cat:" col-sm-6"}
{elseif $width > ($width_sm - (8 * $col_padding)) / 4}
    {$col_class = $col_class|cat:" col-sm-4"}
{elseif $width <= ($width_sm - (8 * $col_padding)) / 4 && $width > ($width_sm - (12 * $col_padding)) / 6}
    {$col_class = $col_class|cat:" col-sm-3"}
{else}
    {$col_class = $col_class|cat:" col-sm-2"}
{/if}

{* For phones just use 1 column *}
{$col_class = $col_class|cat:" col-12"}

{* Assign to parent *}
{assign var=col_class value=$col_class scope=parent}
