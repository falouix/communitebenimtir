<?php

namespace App\Console\Commands;

use Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use Mail;
use File;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;

class BackupDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'backup:database';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Run backup (mysqldump) on database and upload to backups';
    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        if (!is_dir(storage_path('backups'))) {
            mkdir(storage_path('backups'));
        }

        $filename = "backup-" . Carbon\Carbon::now()->format('Y-m-d') . ".sql";
        $this->process = new Process(sprintf(
            'mysqldump  --compact %s -u%s -p%s %s > %s',
            "--add-drop-database --databases",
            config('database.connections.mysql.username'),
            config('database.connections.mysql.password'),
            config('database.connections.mysql.database'),
            storage_path("backups/{$filename}")
        ));
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        try {
            $this->process->mustRun();
            $filename = "backup-" . Carbon\Carbon::now()->format('Y-m-d') . ".sql";
//$f = "$filename.txt";

            // read into array
            $arr = file(storage_path("backups/{$filename}"));

            // edit first line
            $arr[0] = "DROP DATABASE IF EXISTS `bdd_mar`;";
            $arr[4] = "SET FOREIGN_KEY_CHECKS=0;";

            // write back to file
            file_put_contents(storage_path("backups/{$filename}"), implode($arr));
        } catch (ProcessFailedException $ex) {
           // test git
            Log::error($ex);
            $this->info('There has been an error backing up the database.');
            Log::error('There has been an error backing up the database.');
            Mail::raw('There has been an error backing up the database.', function ($message) {
                $message->to("echedli1@gmail.com", "Chedli")->subject("Backup Error" . $ex);
            });
        }

    }
}
