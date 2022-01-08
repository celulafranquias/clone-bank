<?php

namespace App\Http\Controllers;

use App\Models\Adress;
use App\Models\Document;
use App\Models\Menu;
use App\Models\Notification;
use App\Models\Ticket;
use App\Models\User;
use App\Models\UserRole;
use Illuminate\Http\Request;

class VendedorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'pag' => 'Todos vendedores',
            'link' => '/',
            'vendedores' => User::users(2)
        ];
        return view('vendedor.index', $data);
    }

    public function pagamentos()
    {
        $data = [
            'pag' => 'Todos pagamentos',
            'link' => '/',
            'pagamentos' => Ticket::todosPagamentos()
        ];
        return view('vendedor.pagamentos', $data);
    }

    public function comprovante($id)
    {
        $data = [
            'pag' => 'Inserir comprovante de pagamento',
            'link' => '/',
            'comprovante' => Ticket::find($id)
        ];

        Notification::where('ticket_id', $id)->delete();

        return view('vendedor.comprovante', $data);
    }

    public function saveComprovante(Request $req)
    {
        if ($req->hasFile('image') && $req->file('image')->isValid()) {
            $imagePath = $req->image->store('images/comprovante');
            $pag = Ticket::find($req->id);
            $pag->img = $imagePath;
            $pag->save();
        }
        return redirect(route('vendedor.comprovante', ['id' => $req->id]));
    }

    public function gerarCodigo()
    {
        $data = [
            'pag' => 'Gerar código de barras',
            'link' => '/',
            'menus' => Menu::where('status', 1)->get()
        ];
        return view('vendedor.codbarras', $data);
    }

    public function gerarCodigoFilter(Request $req)
    {
        $filters = Ticket::gerarCodigoFilter($req);
        $data = [
            'pag' => 'Gerar código de barras',
            'link' => '/',
            'pagamentos' => $filters
        ];
        return view('vendedor.printbarras', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = [
            'pag' => 'Cadastrar vendedor',
            'link' => '/',
            'act' => '/novo-vendedor',
            'btn' => 'Cadastrar vendedor',
            'type' => 2
        ];
        return view('vendedor.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request['password'] = User::PasswordRegister($request['password']);
        $user = User::create($request->all());
        if ($user->id) {
            $request['user_id'] = $user->id;
            Adress::create($request->all());
            Document::create($request->all());
            UserRole::newUserRole(2, $user->id);
        }
        return redirect(route('vendedor.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
