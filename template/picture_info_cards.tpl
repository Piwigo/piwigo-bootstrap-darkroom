    <div id="infopanel-left" class="col-lg-6 col-12">
      <!-- Picture infos -->
      <div id="card-informations" class="card mb-2">
        <div class="card-body">
          <h5 class="card-title">{'Information'|@translate}</h5>
          <div id="info-content" class="d-flex flex-column">
{if $display_info.author and isset($INFO_AUTHOR)}
            <div id="Author" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Author'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_AUTHOR}</dd>
              </dl>
            </div>
{/if}
{if isset($CR_INFO_NAME) && !empty($CR_INFO_NAME)}
            <div id="Copyright" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Copyright'|@translate}</dt>
                <dd class="col-sm-7">{if isset($CR_INFO_URL)}<a href="{$CR_INFO_URL}">{$CR_INFO_NAME}</a>{else}{$CR_INFO_NAME}{/if}</dd>
              </dl>
            </div>
{/if}
{if $display_info.rating_score and isset($rate_summary)}
            <div id="Average" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Rating score'|@translate}</dt>
                <dd class="col-sm-7">
                  {if $rate_summary.count}
                    <span id="ratingScore">{$rate_summary.score}</span> <span id="ratingCount">({$rate_summary.count|@translate_dec:'%d rate':'%d rates'})</span>
                  {else}
                    <span id="ratingScore">{'no rate'|@translate}</span> <span id="ratingCount"></span>
                  {/if}
                </dd>
              </dl>
            </div>
{/if}

{if isset($rating)}
            <div id="rating" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5" id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</dt>
                <dd class="col-sm-7">
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
              </dl>
            </div>
{/if}
{if $display_info.created_on and isset($INFO_CREATION_DATE)}
            <div id="datecreate" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Created on'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_CREATION_DATE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.posted_on}
            <div id="datepost" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Posted on'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_POSTED_DATE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.visits}
            <div id="visits" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Visits'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_VISITS}</dd>
              </dl>
            </div>
{/if}
{if $display_info.dimensions and isset($INFO_DIMENSIONS)}
            <div id="Dimensions" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Dimensions'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_DIMENSIONS}</dd>
              </dl>
            </div>
{/if}
{if $display_info.file}
            <div id="File" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'File'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_FILE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.filesize and isset($INFO_FILESIZE)}
            <div id="Filesize" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Filesize'|@translate}</dt>
                <dd class="col-sm-7">{$INFO_FILESIZE}</dd>
              </dl>
            </div>
{/if}
{if $display_info.categories and isset($related_categories)}
            <div id="Categories" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Albums'|@translate}</dt>
                <dd class="col-sm-7">
                {foreach from=$related_categories item=cat name=cat_loop}
                {if !$smarty.foreach.cat_loop.first}<br />{/if}{$cat}
                {/foreach}
                </dd>
              </dl>
            </div>
{/if}
{if $display_info.privacy_level and isset($available_permission_levels)}
{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
{footer_script require='jquery'}{strip}
    function setPrivacyLevel(id, level, label) {
    (new PwgWS('{$ROOT_URL}')).callService(
        "pwg.images.setPrivacyLevel", { image_id:id, level:level},
        {
            method: "POST",
            onFailure: function(num, text) { alert(num + " " + text); },
            onSuccess: function(result) {
                jQuery('#dropdownPermissions').html(label);
                jQuery('.permission-li').removeClass('active');
                jQuery('#permission-' + level).addClass('active');
            }
        }
    );
    }
{/strip}{/footer_script}
            <div id="Privacy" class="imageInfo">
              <dl class="row mb-0">
                <dt class="col-sm-5">{'Who can see this photo?'|@translate}</dt>
                <dd class="col-sm-7">
                  <div class="dropdown">
                    <button class="btn btn-primary btn-raised dropdown-toggle ellipsis" type="button" id="dropdownPermissions" data-toggle="dropdown" aria-expanded="true">
                      {$available_permission_levels[$current.level]}
                    </button>
                    <div class="dropdown-menu" role="menu" aria-labelledby="dropdownPermissions">
{foreach from=$available_permission_levels item=label key=level}
                      <a id="permission-{$level}" class="dropdown-item permission-li {if $current.level == $level} active{/if}" href="javascript:setPrivacyLevel({$current.id},{$level},'{$label}')">{$label}</a>
{/foreach}
                    </div>
                  </div>
                </dd>
              </dl>
            </div>
{/if}
          </div>
        </div>
      </div>
{if $display_info.tags and isset($related_tags)}
      <div id="card-tags" class="card mb-2">
        <div class="card-body">
          <h5 class="card-title">{'Tags'|@translate}</h5>
            <div id="Tags" class="imageInfo">
              {foreach from=$related_tags item=tag name=tag_loop}<a class="btn btn-primary btn-raised mr-1" href="{$tag.URL}">{$tag.name}</a>{/foreach}
            </div>
        </div>
      </div>
{/if}
    </div>

{if isset($metadata) || (isset($comment_add) || !empty($COMMENT_COUNT))}
    <div id="infopanel-right" class="col-lg-6 col-12">
    <!-- metadata -->
{if isset($metadata)}
{if isset($loaded_plugins['exif_view'])}
{assign var="exif_make" value="{'exif_field_Make'|@translate}"}
{assign var="exif_model" value="{'exif_field_Model'|@translate}"}
{assign var="exif_lens" value="{'exif_field_UndefinedTag:0xA434'|@translate}"}
{assign var="exif_fnumber" value="{'exif_field_FNumber'|@translate}"}
{assign var="exif_iso" value="{'exif_field_ISOSpeedRatings'|@translate}"}
{assign var="exif_focal_length" value="{'exif_field_FocalLength'|@translate}"}
{assign var="exif_flash" value="{'exif_field_Flash'|@translate}"}
{assign var="exif_exposure_time" value="{'exif_field_ExposureTime'|@translate}"}
{assign var="exif_exposure_bias" value="{'exif_field_ExposureBiasValue'|@translate}"}
{else}
{assign var="exif_make" value="Make"}
{assign var="exif_model" value="Model"}
{assign var="exif_lens" value="UndefinedTag:0xA434"}
{assign var="exif_fnumber" value="FNumber"}
{assign var="exif_iso" value="ISOSpeedRatings"}
{assign var="exif_focal_length" value="FocalLength"}
{assign var="exif_flash" value="Flash"}
{assign var="exif_exposure_time" value="ExposureTime"}
{assign var="exif_exposure_bias" value="ExposureBiasValue"}
{/if}

      <div id="card-metadata" class="card mb-2">
        <div class="card-body">
          <h5 class="card-title">{'EXIF Metadata'|@translate}</h5>
          <div id="metadata">
            {if is_array($metadata.0.lines) && (array_key_exists("{$exif_make}", $metadata.0.lines) || array_key_exists("{$exif_model}", $metadata.0.lines))}
            <div class="row" style="line-height: 40px">
              <div class="col-12">
                <span class="camera-compact fa-3x mr-3" title="{$exif_make} &amp; {$exif_model}"></span>
                {if is_array($metadata.0.lines) && (array_key_exists("{$exif_make}", $metadata.0.lines))}{$metadata.0.lines[{$exif_make}]}{/if}
                {if is_array($metadata.0.lines) && (array_key_exists("{$exif_model}", $metadata.0.lines))}{$metadata.0.lines[{$exif_model}]}{/if}
              </div>
            </div>
            {/if}
            {if is_array($metadata.0.lines) && (array_key_exists("{$exif_lens}", $metadata.0.lines))}
            <div class="row" style="line-height: 40px">
              <div class="col-12">
                <span class="camera-lens-h fa-3x mr-3" title="{$exif_lens}"></span>
                    {$metadata.0.lines[{$exif_lens}]}
              </div>
            </div>
            {/if}
            <div class="row">
              <div class="col-12{if $theme_config->fluid_width} col-xl-10{/if}">
                <div class="row">
                  {if is_array($metadata.0.lines) && (array_key_exists("{$exif_fnumber}", $metadata.0.lines))}
                  <div class="col-6 col-sm-4">
                    <span class="camera-aperture fa-2x pr-2" title="{$exif_fnumber}"></span> f/{$metadata.0.lines[{$exif_fnumber}]}
                  </div>
                  {/if}
                  {if is_array($metadata.0.lines) && (array_key_exists("{$exif_focal_length}", $metadata.0.lines))}
                  <div class="col-6 col-sm-4">
                    <span class="camera-focal-length fa-2x pr-2" title="{$exif_focal_length}"></span> {$metadata.0.lines[{$exif_focal_length}]}
                  </div>
                  {/if}
                  {if is_array($metadata.0.lines) && (array_key_exists("{$exif_exposure_time}", $metadata.0.lines))}
                  <div class="col-6 col-sm-4">
                    <span class="camera-shutter-speed fa-2x pr-2" title="{$exif_exposure_time}"></span> {$metadata.0.lines[{$exif_exposure_time}]}
                  </div>
                  {/if}
                  {if is_array($metadata.0.lines) && (array_key_exists("{$exif_iso}", $metadata.0.lines))}
                  <div class="col-6 col-sm-4">
                    <span class="camera-iso fa-2x pr-2" title="{$exif_iso}"></span> {$metadata.0.lines[{$exif_iso}]}
                  </div>
                  {/if}
                  {if is_array($metadata.0.lines) && (array_key_exists("{$exif_exposure_bias}", $metadata.0.lines))}
                  <div class="col-6 col-sm-4">
                    <span class="camera-exposure fa-2x pr-2" title="{$exif_exposure_bias}"></span> {$metadata.0.lines[{$exif_exposure_bias}]}
                  </div>
                  {/if}
                  {if is_array($metadata.0.lines) && (array_key_exists("{$exif_flash}", $metadata.0.lines))}
                  <div class="col-6 col-sm-4">
                    <span class="camera-flash fa-2x pr-2 float-left h-100" title="{$exif_flash}"></span><div> {$metadata.0.lines[{$exif_flash}]}</div>
                  </div>
                  {/if}
                </div>
              </div>
            </div>
          </div>
          <button id="show_exif_data" class="btn btn-primary btn-raised mt-1" style="text-transform: none;"><i class="fas fa-info mr-1"></i> {'Show EXIF data'|@translate}</button>
{footer_script require='jquery'}
$('#show_exif_data').on('click', function() {
  if ($('#full_exif_data').hasClass('d-none')) {
    $('#full_exif_data').addClass('d-flex').removeClass('d-none');
    $('#show_exif_data').html('<i class="fas fa-info mr-1"></i> {"Hide EXIF data"|@translate}');
  } else {
    $('#full_exif_data').addClass('d-none').removeClass('d-flex');
    $('#show_exif_data').html('<i class="fas fa-info mr-1"></i> {"Show EXIF data"|@translate}');
  }
});
{/footer_script}
          <div id="full_exif_data" class="d-none flex-column mt-2">
{foreach from=$metadata item=meta}
{foreach from=$meta.lines item=value key=label}
            <div>
              <dl class="row mb-0">
                <dt class="col-sm-6">{$label}</dt>
                <dd class="col-sm-6">{$value}</dd>
              </dl>
            </div>
{/foreach}
{/foreach}
          </div>
        </div>
      </div>
{/if}
      <div id="card-comments" class="ml-2">
        {include file='picture_info_comments.tpl'}
      </div>
    </div>
{/if}
