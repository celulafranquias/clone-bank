<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Adress extends Model
{
    use HasFactory;

    protected $fillable = ['cep', 'logradouro',	'complemento', 'numero', 'bairro', 'localidade', 'uf', 'user_id'];

    public function setCepAttribute($value){
        $this->attributes['cep'] = preg_replace("/[^0-9]/", "", $value); 
    }
}
