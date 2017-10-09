{assign var='thumbnails' value=$block.thumbnails}
{assign var='derivative_params' value=$block.derivative_params}

{include file='thumbnails.tpl'|@get_extent:'index_thumbnails'}
