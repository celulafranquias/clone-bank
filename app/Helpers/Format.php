<?php 

namespace App\Helpers;

class Format {

  public static function formatDados($req)
  {
    if (!empty($req['cpf'])) {
      $req['cpf'] = substr($req['cpf'], 0, 3) . '.' . substr($req['cpf'], 3, 3) . '.' . substr($req['cpf'], 6, 3) . '-' . substr($req['cpf'], 9);
    }
    if (!empty($req['celular'])) {
      $formatedPhone = preg_replace('/[^0-9]/', '', $req['celular']);
      $matches = [];
      preg_match('/^([0-9]{2})([0-9]{4,5})([0-9]{4})$/', $formatedPhone, $matches);
      $req['celular'] = '('.$matches[1].') '.$matches[2].'-'.$matches[3];
    }
    if (!empty($req['cep'])) {
      $req['cep'] = substr($req['cep'], 0, 5) . '-' . substr($req['cep'], 5, 7);
    }
    return $req;
  }
}
?>