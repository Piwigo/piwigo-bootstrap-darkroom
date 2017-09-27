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
        if ($this->config->bootstrap_theme === 'darkroom' || $this->config->bootstrap_theme === 'darkroom' || $this->config->bootstrap_theme === 'bootswatch') {
          $this->config->bootstrap_theme = 'bootstrap-darkroom';
          $this->config->save();
          add_event_handler('loc_begin_page_header', array($this, 'showUpgradeWarning'));
        }
    }

    public function assignConfig() {
        global $template;
        $template->assign('theme_config', $this->config);
    }

    public function showUpgradeWarning() {
        global $page;
        $page['errors'][] = l10n('Your selected color style has been reset to "bootstrap-darkroom". You can select a different color style in the admin section.');
    }
}

?>
