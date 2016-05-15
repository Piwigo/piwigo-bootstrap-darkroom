<?php
namespace BootstrapDarkroom;

use BoostrapDefault\Config;
require_once(PHPWG_THEMES_PATH . 'bootstrapdefault/include/config.php');

class ExtraConfig {

    const CONF_PARAM = 'bootstrap_darkroom';
    const CONF_VERSION = 2;

    const TYPE_BOOL = 'bool';
    const TYPE_STRING = 'string';

    const KEY_VERSION = 'conf_version';

    const KEY_BOOTSWATCH = 'bootswatch';
    const KEY_BOOTSWATCH_THEME = 'bootswatch_theme';
    const KEY_SLICK_LAZYLOAD = 'slick_lazyload';
    const KEY_SLICK_INFINITE = 'slick_infinite';
    const KEY_SLICK_CENTERED = 'slick_centered';
    const KEY_SHOW_JUMBOTRON = 'show_jumbotron';

    private $defaults = array(
        self::KEY_BOOTSWATCH => false,
        self::KEY_BOOTSWATCH_THEME => 'cerulean',
        self::KEY_SLICK_LAZYLOAD => 'ondemand',
        self::KEY_SLICK_INFINITE => false,
        self::KEY_SLICK_CENTERED => false,
        self::KEY_SHOW_JUMBOTRON => false,
    );

    private $types = array(
        self::KEY_BOOTSWATCH => self::TYPE_BOOL,
        self::KEY_BOOTSWATCH_THEME => self::TYPE_STRING,
        self::KEY_SLICK_LAZYLOAD => self::TYPE_STRING,
        self::KEY_SLICK_INFINITE => self::TYPE_BOOL,
        self::KEY_SLICK_CENTERED => self::TYPE_BOOL,
        self::KEY_SHOW_JUMBOTRON => self::TYPE_BOOL,
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
            }
        }
    }

    public function __get($key) {
        if (array_key_exists($key, $this->defaults)) {
            switch ($this->types[$key]) {
                case self::TYPE_STRING:
                case self::TYPE_BOOL:
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
