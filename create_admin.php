<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$user = App\Models\User::where('email', 'admin@gmail.com')->first();
if (!$user) {
    $user = new App\Models\User();
    $user->email = 'admin@gmail.com';
}
$user->name = 'Lumina Admin';
$user->password = Illuminate\Support\Facades\Hash::make('admin123');
$user->role = 'admin';
$user->save();

echo "ADMIN_ACCOUNT_READY_ID_" . $user->id;
