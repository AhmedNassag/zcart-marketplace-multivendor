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
 namespace App\Http\Controllers\Installer; use App\Http\Controllers\Installer\Helpers\EnvironmentManager; use Illuminate\Http\Request; use Illuminate\Routing\Controller; use Illuminate\Routing\Redirector; use Validator; class EnvironmentController extends Controller { protected $EnvironmentManager; public function __construct(EnvironmentManager $environmentManager) { $this->EnvironmentManager = $environmentManager; } public function environmentMenu() { return view("\151\x6e\x73\x74\x61\x6c\x6c\145\162\x2e\145\x6e\x76\151\x72\157\156\155\145\x6e\164"); } public function environmentWizard() { } public function environmentClassic() { $envConfig = $this->EnvironmentManager->getEnvContent(); return view("\151\x6e\x73\164\x61\x6c\x6c\x65\x72\x2e\145\x6e\166\x69\x72\157\x6e\x6d\145\x6e\164\x2d\x63\154\141\163\x73\151\x63", compact("\145\x6e\166\103\x6f\x6e\x66\x69\147")); } public function saveClassic(Request $input, Redirector $redirect) { $message = $this->EnvironmentManager->saveFileClassic($input); return $redirect->route("\x49\x6e\x73\164\141\x6c\x6c\145\x72\x2e\145\x6e\x76\x69\x72\157\x6e\155\x65\x6e\164\x43\154\141\x73\x73\151\143")->with(["\x6d\x65\x73\163\x61\147\145" => $message]); } }
