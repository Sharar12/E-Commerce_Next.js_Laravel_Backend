<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$user = App\Models\User::where('email', 'A@gmail.com')->first();
if (!$user) {
    $user = new App\Models\User();
    $user->email = 'A@gmail.com';
}
$user->name = 'Customer A';
$user->password = Illuminate\Support\Facades\Hash::make('11111111');
$user->role = 'customer';
$user->save();

echo "CUSTOMER_CREATED_ID_" . $user->id;
