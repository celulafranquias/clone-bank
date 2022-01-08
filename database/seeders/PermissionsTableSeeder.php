<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::insert([
            [
                'name' => 'ver_menu_admin',
                'description' => 'Ver menu admin',
            ],
            [
                'name' => 'cadastrar_admin',
                'description' => 'Cadastrar admin',
            ],
            [
                'name' => 'editar_admin',
                'description' => 'Editar admin',
            ],
            [
                'name' => 'excluir_admin',
                'description' => 'Excluir admin',
            ],
            [
                'name' => 'ver_admin',
                'description' => 'Ver admin',
            ],
            [
                'name' => 'ver_menu_vendedores',
                'description' => 'Ver menu vendedores',
            ],
            [
                'name' => 'cadastrar_vendedores',
                'description' => 'Cadastrar vendedores',
            ],
            [
                'name' => 'editar_vendedores',
                'description' => 'Editar vendedores',
            ],
            [
                'name' => 'excluir_vendedores',
                'description' => 'Excluir vendedores',
            ],
            [
                'name' => 'ver_vendedores',
                'description' => 'Ver vendedores',
            ],
            [
                'name' => 'ver_menu_cliente',
                'description' => 'Ver menu cliente',
            ],
            [
                'name' => 'cadastrar_cliente',
                'description' => 'Cadastrar cliente',
            ],
            [
                'name' => 'editar_cliente',
                'description' => 'Editar cliente',
            ],
            [
                'name' => 'ver_cliente',
                'description' => 'Ver cliente',
            ],
            [
                'name' => 'excluir_cliente',
                'description' => 'Excluir cliente',
            ],
            [
                'name' => 'menu_permissoes',
                'description' => 'Ver menu permissões',
            ],
            [
                'name' => 'cadastrar_permissoes',
                'description' => 'Cadastrar permissões',
            ],
            [
                'name' => 'editar_permissoes',
                'description' => 'Editar permissões',
            ],
            [
                'name' => 'ver_permissoes',
                'description' => 'Ver permissões',
            ],
            [
                'name' => 'excluir_permissoes',
                'description' => 'Excluir permissões',
            ],
            [
                'name' => 'ver_menu_menus',
                'description' => 'Ver menu de menus',
            ],
            [
                'name' => 'cadastrar_menu_menus',
                'description' => 'Cadastrar menu de menus',
            ],
            [
                'name' => 'editar_menu_menus',
                'description' => 'Editar menu de menus',
            ],
            [
                'name' => 'ver_menu_menus',
                'description' => 'Ver menu de menus',
            ],
            [
                'name' => 'excluir_menu_menus',
                'description' => 'Excluir menu de menus',
            ],
            [
                'name' => 'ver_menu_vendas',
                'description' => 'Ver menu vendas',
            ],
            [
                'name' => 'realizar_venda',
                'description' => 'Realizar venda',
            ],
            [
                'name' => 'excluir_venda',
                'description' => 'Excluir venda',
            ],
            [
                'name' => 'ver_venda',
                'description' => 'Ver venda',
            ],
            [
                'name' => 'gerar_codigo_barras',
                'description' => 'Gerar código de barras',
            ],
        ]);
    }
}
