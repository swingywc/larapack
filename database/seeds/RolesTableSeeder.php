<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
            [
                'id' => 1,
                'name' => 'Webmaster',
                'guard_name' => 'webmaster',
            ],
            [
                'id' => 2,
                'name' => 'Admin',
                'guard_name' => 'admin',
            ],
            [
                'id' => 3,
                'name' => 'User',
                'guard_name' => 'user',
            ]
        ]);
    }
}
