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
                'name' => env('BACKPACK_WEBMASTER_NAME'),
                'email' => env('BACKPACK_WEBMASTER_EMAIL'),
                'password' => bcrypt(env('BACKPACK_WEBMASTER_PASSWORD')),
            ]
        ]);
    }
}
