<?php
namespace BootstrapDarkroom;

class Config {

    const CONF_PARAM = 'bootstrap_darkroom';
    const CONF_VERSION = 20;

    const TYPE_BOOL = 'bool';
    const TYPE_STRING = 'string';
    const TYPE_NUM = 'numeric';
    const TYPE_FILE = 'file';

    const KEY_VERSION = 'conf_version';

    const KEY_FLUID_WIDTH = 'fluid_width';
    const KEY_FLUID_WIDTH_COL_XXL = 'fluid_width_col_xxl';
    const KEY_BOOTSTRAP_THEME = 'bootstrap_theme';
    const KEY_BOOTSWATCH_THEME = 'bootswatch_theme';
    const KEY_MATERIAL_COLOR = 'material_color';
    const KEY_NAVBAR_MAIN_STYLE = 'navbar_main_style';
    const KEY_NAVBAR_MAIN_BG = 'navbar_main_bg';
    const KEY_NAVBAR_CONTEXTUAL_STYLE = 'navbar_contextual_style';
    const KEY_NAVBAR_CONTEXTUAL_BG = 'navbar_contextual_bg';

    const KEY_SLICK_ENABLED = 'slick_enabled';
    const KEY_SLICK_LAZYLOAD = 'slick_lazyload';
    const KEY_SLICK_INFINITE = 'slick_infinite';
    const KEY_SLICK_CENTERED = 'slick_centered';
    const KEY_PAGE_HEADER = 'page_header';
    const KEY_PAGE_HEADER_FULL = 'page_header_full';
    const KEY_PAGE_HEADER_IMAGE = 'page_header_image';
    const KEY_PAGE_HEADER_BOTH_NAVS = 'page_header_both_navs';
    const KEY_PICTURE_INFO = 'picture_info';
    const KEY_PHOTOSWIPE = 'photoswipe';
    const KEY_PHOTOSWIPE_INTERVAL = 'photoswipe_interval';
    const KEY_PHOTOSWIPE_METADATA = 'photoswipe_metadata';
    const KEY_THUMBNAIL_LINKTO = 'thumbnail_linkto';
    const KEY_THUMBNAIL_CAPTION = 'thumbnail_caption';
    const KEY_THUMBNAIL_DESC = 'thumbnail_desc';
    const KEY_THUMBNAIL_CAT_DESC = 'thumbnail_cat_desc';
    const KEY_CATEGORY_WELLS = 'category_wells';
    const KEY_LOGO_IMAGE_ENABLED = 'logo_image_enabled';
    const KEY_LOGO_IMAGE_PATH = 'logo_image_path';
    const KEY_QUICKSEARCH_NAVBAR = 'quicksearch_navbar';
    const KEY_CAT_DESCRIPTIONS = 'cat_descriptions';
    const KEY_CAT_NB_IMAGES = 'cat_nb_images';

    const KEY_SOCIAL_ENABLED = 'social_enabled';
    const KEY_SOCIAL_BUTTONS = 'social_buttons';
    const KEY_SOCIAL_TWITTER = 'social_twitter';
    const KEY_SOCIAL_FACEBOOK = 'social_facebook';
    const KEY_SOCIAL_GOOGLE_PLUS = 'social_google_plus';
    const KEY_SOCIAL_PINTEREST = 'social_pinterest';
    const KEY_SOCIAL_VK = 'social_vk';

    const KEY_COMMENTS_TYPE = 'comments_type';
    const KEY_COMMENTS_DISQUS_SHORTNAME = 'comments_disqus_shortname';
    const KEY_TAG_CLOUD_TYPE = 'tag_cloud_type';

    const KEY_CUSTOM_CSS = 'custom_css';

    private $defaults = array(
        self::KEY_FLUID_WIDTH => false,
        self::KEY_FLUID_WIDTH_COL_XXL => true,
        self::KEY_BOOTSTRAP_THEME => 'material-darkroom',
        self::KEY_BOOTSWATCH_THEME => 'cerulean',
        self::KEY_MATERIAL_COLOR => 'teal',
        self::KEY_NAVBAR_MAIN_STYLE => 'navbar-dark',
        self::KEY_NAVBAR_MAIN_BG => 'bg-dark',
        self::KEY_NAVBAR_CONTEXTUAL_STYLE => 'navbar-dark',
        self::KEY_NAVBAR_CONTEXTUAL_BG => 'bg-primary',
        self::KEY_SLICK_ENABLED => true,
        self::KEY_SLICK_LAZYLOAD => 'ondemand',
        self::KEY_SLICK_INFINITE => false,
        self::KEY_SLICK_CENTERED => false,
        self::KEY_PAGE_HEADER => 'jumbotron',
        self::KEY_PAGE_HEADER_FULL => false,
        self::KEY_PAGE_HEADER_IMAGE => '',
        self::KEY_PAGE_HEADER_BOTH_NAVS => true,
        self::KEY_PICTURE_INFO => 'cards',
        self::KEY_PHOTOSWIPE => true,
        self::KEY_PHOTOSWIPE_INTERVAL => '3500',
        self::KEY_PHOTOSWIPE_METADATA => false,
        self::KEY_THUMBNAIL_LINKTO => 'picture',
        self::KEY_THUMBNAIL_CAPTION => true,
        self::KEY_THUMBNAIL_DESC => false,
        self::KEY_THUMBNAIL_CAT_DESC => 'simple',
        self::KEY_CATEGORY_WELLS => 'never',
        self::KEY_LOGO_IMAGE_ENABLED => false,
        self::KEY_LOGO_IMAGE_PATH => '',
        self::KEY_QUICKSEARCH_NAVBAR => false,
        self::KEY_CAT_DESCRIPTIONS => false,
        self::KEY_CAT_NB_IMAGES => true,
        self::KEY_SOCIAL_ENABLED => true,
        self::KEY_SOCIAL_BUTTONS => false,
        self::KEY_SOCIAL_TWITTER => true,
        self::KEY_SOCIAL_FACEBOOK => true,
        self::KEY_SOCIAL_GOOGLE_PLUS => true,
        self::KEY_SOCIAL_PINTEREST => true,
        self::KEY_SOCIAL_VK => true,
        self::KEY_COMMENTS_TYPE => 'piwigo',
        self::KEY_COMMENTS_DISQUS_SHORTNAME => null,
        self::KEY_TAG_CLOUD_TYPE => 'basic',
        self::KEY_CUSTOM_CSS => null,
    );

    private $types = array(
        self::KEY_FLUID_WIDTH => self::TYPE_BOOL,
        self::KEY_FLUID_WIDTH_COL_XXL => self::TYPE_BOOL,
        self::KEY_BOOTSTRAP_THEME => self::TYPE_STRING,
        self::KEY_BOOTSWATCH_THEME => self::TYPE_STRING,
        self::KEY_MATERIAL_COLOR => self::TYPE_STRING,
        self::KEY_NAVBAR_MAIN_STYLE => self::TYPE_STRING,
        self::KEY_NAVBAR_MAIN_BG => self::TYPE_STRING,
        self::KEY_NAVBAR_CONTEXTUAL_STYLE => self::TYPE_STRING,
        self::KEY_NAVBAR_CONTEXTUAL_BG => self::TYPE_STRING,
        self::KEY_SLICK_ENABLED => self::TYPE_BOOL,
        self::KEY_SLICK_LAZYLOAD => self::TYPE_STRING,
        self::KEY_SLICK_INFINITE => self::TYPE_BOOL,
        self::KEY_SLICK_CENTERED => self::TYPE_BOOL,
        self::KEY_PAGE_HEADER => self::TYPE_STRING,
        self::KEY_PAGE_HEADER_FULL => self::TYPE_BOOL,
        self::KEY_PAGE_HEADER_IMAGE => self::TYPE_STRING,
        self::KEY_PAGE_HEADER_BOTH_NAVS => self::TYPE_BOOL,
        self::KEY_PICTURE_INFO => self::TYPE_STRING,
        self::KEY_PHOTOSWIPE => self::TYPE_BOOL,
        self::KEY_PHOTOSWIPE_INTERVAL => self::TYPE_NUM,
        self::KEY_PHOTOSWIPE_METADATA => self::TYPE_BOOL,
        self::KEY_THUMBNAIL_LINKTO => self::TYPE_STRING,
        self::KEY_THUMBNAIL_CAPTION => self::TYPE_BOOL,
        self::KEY_THUMBNAIL_DESC => self::TYPE_BOOL,
        self::KEY_THUMBNAIL_CAT_DESC => self::TYPE_STRING,
        self::KEY_CATEGORY_WELLS => self::TYPE_STRING,
        self::KEY_LOGO_IMAGE_ENABLED => self::TYPE_BOOL,
        self::KEY_LOGO_IMAGE_PATH => self::TYPE_STRING,
        self::KEY_QUICKSEARCH_NAVBAR => self::TYPE_BOOL,
        self::KEY_CAT_DESCRIPTIONS => self::TYPE_BOOL,
        self::KEY_CAT_NB_IMAGES => self::TYPE_BOOL,
        self::KEY_SOCIAL_ENABLED => self::TYPE_BOOL,
        self::KEY_SOCIAL_BUTTONS => self::TYPE_BOOL,
        self::KEY_SOCIAL_TWITTER => self::TYPE_BOOL,
        self::KEY_SOCIAL_FACEBOOK => self::TYPE_BOOL,
        self::KEY_SOCIAL_GOOGLE_PLUS => self::TYPE_BOOL,
        self::KEY_SOCIAL_PINTEREST => self::TYPE_BOOL,
        self::KEY_SOCIAL_VK => self::TYPE_BOOL,
        self::KEY_COMMENTS_TYPE => self::TYPE_STRING,
        self::KEY_COMMENTS_DISQUS_SHORTNAME => self::TYPE_STRING,
        self::KEY_TAG_CLOUD_TYPE => self::TYPE_STRING,
        self::KEY_CUSTOM_CSS => self::TYPE_FILE,
    );

    private $config = array();

    private $files = array();

    public function __construct() {
        global $conf;

        // Initialise the files array
        $this->initFiles();

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

    private function initFiles() {
        $this->files[self::KEY_CUSTOM_CSS] = PHPWG_ROOT_PATH . PWG_LOCAL_DIR . 'bootstrap_darkroom/custom.css';
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
                case self::TYPE_FILE:
                    $this->saveFile($key, $value);
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
                case self::TYPE_FILE:
                    return $this->loadFile($key);
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
    private function saveFile($key, $content) {
        $file = $this->files[$key];
        $dir = dirname($file);
        if (!file_exists($dir)) {
            mkdir($dir, 0755, true);
        }
        if (empty($content) && file_exists($file)) {
            unlink($file);
        } else {
            file_put_contents($file, $content);
        }
    }
                                                                                                                                                                                                   
    private function loadFile($key) {
        $file = $this->files[$key];
        if (file_exists($file)) {
            return file_get_contents($file);
        } else {
            return null;
        }
    }
}
?>
