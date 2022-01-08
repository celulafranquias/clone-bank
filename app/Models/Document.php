<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $fillable = ['rg', 'cpf',	'nascimento', 'celular', 'img', 'user_id'];

    public function setCpfAttribute($value){
        $this->attributes['cpf'] = preg_replace("/[^0-9]/", "", $value); 
    }

    public function getCpfAttribute($cpf)
    {
        $this->attributes['cpf'] = substr($cpf, 0, 3) . '.' . substr($cpf, 3, 3) . '.' . substr($cpf, 6, 3) . '-' . substr($cpf, 9);
    }

    public function setCelularAttribute($value){
        $this->attributes['celular'] = preg_replace("/[^0-9]/", "", $value); 
    }
}
