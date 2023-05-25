<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

////////////////////// LOcalization package ///////////////////
Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
    ],
    function()
   {
    Route::get('/', 'HomeController@index')->name('home');
    Route::resource('/actualites', 'ActualiteFrontController');
  //  Route::resource('/faqs', 'FaqFrontController');
    Route::resource('/evenements', 'EvenementFrontController');
    Route::resource('/media', 'EvenementFrontController');
    Route::resource('/appelsOffres', 'AppelsOffreFrontController');
    Route::resource('/pages', 'PageFrontController');
    Route::get('/pages/details/{slug}', 'PageFrontController@details');
    Route::resource('/galleries', 'GalleryFrontController');
    Route::resource('/types', 'TypeFrontController');
    Route::resource('/themes', 'ThemeFrontController');
    Route::resource('/contact', 'ContactFrontController');
    Route::any('/send-email','ContactFrontController@sendEmail')->name('contact.front');
    Route::any('/search','SearchController@searchTous');
   /*
    Route::get('/denonciation','DenonciationController@index');
    Route::get('/denonciation-PersoPhysique','DenonciationController@indexPersoPhysique');
    Route::get('/denonciation-PersoMorale','DenonciationController@indexPersoMorale');
    Route::post('/denonciation-PersoPhysique','DenonciationController@creerDenonciationPersoPhysique');
    Route::post('/denonciation-PersoMorale','DenonciationController@creerDenonciationPersoMorale');
    */
    Route::post('/','NewsLetterController@abonner');
    Route::resource('/conseil-municipal', 'ConseilMunicipalFrontController');
    Route::resource('/finance', 'FinanceFrontController');
    Route::resource('/projets-realisations', 'ProjetFrontController');
    Route::resource('/budget-participatif', 'BudgetParticipatifFrontController');
    Route::resource('/protection-socio-environemental', 'ProtectionSocioEnviFrontController');
    Route::resource('/travauxassociations', 'ArticlesTravauxAssociationController');
});
Route::get('/refreshcaptcha','DenonciationController@refreshcaptcha');
Route::get('/getData/{id}','HomeController@getData');
Route :: get('/getAllActualites', 'ActualiteFrontController@getAllActualites');
Route :: get('/getAllEvents', 'EvenementFrontController@getAllEvent');
Route :: get('/getAllLiensHeader', 'HomeController@getAllLiensHeader');

Route::get('/clear-cache', function() {
    $exitCode = Artisan::call('config:clear');
    $exitCode = Artisan::call('cache:clear');
    $exitCode = Artisan::call('config:cache');
    $exitCode = Artisan::call('storage:link');
    return 'DONE'; //Return anything
});

Route::group(['prefix' => 'admin'], function () {
     Route::get('messagesprivates/ConsulterMessage','Voyager\messagesprivatesController@ConsulterMessage')->name('messagesprivates.ConsulterMessage');
     Route::post('File/Upload','Voyager\FileController@Upload')->name('File.Upload');
    Voyager::routes();
});

Route::prefix('citoyen')->group(function() {
           Route::get('/refreshcaptcha','Auth\CitoyenLoginController@refreshCaptcha');
           Route::get('/login','Auth\CitoyenLoginController@showLoginForm')->name('citoyen.login');
           Route::get('/register','Auth\CitoyenLoginController@showRegisterForm')->name('citoyen.register');
           Route::get('/reset','Auth\CitoyenLoginController@showMDPOubliee')->name('citoyen.motDePasseOubliee');
           Route::get('/reset/{token}','Auth\CitoyenLoginController@showUpdatePassword')->name('citoyen.showUpdatePassword');

           Route::post('/login', 'Auth\CitoyenLoginController@login')->name('citoyen.login.submit');
           Route::post('/register','Auth\CitoyenLoginController@register')->name('citoyen.register.submit');
           Route::post('/reset','Auth\CitoyenLoginController@reset')->name('citoyen.sendmail');
           Route::post('/reset/{token}','Auth\CitoyenLoginController@UpdatePassword')->name('citoyen.UpdatePassword');

   		Route::post('logout/', 'Auth\CitoyenLoginController@logout')->name('citoyen.logout');

        Route::get('/', 'CitoyenController@index')->name('citoyen.home');

        Route::get('/download', 'DownloadsController@download')->name('citoyen.file.download');
        //reclamations
        Route::get('/reclamations', 'ReclamationController@index')->name('citoyen.reclamations');
        Route::get('/reclamations/redaction', 'ReclamationController@NvReclamation')->name('citoyen.reclamations.nouveau');
        Route::post('/reclamations/redaction','ReclamationController@creerReclamation')->name('citoyen.reclamations.nouveau.submit');
        Route::get('/reclamations/consulter/{id}', 'ReclamationController@consulter')->name('citoyen.reclamations.consulter');
        Route::post('/reclamations/consulter/{id}', 'ReclamationController@repondre')->name('citoyen.reclamations.repondre');
         //demande d'acces
        Route::get('/demandeacces', 'DemandeAccesController@index')->name('citoyen.demandeacces');
        Route::get('/demandeacces/redaction', 'DemandeAccesController@NvDemande')->name('citoyen.demandeacces.nouveau');
        Route::post('/demandeacces/redaction','DemandeAccesController@creerDemande')->name('citoyen.demandeacces.nouveau.submit');
        Route::get('/demandeacces/consulter/{id}', 'DemandeAccesController@consulter')->name('citoyen.demandeacces.consulter');
        Route::post('/demandeacces/consulter/{id}', 'DemandeAccesController@repondre')->name('citoyen.demandeacces.repondre');
        //demande document
        Route::get('/demandedocs', 'DemandeDocsController@index')->name('citoyen.demandedocs');
        Route::get('/demandedocs/redaction', 'DemandeDocsController@NvDemande')->name('citoyen.demandedocs.nouveau');
        Route::post('/demandedocs/redaction','DemandeDocsController@creerDemande')->name('citoyen.demandedocs.nouveau.submit');
        Route::get('/demandedocs/consulter/{id}', 'DemandeDocsController@consulter')->name('citoyen.demandedocs.consulter');
        //messages prive
        Route::get('/messages', 'MessageController@index')->name('citoyen.messages');
        Route::get('/messages/redaction', 'MessageController@NvMsg')->name('citoyen.messages.nouveau');
        Route::post('/messages/redaction','MessageController@creerMsg')->name('citoyen.messages.nouveau.submit');
        Route::get('/messages/consulter/{id}', 'MessageController@consulter')->name('citoyen.messages.consulter');
        Route::post('/messages/consulter/{id}', 'MessageController@repondre')->name('citoyen.messages.repondre');

      });
