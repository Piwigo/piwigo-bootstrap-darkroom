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
        if ($this->config->bootstrap_theme === 'darkroom' || $this->config->bootstrap_theme === 'material' || $this->config->bootstrap_theme === 'bootswatch') {
          $this->config->bootstrap_theme = 'bootstrap-darkroom';
          $this->config->save();
          add_event_handler('loc_begin_page_header', array($this, 'showUpgradeWarning'));
        }

        $shortname = $this->config->comments_disqus_shortname;                                                                                                                 
        if ($this->config->comments_type == 'disqus' && !empty($shortname)) {                                                                                                  
            add_event_handler('blockmanager_apply', array($this, 'hideMenus'));                                                                                                
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

    public function hideMenus($menus) {                                                                                                                                        
        $menu = &$menus[0];                                                                                                                                                    
                                                                                                                                                                               
        $mbMenu = $menu->get_block('mbMenu');                                                                                                                                  
        unset($mbMenu->data['comments']);                                                                                                                                      
                                                                                                                                                                               
        $mbSpecials = $menu->get_block('mbSpecials');                                                                                                                          
        if (!is_null($mbSpecials)) {                                                                                                                                           
            unset($mbSpecials->data['calendar']);                                                                                                                              
        }                                                                                                                                                                      
    }
}

?>
