<?php

namespace App\Models;

use App\Helpers\Format;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Ticket extends Model
{
    use HasFactory;

    protected $fillable = ['item', 'codigo', 'type', 'vencimento', 'status', 'parcelas', 'valorParcelas', 'subTotal', 'total', 'img', 'client_id',	'vendedor_id', 'menu_id'];

    public static function todosPagamentos()
    {
        $pags = Ticket::join('users', 'users.id', '=', 'tickets.client_id')
                ->join('documents', 'documents.user_id', '=', 'users.id')
                ->where('users.vendedor_id', auth()->user()->id)
                ->select('tickets.*', 'users.name', 'documents.cpf')
                ->get();
            
        if(count($pags) >= 1) {
            foreach($pags as $pag) {
                $pagF[] = Format::formatDados($pag);
            }            
            return [
                'type' => 'success',
                'dados' => $pagF
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhum pagamento ativo!"
        ];
    }

    public static function todosPagamentosClient()
    {
        $pags = Ticket::join('users', 'users.id', '=', 'tickets.client_id')
                ->where('users.id', auth()->user()->id)
                ->select('tickets.*', 'users.name')
                ->get();
            
        if(count($pags) >= 1) {
            foreach($pags as $pag) {
                $pagF[] = Format::formatDados($pag);
            }            
            return [
                'type' => 'success',
                'dados' => $pagF
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhum pagamento!"
        ];
    }

    public static function gerarCodigoFilter($req)
    {
        $query = Ticket::join('users', 'users.id', '=', 'tickets.client_id')
            ->join('documents', 'documents.user_id', '=', 'tickets.client_id')
            ->select('users.name', 'documents.cpf','tickets.id', 'tickets.codigo', 'tickets.vencimento', 'tickets.subTotal', 'tickets.status')
            ->where('tickets.vendedor_id', auth()->user()->id);

        if($req['datainicial']) {
            $query = $query->where('tickets.created_at', '>=', $req['datainicial']);
        }
        
        if($req['datafinal']) {
            $query = $query->where('tickets.created_at', '<=', $req['datafinal']);
        }
        
        if($req['status'] != 0) {
            $query = $query->where('tickets.status', '=', $req['status']);
        }
        
        if($req['type'] != 0) {
            $query = $query->where('tickets.type', '=', $req['type']);
        }

        if($req['valormenor']) {
            $query = $query->where('tickets.total', '<=', $req['valormenor']);
        }

        if($req['valormaior']) {
            $query = $query->where('tickets.total', '>=', $req['valormaior']);
        }

        if($req['cpf']) {
            $cpf = preg_replace("/[^0-9]/", "", $req['cpf']);
            $query = $query->where('documents.cpf', '=', $cpf);
        }

        if($req['menu'] != 0) {
            $query = $query->where('tickets.menu_id', '=', $req['menu']);
        }

        $dados = $query->get();

        if(count($dados) >= 1) {
            foreach($dados as $dado) {
                $bank[] = Format::formatDados($dado);
            }            
            return [
                'type' => 'success',
                'dados' => $bank
            ];
        }
        return [
            'type' => 'error',
            'message' => "Não foi encontrado nenhum pagamento!"
        ];
    }

    public function setCelularAttribute($value){
        $this->attributes['celular'] = preg_replace("/[^0-9]/", "", $value); 
    }

    public function setValorParcelasAttribute($value){
        $this->attributes['valorParcelas'] = str_replace(",",".", $value); 
    }

    public function setTotalAttribute($value){
        $this->attributes['total'] = str_replace(",",".", $value); 
    }

    public function hasCertificateOfPayment() {

        $certificateImage = $this->attributes['img'];
        return !is_null($certificateImage);

    }

    public function client() {
        return $this->belongsTo(User::class, 'client_id');
    }
}
