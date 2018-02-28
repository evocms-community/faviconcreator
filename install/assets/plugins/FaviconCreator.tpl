//<?php
/**
 * FaviconCreator
 * 
 * Creates favicon from uploaded image in ClientSettings
 *
 * @category    plugin
 * @version     1.0.0
 * @author      mnoskov
 * @internal    @properties &field=Field name;text;favicon &sizes=Sizes;text;16,32,64
 * @internal    @events OnBeforeClientSettingsSave 
 * @internal    @modx_category Manager and Admin
 * @internal    @installset base,sample
 */

$e = &$modx->event;

switch ($e->name) {
    case 'OnBeforeClientSettingsSave': {
        if (!empty($params['fields'][$params['field']])) {
            $value = &$params['fields'][$params['field']][1];
            $value = strtolower(trim($value, '/'));

            $source = MODX_BASE_PATH . '/' . $value;
            $target = MODX_BASE_PATH . '/favicon.ico';
            
            if (!file_exists($source)) {
                return;
            }
            
            $ext = pathinfo($value, PATHINFO_EXTENSION);
            
            // if it's not an icon, converting it
            if ($ext != 'ico') {
                include_once MODX_BASE_PATH . 'assets/lib/class-php-ico.php';

                $sizes = [];

                foreach (explode(',', $params['sizes']) as $size) {
                    if (is_numeric($size)) {
                        $sizes[] = [$size, $size];
                    }
                }
                
                $ico = new PHP_ICO($source, $sizes);
                $ico->save_ico($target); 
                $value = 'favicon.ico';
                unset($value);
                return;
            }
            
            // else if it's not in the root, then moving it to root
            if ($value != 'favicon.ico') {
                rename($source, $target);
                $value = 'favicon.ico';
            }
            
            unset($value);
        }

        return;
    }
}
