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
                'guard_name' => 'web',
            ],
            [
                'id' => 2,
                'name' => 'Administrator',
                'guard_name' => 'web',
            ],
            [
                'id' => 3,
                'name' => 'Member',
                'guard_name' => 'web',
            ],
        ]);
    }
}
