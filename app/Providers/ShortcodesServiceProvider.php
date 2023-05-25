<?php

namespace App\Providers;
use App\Shortcodes\PanelShortcode;

use Illuminate\Support\ServiceProvider;

class ShortcodesServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        Shortcode::register('panel', PanelShortcode::class);
    }
}