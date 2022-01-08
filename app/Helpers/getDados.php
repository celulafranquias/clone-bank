<?php

namespace App\Helpers;

use App\Models\RoleMenu;
use App\Models\User;

class getDados
{

  public static function searchUser($cpf)
  {
    $userCpf = preg_replace("/[^0-9]/", "", $cpf);
    $user = User::join('documents', 'documents.user_id', '=', 'users.id')
      ->join('adresses', 'adresses.user_id', '=', 'users.id')
      ->select('adresses.*', 'users.name', 'users.email', 'documents.cpf', 'documents.celular')
      ->where('documents.cpf', $userCpf)
      ->where(function ($query) {
        return $query->where('users.type', 3);
      })->where(function ($query) {
        return $query->where('users.status', 1);
      });

    if (!auth()->user()->isAdmin()) {
      $user = $user->where(function ($query) {
        return $query->where('users.vendedor_id', auth()->user()->id);
      });
    }

    $user = $user->first();

    if (!empty($user)) {
      return response()->json([
        'type' => 'success',
        'message' => Format::formatDados($user)
      ]);
    }
    return response()->json([
      'type' => 'error',
      'message' => "Não foi encontrado o cliente com o CPF: $cpf, ou está inativo!"
    ]);
  }

  public static function percentageSearch($type, $id)
  {
    $result = RoleMenu::where('menu_id', $type)
      ->where(function ($query) use ($id) {
        return $query->where('id', $id);
      })->select('percentage', 'qtd')->first();
    return $result;
  }
}
