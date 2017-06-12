<?php
namespace BootstrapDarkroom;

//use BootstrapDefault\ThemeController;
require_once(PHPWG_THEMES_PATH . 'bootstrapdefault/include/themecontroller.php');

class ThemeController {
    private $config;

    public function __construct() {
        $this->config = new ExtraConfig();
    }

    public function init() {
        load_language('theme.lang', PHPWG_THEMES_PATH.'bootstrap_darkroom/');

        add_event_handler('init', array($this, 'assignConfig'));
        add_event_handler('init', array($this, 'unsetWarning'));
    }

    public function unsetWarning() {
        global $page, $pwg_loaded_plugins;
        if (isset($pwg_loaded_plugins['language_switch'])) {
            $key = array_search('Language Switch', $page['errors']);
            unset($page['errors'][$key]);
        }
    }

    public function assignConfig() {
        global $template;
        $template->assign('theme_config_extra', $this->config);
    }
}
?>
