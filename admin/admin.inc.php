<?php
// Check whether we are indeed included by Piwigo.
if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

// Includes
include_once(PHPWG_ROOT_PATH . 'admin/include/tabsheet.class.php');
require_once(PHPWG_THEMES_PATH . 'bootstrap_darkroom/include/config.php');

load_language('theme.lang', PHPWG_THEMES_PATH.'bootstrap_darkroom/');

// Constants
define('THEME_ID', basename(dirname(dirname(__FILE__))));
define('ADMIN_PATH',   get_root_url() . 'admin.php?page=theme&theme=' . THEME_ID);
define('TAB_SETTINGS', 'settings');
define('TAB_ABOUT', 'about');

// Get current tab
$page['tab'] = isset($_GET['tab']) ? $_GET['tab'] : $page['tab'] = TAB_SETTINGS;
if (!in_array($page['tab'], array(TAB_SETTINGS, TAB_ABOUT))) {
    $page['tab'] = TAB_SETTINGS;
}

$themeconfig = new \BootstrapDarkroom\Config();

//Add check for new config settings added after 2024-12
//This allows us to avoid unset variable errors in php 8
//We force the object parameter to be added using the default value set in config.php,
$ReflectionClass = new ReflectionClass('\BootstrapDarkroom\Config');
$themeconfig_vars = $ReflectionClass->getDefaultProperties();
$themeconfig_defaults = $themeconfig_vars['defaults'];

if (!isset($themeconfig->thumbnail_nb_images) and !isset($_POST['boostrap_darkroom_settings']))
{
  $themeconfig->thumbnail_nb_images = $themeconfig_defaults['thumbnail_nb_images'];
  $themeconfig->save();
}

// Save settings
if ($page['tab'] == TAB_SETTINGS) {
    if (isset($_POST['boostrap_darkroom_settings'])) {
        $themeconfig->fromPost($_POST);
        $themeconfig->save();
      
      $template->assign(
        array(
          'save_success' => l10n('Your configuration settings are saved'),
        )
      );
    }
}
// TabSheet
$tabsheet = new tabsheet();
$tabsheet->set_id('bsdark');
$tabsheet->add(TAB_SETTINGS, l10n('Settings'), ADMIN_PATH . '&tab=' . TAB_SETTINGS);
$tabsheet->add(TAB_ABOUT, l10n('About'), ADMIN_PATH . '&tab=' . TAB_ABOUT);
$tabsheet->select($page['tab']);
$tabsheet->assign();

// Fetch the template.
global $template;

// Add our template to the global template
$template->set_filenames(
    array(
        'theme_admin_content' => dirname(__FILE__) . '/template/' . $page['tab'] . '.tpl'
    )
);

// Assign the template contents to ADMIN_CONTENT
$template->assign('theme_config', $themeconfig);
$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
