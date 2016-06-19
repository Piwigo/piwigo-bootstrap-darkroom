<?php
/*
Theme Name: Bootstrap Darkroom
Version: 1.4.3
Description: A mobile-ready Bootstrap Default child theme with darker colors based on Lightroom, a carousel on the picture page and PhotoSwipe for fullscreen slide-shows
Theme URI: http://piwigo.org/ext/extension_view.php?eid=831
Author: Thomas Kuther
Author URI: https://https://github.com/tkuther/piwigo-bootstrap-darkroom
*/
require_once(PHPWG_THEMES_PATH . 'bootstrap_darkroom/include/themecontroller.php');
require_once(PHPWG_THEMES_PATH . 'bootstrap_darkroom/include/config.php');

$themeconf = array(
    'name' => 'bootstrap_darkroom',
    'parent' => 'bootstrapdefault',
    'load_parent_css' => true,
    'load_parent_local_head' => true,
    'url' => 'https://kuther.net/'
);

//debug
//$conf['template_combine_files'] = false;

// always show metadata initially
pwg_set_session_var('show_metadata', true);

// config
add_event_handler('init', 'set_config_values');
function set_config_values()
{
  global $template, $pwg_loaded_plugins;
  $template->assign(array(
                          'rv_tscroller_enabled'=> isset($pwg_loaded_plugins['rv_tscroller']),
                          'videojs_enabled'=> isset($pwg_loaded_plugins['piwigo-videojs'])
                         ));
}

// needed for the carousel and photoswipe
// borrowed from https://github.com/ThomasDaheim/piwigo-stuff/tree/master/picturethumbs
add_event_handler('loc_end_picture', 'get_all_thumbnails_in_category');
// also needed on index.tpl for compatibility with GThumb+/GDThumb
add_event_handler('loc_end_index', 'get_all_thumbnails_in_category');
function get_all_thumbnails_in_category()
{
  global $template, $conf, $user, $page;

  include_once(PHPWG_ROOT_PATH.'/include/functions_metadata.inc.php');

  if (!$page['items']) {
    return;
  }
  
  // select all pictures for this category
  $query = '
  SELECT *
    FROM '.IMAGES_TABLE.'
    WHERE id IN ('.implode(',', $page['items']).')
    ORDER BY FIELD(id, '.implode(',', $page['items']).')
  ;';

  $result = pwg_query($query);
  
  $pictures = array();
  while ($row = pwg_db_fetch_assoc($result))
  {
    $pictures[] = $row;
  }
  
  $tpl_thumbnails_var = array();

  $theme_config = $template->get_template_vars('theme_config_extra');

  if ($theme_config->photoswipe_metadata) {
    if (array_key_exists('bootstrap_darkroom_ps_exif_mapping', $conf)) {
      $exif_mapping = $conf['bootstrap_darkroom_ps_exif_mapping'];
    } else {
      $exif_mapping = array(
        'date_creation' => 'DateTimeOriginal',
        'make'          => 'Make',
        'model'         => 'Model',
        'lens'          => 'UndefinedTag:0xA434',
        'shutter_speed' => 'ExposureTime',
        'iso'           => 'ISOSpeedRatings',
        'apperture'     => 'FNumber',
        'focal_length'  => 'FocalLength',
      );
    }
  }

  foreach ($pictures as $row)
  {    
    $url = duplicate_picture_url(
      array(
        'image_id' => $row['id'],
        'image_file' => $row['file'],
        ),
      array('start')
      );

    $name = render_element_name($row);
    $desc = render_element_description($row, 'main_page_element_description');

    $tpl_var = array_merge( $row, array(
      'NAME' => $name,
      'TN_ALT' => htmlspecialchars(strip_tags($name)),
      'URL' => $url,
      'DESCRIPTION' => htmlspecialchars(strip_tags($desc)),
      'src_image' => new SrcImage($row),
      'SIZE' => $row['width'].'x'.$row['height'],
      'PATH' => $row['path'],
      'DATE_CREATED' => $row['date_creation'],
    ) );

    if ($theme_config->photoswipe_metadata) {
      $tpl_var = array_merge( $tpl_var, array (
        'EXIF' => get_exif_data($row['path'], $exif_mapping),
      ) );

      //optional replacements
      if (array_key_exists('bootstrap_darkroom_ps_exif_replacements', $conf)) {
        foreach ($conf['bootstrap_darkroom_ps_exif_replacements'] as $tag => $replacement) {
          $tpl_var['EXIF'][$tag] = str_replace($replacement[0], $replacement[1], $tpl_var['EXIF'][$tag]);
        }
      }
    }
 
    $tpl_thumbnails_var[] = $tpl_var;
  }

  $template->assign('thumbnails', $tpl_thumbnails_var);

  unset($tpl_thumbnails_var, $pictures);
}

// register video files
$video_ext = array('mp4','m4v');
$conf['file_ext'] = array_merge ($conf['file_ext'], $video_ext, array_map('strtoupper', $video_ext));

$controller = new \BootstrapDarkroom\ThemeController();
$controller->init();
