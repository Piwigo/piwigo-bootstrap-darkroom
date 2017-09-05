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
define('TAB_APPEARANCE', 'appearance');
define('TAB_COMPONENTS', 'components');
define('TAB_ABOUT', 'about');

// Get current tab
$page['tab'] = isset($_GET['tab']) ? $_GET['tab'] : $page['tab'] = TAB_APPEARANCE;
if (!in_array($page['tab'], array(TAB_APPEARANCE, TAB_COMPONENTS, TAB_ABOUT))) {
    $page['tab'] = TAB_APPEARANCE;
}

$themeconfig = new \BootstrapDarkroom\Config();

// Save settings
if (in_array($page['tab'], array(TAB_APPEARANCE, TAB_COMPONENTS))) {
    if (isset($_POST['boostrap_darkroom_settings'])) {
        $themeconfig->fromPost($_POST);
        $themeconfig->save();
    }
}
// TabSheet
$tabsheet = new tabsheet();
$tabsheet->set_id('bsdark');
$tabsheet->add(TAB_APPEARANCE, l10n('Appearance'), ADMIN_PATH . '&tab=' . TAB_APPEARANCE);
$tabsheet->add(TAB_COMPONENTS, l10n('Components'), ADMIN_PATH . '&tab=' . TAB_COMPONENTS);
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
