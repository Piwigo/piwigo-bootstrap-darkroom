<?php
namespace BootstrapDarkroom;

class ThemeController {
    private $config;

    public function __construct() {
        $this->config = new Config();
    }

    public function init() {
        load_language('theme.lang', PHPWG_THEMES_PATH.'bootstrap_darkroom/');

        add_event_handler('init', array($this, 'assignConfig'));
    }

    public function assignConfig() {
        global $template;
        $template->assign('theme_config', $this->config);
    }
}
?>
