<?php
/*   __________________________________________________
    |  Obfuscated by YAK Pro - Php Obfuscator  2.0.14  |
    |              on 2023-10-02 21:21:44              |
    |    GitHub: https://github.com/pk-fr/yakpro-po    |
    |__________________________________________________|
*/
/*
* Copyright (C) Incevio Systems, Inc - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
* Written by Munna Khan <help.zcart@gmail.com>, September 2018
*/
 namespace App\Http\Controllers\Installer\Helpers; use Illuminate\Support\Facades\DB; trait MigrationsHelper { public function getMigrations() { $migrations = glob(database_path() . DIRECTORY_SEPARATOR . "\155\151\147\x72\x61\x74\151\x6f\x6e\x73" . DIRECTORY_SEPARATOR . "\x2a\56\x70\x68\x70"); return str_replace("\56\160\x68\160", '', $migrations); } public function getExecutedMigrations() { return DB::table("\155\151\x67\x72\141\164\151\157\156\163")->get()->pluck("\x6d\151\147\x72\x61\164\x69\157\156"); } }
