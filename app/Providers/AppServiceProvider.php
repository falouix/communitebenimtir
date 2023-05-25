<?php

namespace App\Providers;

use App\Lien;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use TCG\Voyager\Models\Menu;
use TCG\Voyager\Facades\Voyager;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Voyager::addAction(\App\Actions\StateAction::class);
        Voyager::addAction(\App\Actions\EtatReclamationAction::class);
        Voyager::addAction(\App\Actions\ConsulterAction::class);
        Voyager::addAction(\App\Actions\SatisfaiteAction::class);
        Voyager::addAction(\App\Actions\NonSatisfaiteAction::class);
        Voyager::addAction(\App\Actions\ConsulterDemandeAction::class);
        Voyager::addAction(\App\Actions\LivrerDocsAction::class);
        Voyager::addAction(\App\Actions\RefuserDocsAction::class);
        //Voyager::addAction(\App\Actions\ConsulterMessagPriveeAction::class);
        view()->composer('*', function ($view) {
            $locale = LaravelLocalization::getCurrentLocale();
            $frontMenu = Menu::display('menu', '_json');
            $listLiensUtile = lien::where('afficher_dans', '=', 'footer')
                ->orderBy('ordre')
                ->get();
            $statement = 'SELECT max(UPDATE_TIME) AS \'lastDate\'
            FROM   information_schema.tables
            WHERE  TABLE_SCHEMA = \'' . env('DB_DATABASE') . '\';';
            $dateDernierMaj = \DB::select(\DB::raw($statement));
            $pull="pull-left";
            $pull_right="pull-right";
            $navbar = "navbar-left";
            $left="left";
            $right="right";
            if($locale=="fr")
            {
            $left="right";
            $right="left";
            $pull="pull-right";
            $navbar = "navbar-right";
            $pull_right="pull-left";
            }
            $public_url='';
            $titre = 'titre_' . $locale;
            $service = 'service_' . $locale;
            $lieu = 'lieu_' . $locale;
            $description = 'description_' . $locale;
            $descriptionStatistique = 'Description_' . $locale;
            $contenu = 'contenu_' . $locale;
            $titrepiece = 'titrepiece_' . $locale;
            $libelle = 'libelle_' . $locale;
            $adresse = 'adresse_' . $locale;
            $titreTexteJuridique = 'type_' . $locale;
            $texteJuridique = 'texte_juridique_' . $locale;
            $titreThemeJuridique = 'theme_' . $locale;
            $year = date('Y', strtotime(today()));
            $view->with('dateDernierMaj', $dateDernierMaj)
                ->with('locale', $locale)
                ->with('frontMenu', $frontMenu)
                ->with('listLiensUtile', $listLiensUtile)
                ->with('titre',$titre)
                ->with('libelle',$libelle)
                ->with('service',$service)
                ->with('description',$description)
                ->with('contenu',$contenu)
                ->with('lieu',$lieu)
                ->with('adresse',$adresse)
                ->with('titrepiece',$titrepiece)
                ->with('contenu',$contenu)
                ->with('descriptionStatistique',$descriptionStatistique)
                ->with('titreTexteJuridique',$titreTexteJuridique)
                ->with('texteJuridique',$texteJuridique)
                ->with('titreThemeJuridique',$titreThemeJuridique)
                ->with('pull',$pull)
                ->with('pull_right',$pull_right)
                ->with('year',$year)
                ->with('right',$right)
                ->with('public_url',$public_url)
                ->with('left',$left)
                ->with('navbar',$navbar);
        });
    }
}