{combine_script id='common' load='footer' require='jquery' path='admin/themes/default/js/common.js'}

{combine_script id='jquery.jgrowl' load='footer' require='jquery' path='themes/default/js/plugins/jquery.jgrowl_minimized.js'}

{combine_script id='jquery.plupload' load='footer' require='jquery' path='themes/default/js/plugins/plupload/plupload.full.min.js'}
{combine_script id='jquery.plupload.queue' load='footer' require='jquery' path='themes/default/js/plugins/plupload/jquery.plupload.queue/jquery.plupload.queue.min.js'}

{combine_css path="themes/default/js/plugins/jquery.jgrowl.css"}
{combine_css path="themes/default/js/plugins/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css"}

{assign var="plupload_i18n" value="themes/default/js/plugins/plupload/i18n/`$lang_info.plupload_code`.js"}
{if "PHPWG_ROOT_PATH"|@constant|@cat:$plupload_i18n|@file_exists}
  {combine_script id="plupload_i18n-`$lang_info.plupload_code`" load="footer" path=$plupload_i18n require="jquery.plupload.queue"}
{/if}

{combine_script id='jquery.colorbox' load='footer' require='jquery' path='themes/default/js/plugins/jquery.colorbox.min.js'}
{combine_css path="themes/default/js/plugins/colorbox/style2/colorbox.css"}

{combine_script id='piecon' load='footer' path='themes/default/js/plugins/piecon.js'}

{footer_script}
var rootUrl = "{get_absolute_root_url()}";
{literal}
jQuery(document).ready(function(){

  function checkUploadStart() {
    var nbErrors = 0;
    jQuery("#formErrors").hide();
    jQuery("#formErrors li").hide();

    if (jQuery("#albumSelect option:selected").length == 0) {
      jQuery("#formErrors #noAlbum").show();
      nbErrors++;
    }

    var nbFiles = 0;
    nbFiles = jQuery(".uploadifyQueueItem").size();

    if (nbFiles == 0) {
      jQuery("#formErrors #noPhoto").show();
      nbErrors++;
    }

    if (nbErrors != 0) {
      jQuery("#formErrors").show();
      return false;
    }
    else {
      return true;
    }

  }

  function humanReadableFileSize(bytes) {
    var byteSize = Math.round(bytes / 1024 * 100) * .01;
    var suffix = 'KB';

    if (byteSize > 1000) {
      byteSize = Math.round(byteSize *.001 * 100) * .01;
      suffix = 'MB';
    }

    var sizeParts = byteSize.toString().split('.');
    if (sizeParts.length > 1) {
      byteSize = sizeParts[0] + '.' + sizeParts[1].substr(0,2);
    }
    else {
      byteSize = sizeParts[0];
    }

    return byteSize+suffix;
  }

  function fillCategoryListbox(selectId, selectedValue) {
    jQuery.getJSON(
      rootUrl + "/ws.php?format=json&method=pwg.categories.getList",
      {
        recursive: true,
        fullname: true,
        format: "json",
      },
      function(data) {
        jQuery.each(
          data.result.categories,
          function(i,category) {
            var selected = null;
            if (category.id == selectedValue) {
              selected = "selected";
            }
            
            jQuery("<option/>")
              .attr("value", category.id)
              .attr("selected", selected)
              .text(category.name)
              .appendTo("#"+selectId)
              ;
          }
        );
      }
    );
  }

  jQuery(".addAlbumOpen").colorbox({
    inline:true,
    href:"#addAlbumForm",
    onComplete:function(){
      jQuery("input[name=category_name]").focus();
    }
  });

  jQuery("#addAlbumForm form").submit(function(){
      jQuery("#categoryNameError").text("");

      jQuery.ajax({
        url: rootUrl + "/ws.php?format=json&method=pwg.categories.add",
        type:"POST",
        data: {
          parent: jQuery("select[name=category_parent] option:selected").val(),
          name: jQuery("input[name=category_name]").val(),
        },
        beforeSend: function() {
          jQuery("#albumCreationLoading").show();
        },
        success:function(html) {
          jQuery("#albumCreationLoading").hide();

          var newAlbum = jQuery.parseJSON(html).result.id;
          jQuery(".addAlbumOpen").colorbox.close();

          jQuery("#albumSelect").find("option").remove();
          fillCategoryListbox("albumSelect", newAlbum);

          jQuery(".albumSelection").show();

          /* we hide the ability to create another album, this is different from the admin upload form */
          /* in Community, it's complicated to refresh the list of parent albums                       */
          jQuery("#linkToCreate").hide();

          return true;
        },
        error:function(XMLHttpRequest, textStatus, errorThrows) {
            jQuery("#albumCreationLoading").hide();
            jQuery("#categoryNameError").text(errorThrows).css("color", "red");
        }
      });

      return false;
  });

  jQuery("#hideErrors").click(function() {
    jQuery("#formErrors").hide();
    return false;
  });

  jQuery("#uploadWarningsSummary a.showInfo").click(function() {
    jQuery("#uploadWarningsSummary").hide();
    jQuery("#uploadWarnings").show();
  });

  jQuery("#showPhotoProperties").click(function() {
    jQuery(this).parent(".showFieldset").hide();
    jQuery("#photoProperties").show();
    jQuery("input[name=set_photo_properties]").prop('checked', true);
    return false;
  });

Piecon.setOptions({
  color: '#ff7700',
  background: '#bbb',
  shadow: '#fff',
  fallback: 'force'
});

{/literal}

var pwg_token = '{$pwg_token}';
var photosUploaded_label = "{'%d photos uploaded into album "%s"'|translate|escape}";
var moderation_Label = "{'Your photos are waiting for validation, administrators have been notified'|translate|escape}";
var uploadedPhotos = [];
var uploadCategory = null;

var sizeLimit = Math.round({$upload_max_filesize} / 1024); /* in KBytes */
var sumQueueFilesize = 0;
{if isset($limit_storage)}
var limit_storage = {$limit_storage};
{/if}

{literal}
	jQuery("#uploader").pluploadQueue({
		// General settings
    browse_button : 'addFiles',
    container : 'uploadForm',
    
		// runtimes : 'html5,flash,silverlight,html4',
		runtimes : 'html5',

		// url : '../upload.php',
		url : rootUrl + 'ws.php?method=pwg.images.upload&format=json',
		
		chunk_size: '{/literal}{$chunk_size}{literal}kb',
		
		filters : {
			// Maximum file size
			max_file_size : '1000mb',
			// Specify what files to browse for
			mime_types: [
				{title : "Image files", extensions : "{/literal}{$file_exts}{literal}"}
			]
		},

		// Rename files by clicking on their titles
		// rename: true,

		// Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
		dragdrop: true,

    preinit: {
      Init: function (up, info) {
        jQuery('#uploader_container').removeAttr("title"); //remove the "using runtime" text
        
        jQuery('#startUpload').on('click', function(e) {
            e.preventDefault();
            up.start();
          });
        
        jQuery('#cancelUpload').on('click', function(e) {
            e.preventDefault();
            up.stop();
            up.trigger('UploadComplete', up.files);
          });
      }
    },

    init : {
      // update custom button state on queue change
      QueueChanged : function(up) {
        jQuery('#startUpload').prop('disabled', up.files.length == 0);
      },
      
      UploadProgress: function(up, file) {
        jQuery('#uploadingActions .progressbar').width(up.total.percent+'%');
        Piecon.setProgress(up.total.percent);
      },
      
      BeforeUpload: function(up, file) {
        //console.log('[BeforeUpload]', file);
        
        // hide buttons
        jQuery('#startUpload, #addFiles').hide();
        jQuery('#uploadingActions').show();

        // warn user if she wants to leave page while upload is running
        jQuery(window).bind('beforeunload', function() {
          return "{/literal}{'Upload in progress'|translate|escape}{literal}";
        });

        // no more change on category/level
        jQuery("select[name=level]").attr("disabled", "disabled");

        // You can override settings before the file is uploaded
        up.setOption(
          'multipart_params',
          {
            category : jQuery("select[name=category] option:selected").val(),
            level : jQuery("select[name=level] option:selected").val(),
            pwg_token : pwg_token
            // name : file.name
          }
        );
      },

      FileUploaded: function(up, file, info) {
        // Called when file has finished uploading
        // console.log('[FileUploaded] File:', file, "Info:", info);
        
        // hide item line
        jQuery('#'+file.id).hide();
      
        var data = jQuery.parseJSON(info.response);
        console.log(data);
      
        jQuery("#uploadedPhotos").parent("fieldset").show();
      
        html = '<img src="'+data.result.src+'" class="thumbnail" title="'+data.result.name+'">';

        jQuery("#uploadedPhotos").prepend(html);

        // do not remove file, or it will reset the progress bar :-/
        // up.removeFile(file);
        uploadedPhotos.push(parseInt(data.result.image_id));
        uploadCategory = data.result.category;

        jQuery.ajax({
          url: rootUrl + "ws.php?format=json&method=pwg.images.setInfo",
          type:"POST",
          data: {
            single_value_mode: "replace",
            image_id: data.result.image_id,
            author: jQuery("input[name=author]").val(),
            name: jQuery("input[name=name]").val(),
            comment: jQuery("textarea[name=description]").val(),
          },
          dataType: "json",
          success:function(data) {
            console.log(data);
          },
          error:function(XMLHttpRequest, textStatus, errorThrows) {
          }
        });
      },

      Error: function(up, error) {
        // Called when file has finished uploading
        //console.log('[Error] error: ', error);
        var piwigoApiResponse = jQuery.parseJSON(error.response);

        jQuery(".errors ul").append('<li>'+piwigoApiResponse.message+'</li>');
        jQuery(".errors").show();
      },

      UploadComplete: function(up, files) {
        // Called when all files are either uploaded or failed
        //console.log('[UploadComplete]');
        
        Piecon.reset();

        jQuery(".selectAlbum, .selectFiles, #photoProperties, .showFieldset").hide();

        jQuery(".infos").append('<ul><li>'+sprintf(photosUploaded_label, uploadedPhotos.length, uploadCategory.label)+'</li></ul>');

        jQuery.ajax({
          url: rootUrl + "ws.php?format=json&method=community.images.uploadCompleted",
          type:"POST",
          data: {
            pwg_token: pwg_token,
            image_id: uploadedPhotos.join(","),
            category_id: uploadCategory.id
          },
          dataType: "json",
          success:function(data) {
            console.log(data);
            if (data.result.pending.length > 0) {
              jQuery(".infos ul").append('<li>'+moderation_Label+'</li>');
            }
          },
          error:function(XMLHttpRequest, textStatus, errorThrows) {
          }
        });

        jQuery(".infos").show();

        jQuery(".afterUploadActions").show();
        jQuery('#uploadingActions').hide();

        // user can safely leave page without warning
        jQuery(window).unbind('beforeunload');
      }
    }
	});

  jQuery("input[type=button]").click(function() {
    if (!checkUploadStart()) {
      return false;
    }
  });
});
{/literal}{/footer_script}

{literal}
<style type="text/css">
/*
#photosAddContent form p {
  text-align:left;
}

#photosAddContent FIELDSET {
  width:650px;
  margin:20px auto;
}
*/

#photosAddContent fieldset#photoProperties {padding-bottom:0}
#photosAddContent fieldset#photoProperties p {text-align:left;margin:0 0 1em 0;line-height:20px;}
#photosAddContent fieldset#photoProperties input[type="text"] {width:320px}
#photosAddContent fieldset#photoProperties textarea {width:500px; height:100px}

#photosAddContent P {
  margin:0;
}

p#uploadWarningsSummary {text-align:left;margin-bottom:1em;font-size:90%;color:#999;line-height:2.5em}
p#uploadWarningsSummary .showInfo {position:static;display:inline;padding:1px 6px;margin-left:3px;}
p#uploadWarnings {display:none;text-align:left;margin-bottom:1em;font-size:90%;color:#999;}
p#uploadModeInfos {text-align:left;margin-top:1em;font-size:90%;color:#999;}

#photosAddContent p.showFieldset {text-align:left;margin: 0 auto 10px auto;}

#uploadProgress {width:650px; margin:10px auto;font-size:90%;}
#progressbar {border:1px solid #ccc; background-color:#eee;}
.ui-progressbar-value { background-image: url(admin/themes/default/images/pbar-ani.gif); height:10px;margin:-1px;border:1px solid #E78F08;}

/* Upload Form */
.plupload_header {display:none;}
#uploadForm .plupload_container {padding:0}
#uploadForm .plupload_scroll .plupload_filelist {height:250px;}
#uploadForm li.plupload_droptext {line-height:230px;font-size:2em;}

#uploadBoxes .file {margin-bottom:5px;text-align:left;}
#uploadBoxes {margin-top:20px;}
#addUploadBox {margin-bottom:2em;}

p.uploadInfo {text-align:left;font-size:90%;color:#999;}
p#uploadWarningsSummary {text-align:left;margin-bottom:1em;font-size:90%;color:#999;}
p#uploadWarningsSummary .showInfo {margin-left:3px;}
p#uploadWarnings {display:none;text-align:left;margin-bottom:1em;font-size:90%;color:#999;}
p#uploadModeInfos {text-align:left;margin-top:1em;font-size:90%;color:#999;}

#photosAddContent p.showFieldset {text-align:left;margin: 1em;}

#uploadForm .plupload_buttons, #uploadForm .plupload_progress { display:none !important; }
#uploadForm #startUpload { margin:5px 0 15px 15px; padding:5px 10px; font-size:1.1em; }
#uploadForm #startUpload:before { margin-right:0.5em; }
#uploadForm #addFiles { margin-right:10px; float:left; }
#uploadForm #uploadingActions { margin:10px 10px 10px 15px; }
#uploadForm .big-progressbar { vertical-align:middle; display:inline-block; margin-left:10px; }

.big-progressbar {
  width:100%;
  max-width:600px;
  background:#fff;
  padding:0;
  border-radius:5px;
  position:relative;
  height:18px;
}

@keyframes animatedBackground {
	from { background-position: 0 0; }
	to { background-position: 33px 0; }
}

@-webkit-keyframes animatedBackground {
	from { background-position: 0 0; }
	to { background-position: 33px 0; }
}

.big-progressbar .progressbar {
  height:18px;
  min-width:5px;
  background:#444;
  border-radius:5px 0 0 5px;
  background-size:33px 25px;
  animation: animatedBackground 1s linear infinite;
  -webkit-animation: animatedBackground 1s linear infinite;
}
</style>
{/literal}

<div id="photosAddContent" class="col-lg-8 col-md-10 col-sm-12 col-centered">

<div class="infos" style="display:none"><i class="eiw-icon icon-ok"></i></div>
<div class="errors" style="display:none"><i class="eiw-icon icon-cancel"></i><ul></ul></div>

<p class="afterUploadActions" style="margin:10px; display:none;"><a href="{$another_upload_link}">{'Add another set of photos'|@translate}</a></p>

{if count($setup_errors) > 0}
<div class="errors">
  <ul>
  {foreach from=$setup_errors item=error}
    <li>{$error}</li>
  {/foreach}
  </ul>
</div>
{else}

  {if count($setup_warnings) > 0}
<div class="warnings">
  <ul>
    {foreach from=$setup_warnings item=warning}
    <li>{$warning}</li>
    {/foreach}
  </ul>
  <div class="hideButton" style="text-align:center"><a href="{$hide_warnings_link}">{'Hide'|@translate}</a></div>
</div>
  {/if}


{if !empty($thumbnails)}
<fieldset>
  <legend>{'Uploaded Photos'|@translate}</legend>
  <div>
  {foreach from=$thumbnails item=thumbnail}
    <a href="{$thumbnail.link}"  class="{if isset($thumbnail.lightbox)}colorboxThumb{else}externalLink{/if}">
      <img src="{$thumbnail.src}" alt="{$thumbnail.file}" title="{$thumbnail.title}" class="thumbnail">
    </a>
  {/foreach}
  </div>
</fieldset>
<p style="margin:10px"><a href="{$another_upload_link}">{'Add another set of photos'|@translate}</a></p>
{else}

<div id="formErrors" class="errors" style="display:none">
  <ul>
    <li id="noAlbum">{'Select an album'|@translate}</li>
    <li id="noPhoto">{'Select at least one photo'|@translate}</li>
  </ul>
  <div class="hideButton" style="text-align:center"><a href="#" id="hideErrors">{'Hide'|@translate}</a></div>
</div>

<div style="display:none">
  <div id="addAlbumForm" style="text-align:left;padding:1em;">
    <form>
      {'Parent album'|@translate}<br>
      <select id ="category_parent" name="category_parent">
{if $create_whole_gallery}
        <option value="0">------------</option>
{/if}
        {html_options options=$category_parent_options selected=$category_parent_options_selected}
      </select>

      <br><br>{'Album name'|@translate}<br><input name="category_name" type="text"> <span id="categoryNameError"></span>
      <br><br><br><input type="submit" value="{'Create'|@translate}"> <span id="albumCreationLoading" style="display:none"><img src="themes/default/images/ajax-loader-small.gif"></span>
    </form>
  </div>
</div>

<form id="uploadForm" enctype="multipart/form-data" method="post" action="{$form_action}" class="properties">
{if $upload_mode eq 'multiple'}
    <input name="upload_id" value="{$upload_id}" type="hidden">
{/if}

    <fieldset class="selectAlbum form-group">
      <legend>{'Drop into album'|@translate}</legend>

      <span class="albumSelection"{if count($category_options) == 0} style="display:none"{/if}>
      <select id="albumSelect" name="category" class="form-control">
        {html_options options=$category_options selected=$category_options_selected}
      </select>
      </span>
{if $create_subcategories}
      <div id="linkToCreate">
      <span class="albumSelection">{'... or '|@translate}</span>
      <a href="#" class="addAlbumOpen btn btn-sm btn-primary" title="{'create a new album'|@translate}">{'create a new album'|@translate}</a>
      </div>
{/if}      
    </fieldset>

    <fieldset class="selectFiles form-group">
      <legend>{'Select files'|@translate}</legend>
      <button id="addFiles" class="btn btn-sm btn-primary"><i class="fas fa-plus"></i> {'Add Photos'|translate}</button>

    <p id="uploadWarningsSummary">{$upload_max_filesize_shorthand}B. {$upload_file_types}. {if isset($max_upload_resolution)}{$max_upload_resolution}Mpx.{/if} {if isset($quota_summary)}{$quota_summary}{/if}
      <a class="showInfo" href="#" title="{'Learn more'|@translate}"><i class="fas fa-info-circle"></i></a>
    </p>

    <p id="uploadWarnings">
{'Maximum file size: %sB.'|@translate|@sprintf:$upload_max_filesize_shorthand}
{'Allowed file types: %s.'|@translate|@sprintf:$upload_file_types}
  {if isset($max_upload_resolution)}
{'Approximate maximum resolution: %dM pixels (that\'s %dx%d pixels).'|@translate|@sprintf:$max_upload_resolution:$max_upload_width:$max_upload_height}
  {/if}
{$quota_details}
    </p>

      <div id="uploader">
        <p>Your browser doesn't have HTML5 support.</p>
      </div>
    </fieldset>

    <p class="showFieldset"><a id="showPhotoProperties" href="#">{'Set Photo Properties'|@translate}</a></p>

    <fieldset id="photoProperties" class="form-group" style="display:none">
      <legend>{'Photo Properties'|@translate}</legend>

      <input type="checkbox" name="set_photo_properties" style="display:none">

      <p>
        {'Title'|@translate}<br>
        <input type="text" class="large" name="name" value="">
      </p>

      <p>
        {'Author'|@translate}<br>
        <input type="text" class="large" name="author" value="">
      </p>

      <p>
        {'Description'|@translate}<br>
        <textarea name="description" id="description" class="description" style="margin:0"></textarea>
      </p>

    </fieldset>

    <div id="uploadingActions" style="display:none">
      <button id="cancelUpload" class="btn btn-primary"><i class="fas fa-ban"></i> {'Cancel'|translate}</button>
      
      <div class="big-progressbar">
        <div class="progressbar" style="width:0%"></div>
      </div>
    </div>
      
    <button id="startUpload" class="btn btn-primary" disabled><i class="fas fa-upload"></i> {'Start Upload'|translate}</button>

</form>

<fieldset class="form-group" style="display:none">
  <legend>{'Uploaded Photos'|@translate}</legend>
  <div id="uploadedPhotos"></div>
</fieldset>

{/if} {* empty($thumbnails) *}
{/if} {* $setup_errors *}

</div> <!-- photosAddContent -->

{* Community specific *}
{footer_script}{literal}
jQuery(document).ready(function(){
  jQuery("a.colorboxThumb").colorbox({rel:"colorboxThumb"});

  jQuery("a.externalLink").click(function() {
    window.open($(this).attr("href"));
    return false;
  });
});
{/literal}{/footer_script}
