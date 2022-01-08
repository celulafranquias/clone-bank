<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleMenu extends Model
{
    use HasFactory;

    protected $fillable = ['menu_id', 'description', 'menu_txt', 'percentage', 'qtd'];

    public static function myMenuTaxas()
    {
        $menus = RoleMenu::join('menus', 'menus.id', '=', 'role_menus.menu_id')
        ->select('role_menus.*', 'menus.name')
        ->where('menus.status', 1)->get();
        if(count($menus) >= 1) {        
            return [
                'type' => 'success',
                'dados' => $menus
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhuma taxa de menu ativo!"
        ];
    }

    public function setPercentageAttribute($value){
        $this->attributes['percentage'] = str_replace("%", "", $value);
    }
}
