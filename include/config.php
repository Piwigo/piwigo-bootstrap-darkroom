<?php
namespace BootstrapDarkroom;

use BoostrapDefault\Config;
require_once(PHPWG_THEMES_PATH . 'bootstrapdefault/include/config.php');

class ExtraConfig {

    const CONF_PARAM = 'bootstrap_darkroom';
    const CONF_VERSION = 9;

    const TYPE_BOOL = 'bool';
    const TYPE_STRING = 'string';
    const TYPE_NUM = 'numeric';

    const KEY_VERSION = 'conf_version';

    const KEY_BOOTSTRAP_THEME = 'bootstrap_theme';
    const KEY_BOOTSWATCH_THEME = 'bootswatch_theme';
    const KEY_SLICK_ENABLED = 'slick_enabled';
    const KEY_SLICK_LAZYLOAD = 'slick_lazyload';
    const KEY_SLICK_INFINITE = 'slick_infinite';
    const KEY_SLICK_CENTERED = 'slick_centered';
    const KEY_SHOW_JUMBOTRON = 'show_jumbotron';
    const KEY_PICTURE_INFO = 'picture_info';
    const KEY_PHOTOSWIPE = 'photoswipe';
    const KEY_PHOTOSWIPE_INTERVAL = 'photoswipe_interval';
    const KEY_PHOTOSWIPE_METADATA = 'photoswipe_metadata';
    const KEY_THUMBNAIL_LINKTO = 'thumbnail_linkto';
    const KEY_CATEGORY_WELLS = 'category_wells';

    private $defaults = array(
        self::KEY_BOOTSTRAP_THEME => 'darkroom',
        self::KEY_BOOTSWATCH_THEME => 'cerulean',
        self::KEY_SLICK_ENABLED => true,
        self::KEY_SLICK_LAZYLOAD => 'ondemand',
        self::KEY_SLICK_INFINITE => false,
        self::KEY_SLICK_CENTERED => false,
        self::KEY_SHOW_JUMBOTRON => false,
        self::KEY_PICTURE_INFO => 'tabs',
        self::KEY_PHOTOSWIPE => true,
        self::KEY_PHOTOSWIPE_INTERVAL => '3500',
        self::KEY_PHOTOSWIPE_METADATA => false,
        self::KEY_THUMBNAIL_LINKTO => 'picture',
        self::KEY_CATEGORY_WELLS => 'never',
    );

    private $types = array(
        self::KEY_BOOTSTRAP_THEME => self::TYPE_STRING,
        self::KEY_BOOTSWATCH_THEME => self::TYPE_STRING,
        self::KEY_SLICK_ENABLED => self::TYPE_BOOL,
        self::KEY_SLICK_LAZYLOAD => self::TYPE_STRING,
        self::KEY_SLICK_INFINITE => self::TYPE_BOOL,
        self::KEY_SLICK_CENTERED => self::TYPE_BOOL,
        self::KEY_SHOW_JUMBOTRON => self::TYPE_BOOL,
        self::KEY_PICTURE_INFO => self::TYPE_STRING,
        self::KEY_PHOTOSWIPE => self::TYPE_BOOL,
        self::KEY_PHOTOSWIPE_INTERVAL => self::TYPE_NUM,
        self::KEY_PHOTOSWIPE_METADATA => self::TYPE_BOOL,
        self::KEY_THUMBNAIL_LINKTO => self::TYPE_STRING,
        self::KEY_CATEGORY_WELLS => self::TYPE_STRING,
    );

    private $config = array();

    public function __construct() {
        global $conf;

        // Create initial config if necessary
        if (!isset($conf[self::CONF_PARAM])) {
            $this->createDefaultConfig();
            return;
        }

        // Load and JSON decode the config
        $loaded = json_decode($conf[self::CONF_PARAM], true);

        // Check for current version
        if (isset($loaded[self::KEY_VERSION]) && $loaded[self::KEY_VERSION] == self::CONF_VERSION) {
            $this->config = $loaded;
            return;
        }

        // Invalid or old config, recreate
        $this->createDefaultConfig();
        if (is_array($loaded)) {
            $this->populateConfig($loaded);
        }
        $this->save();
    }

    public function __set($key, $value) {
        if (array_key_exists($key, $this->defaults)) {
            switch ($this->types[$key]) {
                case self::TYPE_STRING:
                    $this->config[$key] = !empty($value) ? $value : null;
                    break;
                case self::TYPE_BOOL:
                    $this->config[$key] = $value ? true : false;
                    break;
                case self::TYPE_NUM:
                    $this->config[$key] = is_numeric($value) ? $value : $this->defaults[$key];
                    break;
            }
        }
    }

    public function __get($key) {
        if (array_key_exists($key, $this->defaults)) {
            switch ($this->types[$key]) {
                case self::TYPE_STRING:
                case self::TYPE_BOOL:
                case self::TYPE_NUM:
                    return $this->config[$key];
            }
        } else {
            return null;
        }
    }

    public function fromPost(array $post) {
        foreach (array_keys($this->defaults) as $key) {
            $this->__set($key, isset($post[$key]) ? stripslashes($post[$key]) : null);
        }
    }

    public function save() {
        conf_update_param(self::CONF_PARAM, json_encode($this->config));
    }

    private function createDefaultConfig() {
        $this->config = $this->defaults;
        $this->config[self::KEY_VERSION] = self::CONF_VERSION;
    }

    private function populateConfig(array $config) {
        foreach (array_keys($this->defaults) as $key) {
            if (isset($config[$key])) {
                $this->config[$key] = $config[$key];
            }
        }
    }
}
?>
