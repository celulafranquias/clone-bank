<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MenuSimula extends Model
{
    use HasFactory;

    protected $fillable = ['description', 'menu_txt', 'percentage', 'qtd'];

    public static function myMenuTaxas()
    {
        $menus = MenuSimula::all();
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
