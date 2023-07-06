<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Storage;
use File;
use Carbon;

class BackupTidy extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'backup:tidy';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove backup files that are over one month old.';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $files = File::files(storage_path('backups'));
      //  $this->info(Storage::disk('local'));

        foreach($files as $file){

            $modified = File::lastModified($file);
            $this->info($file);
            $date     = Carbon\Carbon::createFromTimestampUTC($modified);
            $this->info($date);
            if($date < Carbon\Carbon::now()->subMonth(1)){

                Storage::delete($file);

                $this->info("Deleted " . $file);

            }

        }

    }
}
