<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('permissions')->insert([
            [
                'id' => 1,
                'name' => 'Users Edit Rights',
                'guard_name' => 'web',
            ],
            [
                'id' => 2,
                'name' => 'Content Edit Rights',
                'guard_name' => 'web',
            ],
            [   'id' => 3,
                'name' => 'Backups and Logs Edit Rights',
                'guard_name' => 'web',
            ],
        ]);
    }
}
