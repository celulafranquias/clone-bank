<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    public function meusDados($msg = '', $class = '')
    {
        $data = [
            'pag' => 'Meus dados',
            'link' => '/',
            'msg' => $msg,
            'class' => $class
        ];
        return view('users.meusDados', $data);
    }

    public function alterarSenha(Request $req)
    {
        if($req->senha != $req->senha2) {
            $msg = 'As senha não são iguais';
            return $this->meusDados($msg, 'danger');
        }
        $senha = Hash::make($req->senha);
        $user = User::find($req->id)->first();
        $user->password = $senha;
        if($user->save()) {
            $msg = 'Senha alterada com sucesso!';
            return $this->meusDados($msg, 'primary');
        }
        $msg = 'Não foi possível alterar a senha, tente mais tarde!';
        return $this->meusDados($msg, 'danger');
    }
}
