<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'role_id'];

    public static function newUserRole($type, $id)
    {
        $role = New UserRole();
        $role->role_id = $type;
        $role->user_id = $id;
        $role->save();
    }
}
