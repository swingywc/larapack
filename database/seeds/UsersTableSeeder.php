<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            [
                'id' => 1,
                'name' => env('WEBMASTER_NAME'),
                'email' => env('WEBMASTER_EMAIL'),
                'password' => bcrypt(env('WEBMASTER_PASSWORD')),
                'is_backend_user' => true,
            ],
            [
                'id' => 2,
                'name' => env('ADMIN_NAME'),
                'email' => env('ADMIN_EMAIL'),
                'password' => bcrypt(env('ADMIN_PASSWORD')),
                'is_backend_user' => true,
            ],
        ]);
    }
}
