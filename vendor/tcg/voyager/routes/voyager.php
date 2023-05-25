<?php

use Illuminate\Support\Str;
use TCG\Voyager\Events\Routing;
use TCG\Voyager\Events\RoutingAdmin;
use TCG\Voyager\Events\RoutingAdminAfter;
use TCG\Voyager\Events\RoutingAfter;
use TCG\Voyager\Facades\Voyager;

/*
|--------------------------------------------------------------------------
| Voyager Routes
|--------------------------------------------------------------------------
|
| This file is where you may override any of the routes that are included
| with Voyager.
|
*/

Route::group(['as' => 'voyager.'], function () {
    event(new Routing());

    $namespacePrefix = '\\'.config('voyager.controllers.namespace').'\\';

    Route::get('login', ['uses' => $namespacePrefix.'VoyagerAuthController@login',     'as' => 'login']);
    Route::post('login', ['uses' => $namespacePrefix.'VoyagerAuthController@postLogin', 'as' => 'postlogin']);
    //Route::post('RepondreReclamation',['uses' => $namespacePrefix.'ReclamationController@RepondreReclamation', 'as' => 'RepondreReclamation']);


    Route::group(['middleware' => 'admin.user'], function () use ($namespacePrefix) {
        event(new RoutingAdmin());

        // Main Admin and Logout Route
        Route::get('/', ['uses' => $namespacePrefix.'VoyagerController@index',   'as' => 'dashboard']);
        Route::post('logout', ['uses' => $namespacePrefix.'VoyagerController@logout',  'as' => 'logout']);
        Route::post('upload', ['uses' => $namespacePrefix.'VoyagerController@upload',  'as' => 'upload']);


        Route::get('profile', ['uses' => $namespacePrefix.'VoyagerUserController@profile', 'as' => 'profile']);
         //Actualite
         /*Route::get('/actualites/indexArchive', ['uses' => $namespacePrefix.'ActualiteBackController@indexArchive', 'as' => 'indexArchive']);
         Route::get('/actualites/indexAttente', ['uses' => $namespacePrefix.'ActualiteBackController@indexAttente', 'as' => 'indexAttente']);*/

        try {
            foreach (Voyager::model('DataType')::all() as $dataType) {
                $breadController = $dataType->controller
                                 ? Str::start($dataType->controller, '\\')
                                 : $namespacePrefix.'VoyagerBaseController';

                Route::get($dataType->slug.'/order', $breadController.'@order')->name($dataType->slug.'.order');
                Route::post($dataType->slug.'/action', $breadController.'@action')->name($dataType->slug.'.action');
                Route::post($dataType->slug.'/order', $breadController.'@update_order')->name($dataType->slug.'.order');
                Route::get($dataType->slug.'/{id}/restore', $breadController.'@restore')->name($dataType->slug.'.restore');
                Route::get($dataType->slug.'/relation', $breadController.'@relation')->name($dataType->slug.'.relation');
                Route::get($dataType->slug.'/indexArchive', $breadController.'@indexArchive')->name($dataType->slug.'.indexArchive');
                Route::get($dataType->slug.'/indexAttente', $breadController.'@indexAttente')->name($dataType->slug.'.indexAttente');
                Route::get($dataType->slug.'/ComposantAccueil', $breadController.'@ComposantAccueil')->name($dataType->slug.'.ComposantAccueil');
                Route::get($dataType->slug.'/download', $breadController.'@download')->name($dataType->slug.'.file.download');
                //CITOYEN
                Route::get($dataType->slug.'/{id}/ModifEtat', $namespacePrefix.'CitoyensController@ModifEtat')->name($dataType->slug.'.ModifEtat');
                //RECLAMATION
                Route::get($dataType->slug.'/{id}/EtatRecl', $namespacePrefix.'ReclamationController@EtatRecl')->name($dataType->slug.'.EtatRecl');
                Route::get($dataType->slug.'/{id}/ConsulterReclamation', $namespacePrefix.'ReclamationController@ConsulterReclamation')->name($dataType->slug.'.ConsulterReclamation');
                Route::post($dataType->slug.'/RepondreReclamation', $namespacePrefix.'ReclamationController@RepondreReclamation')->name($dataType->slug.'.RepondreReclamation');
                //MESSAGE PRIVEE
                Route::get($dataType->slug.'/{id}/ConsulterMessage', $namespacePrefix.'MessagePriveeController@ConsulterMessage')->name($dataType->slug.'.ConsulterMessage');
                Route::post($dataType->slug.'/RepondreMessage', $namespacePrefix.'MessagePriveeController@RepondreMessage')->name($dataType->slug.'.RepondreMessage');
                //demande d'acces CitoyensController
                Route::get($dataType->slug.'/DemandeAcces', $namespacePrefix.'DemandeAccesController@index')->name($dataType->slug.'.index');
                Route::get($dataType->slug.'/{id}/EtatDemandeAcces', $namespacePrefix.'DemandeAccesController@EtatDemandeAcces')->name($dataType->slug.'.EtatDemandeAcces');
                Route::get($dataType->slug.'/{id}/ConsulterDemande', $namespacePrefix.'DemandeAccesController@ConsulterDemande')->name($dataType->slug.'.ConsulterDemande');
                Route::post($dataType->slug.'/RepondreDemandeAcces', $namespacePrefix.'DemandeAccesController@RepondreDemandeAcces')->name($dataType->slug.'.RepondreDemandeAcces');
                //Demande docs
                Route::get($dataType->slug.'/{id}/EtatDemandeDocs', $namespacePrefix.'DemandeDocsController@EtatDemandeDocs')->name($dataType->slug.'.EtatDemandeDocs');
                //RECHERCHE  ChercherParEtat
                Route::get($dataType->slug.'/ChercherParPeriodeDocs', $namespacePrefix.'DemandeDocsController@ChercherParPeriodeDocs')->name($dataType->slug.'.ChercherParPeriodeDocs');
                Route::get($dataType->slug.'/ChercherParEtat', $namespacePrefix.'CitoyensController@ChercherParEtat')->name($dataType->slug.'.ChercherParEtat');
                Route::get($dataType->slug.'/ChercherParPeriode', $namespacePrefix.'ReclamationController@ChercherParPeriode')->name($dataType->slug.'.ChercherParPeriode');
                Route::get($dataType->slug.'/ChercherParPeriode', $namespacePrefix.'MessagePriveeController@ChercherParPeriode')->name($dataType->slug.'.ChercherParPeriode');
                //Dénonciation
                Route::get($dataType->slug.'/{id}/ConsulterDenonciation', $namespacePrefix.'DenonciationController@ConsulterDenonciation')->name($dataType->slug.'.ConsulterDenonciation');
                Route::resource($dataType->slug, $breadController);
            }
        } catch (\InvalidArgumentException $e) {
            throw new \InvalidArgumentException("Custom routes hasn't been configured because: ".$e->getMessage(), 1);
        } catch (\Exception $e) {
            // do nothing, might just be because table not yet migrated.
        }

        // Role Routes
        Route::resource('roles', $namespacePrefix.'VoyagerRoleController');

        // Menu Routes
        Route::group([
            'as'     => 'menus.',
            'prefix' => 'menus/{menu}',
        ], function () use ($namespacePrefix) {
            Route::get('builder', ['uses' => $namespacePrefix.'VoyagerMenuController@builder',    'as' => 'builder']);
            Route::post('order', ['uses' => $namespacePrefix.'VoyagerMenuController@order_item', 'as' => 'order']);

            Route::group([
                'as'     => 'item.',
                'prefix' => 'item',
            ], function () use ($namespacePrefix) {
                Route::delete('{id}', ['uses' => $namespacePrefix.'VoyagerMenuController@delete_menu', 'as' => 'destroy']);
                Route::post('/', ['uses' => $namespacePrefix.'VoyagerMenuController@add_item',    'as' => 'add']);
                Route::put('/', ['uses' => $namespacePrefix.'VoyagerMenuController@update_item', 'as' => 'update']);
            });
        });

        // Settings
        Route::group([
            'as'     => 'settings.',
            'prefix' => 'settings',
        ], function () use ($namespacePrefix) {
            Route::get('/', ['uses' => $namespacePrefix.'VoyagerSettingsController@index',        'as' => 'index']);
            Route::post('/', ['uses' => $namespacePrefix.'VoyagerSettingsController@store',        'as' => 'store']);
            Route::put('/', ['uses' => $namespacePrefix.'VoyagerSettingsController@update',       'as' => 'update']);
            Route::delete('{id}', ['uses' => $namespacePrefix.'VoyagerSettingsController@delete',       'as' => 'delete']);
            Route::get('{id}/move_up', ['uses' => $namespacePrefix.'VoyagerSettingsController@move_up',      'as' => 'move_up']);
            Route::get('{id}/move_down', ['uses' => $namespacePrefix.'VoyagerSettingsController@move_down',    'as' => 'move_down']);
            Route::put('{id}/delete_value', ['uses' => $namespacePrefix.'VoyagerSettingsController@delete_value', 'as' => 'delete_value']);
        });

        // Admin Media
        Route::group([
            'as'     => 'media.',
            'prefix' => 'media',
        ], function () use ($namespacePrefix) {
            Route::get('/', ['uses' => $namespacePrefix.'VoyagerMediaController@index',              'as' => 'index']);
            Route::post('files', ['uses' => $namespacePrefix.'VoyagerMediaController@files',              'as' => 'files']);
            Route::post('new_folder', ['uses' => $namespacePrefix.'VoyagerMediaController@new_folder',         'as' => 'new_folder']);
            Route::post('delete_file_folder', ['uses' => $namespacePrefix.'VoyagerMediaController@delete', 'as' => 'delete']);
            Route::post('move_file', ['uses' => $namespacePrefix.'VoyagerMediaController@move',          'as' => 'move']);
            Route::post('rename_file', ['uses' => $namespacePrefix.'VoyagerMediaController@rename',        'as' => 'rename']);
            Route::post('upload', ['uses' => $namespacePrefix.'VoyagerMediaController@upload',             'as' => 'upload']);
            Route::post('remove', ['uses' => $namespacePrefix.'VoyagerMediaController@remove',             'as' => 'remove']);
            Route::post('crop', ['uses' => $namespacePrefix.'VoyagerMediaController@crop',             'as' => 'crop']);
        });



        // BREAD Routes
        Route::group([
            'as'     => 'bread.',
            'prefix' => 'bread',
        ], function () use ($namespacePrefix) {
            Route::get('/', ['uses' => $namespacePrefix.'VoyagerBreadController@index',              'as' => 'index']);
            Route::get('{table}/create', ['uses' => $namespacePrefix.'VoyagerBreadController@create',     'as' => 'create']);
            Route::post('/', ['uses' => $namespacePrefix.'VoyagerBreadController@store',   'as' => 'store']);
            Route::get('{table}/edit', ['uses' => $namespacePrefix.'VoyagerBreadController@edit', 'as' => 'edit']);
            Route::put('{id}', ['uses' => $namespacePrefix.'VoyagerBreadController@update',  'as' => 'update']);
            Route::delete('{id}', ['uses' => $namespacePrefix.'VoyagerBreadController@destroy',  'as' => 'delete']);
            Route::post('relationship', ['uses' => $namespacePrefix.'VoyagerBreadController@addRelationship',  'as' => 'relationship']);
            Route::get('delete_relationship/{id}', ['uses' => $namespacePrefix.'VoyagerBreadController@deleteRelationship',  'as' => 'delete_relationship']);
        });

        // Database Routes
        Route::resource('database', $namespacePrefix.'VoyagerDatabaseController');

        // Compass Routes
        Route::group([
            'as'     => 'compass.',
            'prefix' => 'compass',
        ], function () use ($namespacePrefix) {
            Route::get('/', ['uses' => $namespacePrefix.'VoyagerCompassController@index',  'as' => 'index']);
            Route::post('/', ['uses' => $namespacePrefix.'VoyagerCompassController@index',  'as' => 'post']);
        });

        event(new RoutingAdminAfter());
    });

    //Asset Routes
    Route::get('voyager-assets', ['uses' => $namespacePrefix.'VoyagerController@assets', 'as' => 'voyager_assets']);

    event(new RoutingAfter());
});