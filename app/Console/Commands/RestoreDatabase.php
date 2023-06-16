<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Storage;
use File;

class RestoreDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'backup:restore';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Restore Database backup';

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

        $i = 0;
        foreach($files as $file){

            $filename[$i]['file'] = $file;

            $i++;

        }

        $headers = ['File Name'];
        $this->table($headers, $filename);

        $backupFilename = $this->ask('Which file would you like to restore?');
        $this->info("Backup file name : ".$filename[$backupFilename-1]['file']);
        //$getBackupFile  = Storage::delete($backupFilename);
        $backupFilename = $filename[$backupFilename-1]['file'];
           //mysql command to restore backup from the selected sql file
        $command = "mysql --user=" . env('DB_USERNAME')
                ." --password=" . env('DB_PASSWORD')
                . " --host=" . env('DB_HOST') . " "
                . env('DB_DATABASE') . " < " . $backupFilename . "";
            $this->info("Restore Command : ".$command);
        if ($this->confirm("Are you sure you want to restore the database? [y|N]")) {

            $returnVar  = NULL;
            $output     = NULL;
            exec($command, $output, $returnVar);

            if(!$returnVar){

                $this->info('Database Restored');

            }else{

                $this->error($returnVar);

            }

        }

    }
}
