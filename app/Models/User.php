<?php

namespace App\Models;

use App\Helpers\Format;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'type',
        'status',
        'vendedor_id',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];

    public static function users($type)
    {
        $users = User::join('documents', 'documents.user_id', '=', 'users.id')
            ->join('adresses', 'adresses.user_id', '=', 'users.id')
            ->select('adresses.localidade', 'adresses.uf', 'users.id', 'users.name', 'users.status', 'users.email', 'documents.cpf', 'documents.celular', 'documents.img')
            ->where(function($query) use ($type) {
              return $query->where('users.type', $type);
            })->get();
            
        if(count($users) >= 1) {
            foreach($users as $user) {
                $usersF[] = Format::formatDados($user);
            }            
            return [
                'type' => 'success',
                'dados' => $usersF
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhum usuário ativo!"
        ];
    }

    public static function userId($id)
    {
        $user = User::join('documents', 'documents.user_id', '=', 'users.id')
        ->join('adresses', 'adresses.user_id', '=', 'users.id')
        ->select('adresses.*', 'users.id as uid', 'users.name', 'users.status', 'users.email', 'documents.*')
        ->where('users.id', $id)
        ->where(function($query) {
          return $query->where('users.type', 3);
        })
        ->where(function($query) {
            return $query->where('users.vendedor_id', auth()->user()->id);
        })->first();

        if($user) {          
            return [
                'type' => 'success',
                'dados' => $user
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhum usuário ativo!"
        ];
    }


    public static function PasswordRegister($value){
        return Hash::make($value);
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'user_roles', 'user_id', 'role_id');
    }

    public function isAdmin() {
        return $this->roles()->first()->id == 1;
    }
}
