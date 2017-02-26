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
        add_event_handler('init', array($this, 'assignConfig'));
    }

    public function assignConfig() {
        global $template;
        $template->assign('theme_config_extra', $this->config);
    }
}
?>
