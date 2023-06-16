<?php
namespace App\Shortcodes;

class PanelShortcode {

public function custom($shortcode, $content, $compiler, $name, $viewData)
{
    
return sprintf('<h3 class=\"line-bottom-theme-colored-3\">%s</h3>', $shortcode->class, $content);
}

}