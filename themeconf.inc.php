<?php
/*
Theme Name: Bootstrap Darkroom
Version: 2.0.3
Description: A mobile-ready & feature-rich theme based on Boostrap 4, with PhotoSwipe full-screen slideshow, Slick carousel, over 30 color styles and lots of configuration options
Theme URI: http://piwigo.org/ext/extension_view.php?eid=831
Author: Thomas Kuther
Author URI: https://https://github.com/tkuther/piwigo-bootstrap-darkroom
*/
require_once(PHPWG_THEMES_PATH . 'bootstrap_darkroom/include/themecontroller.php');
require_once(PHPWG_THEMES_PATH . 'bootstrap_darkroom/include/config.php');

$themeconf = array(
    'name' => 'bootstrap_darkroom',
    'parent' => 'default',
    'load_parent_css' => false,
    'load_parent_local_head' => true,
    'local_head' => 'local_head.tpl',
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
  global $template, $pwg_loaded_plugins, $conf;

  $template->assign(array(
                          'loaded_plugins' => $GLOBALS['pwg_loaded_plugins'],
                          'meta_ref_enabled' => $conf['meta_ref']
                         ));
  if (array_key_exists('bootstrap_darkroom_core_js_in_header', $conf)) {
    $template->assign('bootstrap_darkroom_core_js_in_header', $conf['bootstrap_darkroom_core_js_in_header']);
  } else {
    $template->assign('bootstrap_darkroom_core_js_in_header', false);
  }

  if (isset($pwg_loaded_plugins['language_switch'])) {
    add_event_handler('loc_end_search', 'language_controler_flags', 95 );
    add_event_handler('loc_end_identification', 'language_controler_flags', 95 );
    add_event_handler('loc_end_tags', 'language_controler_flags', 95 );
    add_event_handler('loc_begin_about', 'language_controler_flags', 95 );
    add_event_handler('loc_end_register', 'language_controler_flags', 95 );
    add_event_handler('loc_end_password', 'language_controler_flags', 95 );
  }

  if (isset($pwg_loaded_plugins['exif_view'])) {
    load_language('lang.exif', PHPWG_PLUGINS_PATH.'exif_view/');
  }
}

add_event_handler('loc_begin_page_header', 'check_if_homepage');
function check_if_homepage() {
  global $template, $page;

  if (isset($page['is_homepage'])) {
    $template->assign('is_homepage', true);
  } else {
    $template->assign('is_homepage', false);
  }
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

  if (!$page['items'] || ($page['section'] == 'categories' && !isset($page['category']))) {
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

  $theme_config = $template->get_template_vars('theme_config');

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
          if (array_key_exists($tag, $tpl_var['EXIF'])) {
            $tpl_var['EXIF'][$tag] = str_replace($replacement[0], $replacement[1], $tpl_var['EXIF'][$tag]);
          }
        }
      }
    }
 
    $tpl_thumbnails_var[] = $tpl_var;
  }

  $template->assign('thumbnails', $tpl_thumbnails_var);

  $template->assign( array(
      'derivative_params_square' => trigger_change('get_index_derivative_params', ImageStdParams::get_by_type( IMG_SQUARE ) ),
      'derivative_params_medium' => trigger_change('get_index_derivative_params', ImageStdParams::get_by_type( IMG_MEDIUM ) ),
      'derivative_params_large' => trigger_change('get_index_derivative_params', ImageStdParams::get_by_type( IMG_LARGE ) ),
      'derivative_params_xxlarge' => trigger_change('get_index_derivative_params', ImageStdParams::get_by_type( IMG_XXLARGE ) ),  
  ));

  unset($tpl_thumbnails_var, $pictures);
}

add_event_handler('loc_begin_index_thumbnails', 'return_page_start');
function return_page_start() {
  global $page, $template;
 
  $template->assign('START_ID', $page['start']);
}

add_event_handler('loc_after_page_header', 'strip_breadcrumbs');
function strip_breadcrumbs() {
  global $template;

  $l_sep = $template->get_template_vars('LEVEL_SEPARATOR');
  $title = $template->get_template_vars('TITLE');
  $section_title = $template->get_template_vars('SECTION_TITLE');
  if (empty($title)) {
    $title = $section_title;
  }
  if (!empty($title)) {
    $splt = strpos($title, "[");
    if ($splt) {
      $title_links = substr($title, 0, $splt);
      $title = $title_links;
    }

    $title = str_replace('<a href', '<a class="nav-breadcrumb-item" href', $title);
    $title = str_replace($l_sep, '', $title);
    if (empty($section_title)) {
      $template->assign('TITLE', $title);
    } else {
      $template->assign('SECTION_TITLE', $title);
    }
  }
}

// register additional template files
add_event_handler('loc_end_picture', 'register_picture_templates');
function register_picture_templates() {
  global $template;

  $template->set_filenames(array('picture_nav'=>'picture_nav.tpl'));

  $template->assign_var_from_handle('PICTURE_NAV', 'picture_nav');
}

add_event_handler('format_exif_data', 'exif_replacements');
function exif_replacements($exif) {
  global $conf;

  if (array_key_exists('bootstrap_darkroom_ps_exif_replacements', $conf)) {
    foreach ($conf['bootstrap_darkroom_ps_exif_replacements'] as $tag => $replacement) {
      if (is_array($exif) && array_key_exists($tag, $exif)) {
        $exif[$tag] = str_replace($replacement[0], $replacement[1], $exif[$tag]);
      }
    }
  }
  return $exif; 
}

// register video files
$video_ext = array('mp4','m4v');
$conf['file_ext'] = array_merge ($conf['file_ext'], $video_ext, array_map('strtoupper', $video_ext));

$controller = new \BootstrapDarkroom\ThemeController();
$controller->init();
