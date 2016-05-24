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
        add_event_handler('loc_begin_page_header', array($this, 'assignConfig'));
        // why is this needed to have config on mainpage_categories.tpl ???
        add_event_handler('loc_begin_index_category_thumbnails', array($this, 'assignConfig'));
    }

    public function assignConfig() {
        global $template;
        $template->assign('theme_config_extra', $this->config);
    }
}
?>
