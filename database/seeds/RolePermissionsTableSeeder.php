<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class RolePermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('role_has_permissions')->insert([
        ]);
    }
}
