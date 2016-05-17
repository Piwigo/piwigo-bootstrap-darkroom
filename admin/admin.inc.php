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
define('TAB_SETTINGS_EXTRA', 'settings_extra');
define('TAB_ABOUT', 'about');

// Get current tab
$page['tab'] = isset($_GET['tab']) ? $_GET['tab'] : $page['tab'] = TAB_SETTINGS;
if (!in_array($page['tab'], array(TAB_SETTINGS, TAB_SETTINGS_EXTRA, TAB_ABOUT))) {
    $page['tab'] = TAB_SETTINGS;
}

$themeconfig = new \BootstrapDefault\Config();
$themeconfig_extra = new \BootstrapDarkroom\ExtraConfig();

// Save settings
if ($page['tab'] == TAB_SETTINGS) {
    if (isset($_POST['boostrapdefault_settings'])) {
        $themeconfig->fromPost($_POST);
        $themeconfig->save();
    }
}
if ($page['tab'] == TAB_SETTINGS_EXTRA) {
    if (isset($_POST['boostrap_darkroom_settings'])) {
        $themeconfig_extra->fromPost($_POST);
        $themeconfig_extra->save();
    }
}


// TabSheet
$tabsheet = new tabsheet();
$tabsheet->set_id('bsdark');
$tabsheet->add(TAB_SETTINGS, 'Bootstrap Default ' . l10n('Settings'), ADMIN_PATH . '&tab=' . TAB_SETTINGS);
$tabsheet->add(TAB_SETTINGS_EXTRA, 'Bootstrap Darkroom Extra ' . l10n('Settings'), ADMIN_PATH . '&tab=' . TAB_SETTINGS_EXTRA);
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
$template->assign('theme_config_extra', $themeconfig_extra);
$template->assign_var_from_handle('ADMIN_CONTENT', 'theme_admin_content');
