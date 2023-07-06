<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ArchiveCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'archive:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Run archive functionnality';

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
        \Log::info("Cron is working fine!");
        // Handle th function of archive

    }
}
