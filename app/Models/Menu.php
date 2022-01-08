<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    use HasFactory;

    protected $fillable = ['name',	'description', 'status'];

    public static function myMenu()
    {
        $menus = Menu::all();
        if(count($menus) >= 1) {        
            return [
                'type' => 'success',
                'dados' => $menus
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhum menu ativo!"
        ];
    }
}
