<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Role::insert([
            [
                'name' => 'Admin',
                'description' => 'Usuário admin',
            ],
            [
                'name' => 'Vendedor',
                'description' => 'Usuário vendedor',
            ],
            [
                'name' => 'Cliente',
                'description' => 'Usuário cliente',
            ]
        ]);
    }
}
