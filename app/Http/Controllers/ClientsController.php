<?php

namespace App\Http\Controllers;

use App\Models\Adress;
use App\Models\Document;
use App\Models\Ticket;
use App\Models\User;
use App\Models\UserRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ClientsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'pag' => 'Todos clientes',
            'link' => '/',
            'clients' => User::users(3)
        ];
        return view('clients.index', $data);
    }

    public function comprovantePagamento()
    {
        $data = [
            'pag' => 'Todos pagamentos',
            'link' => '/',
            'pagamentos' => Ticket::todosPagamentosClient()
        ];
        return view('clients.pagamentos', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = [
            'pag' => 'Cadastrar cliente',
            'link' => '/',
            'act' => '/novo-cliente',
            'btn' => 'Cadastrar cliente',
            'type' => 3
        ];
        return view('clients.create', $data);
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
        $request['vendedor_id'] = auth()->user()->id;
        $user = User::create($request->all());
        if ($user->id) {
            $request['user_id'] = $user->id;
            Adress::create($request->all());
            if ($request->get('image')) {
                $imagePath = "images\\doc\\user_$user->id.png";
                Storage::put($imagePath, base64_decode(
                    str_replace('data:image/png;base64,', '', $request->get('image'))
                ));
                $request['img'] = $imagePath;
            }
            Document::create($request->all());
            UserRole::newUserRole(3, $user->id);
        }
        return redirect(route('client.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = [
            'pag' => 'Dados do cliente',
            'link' => '/',
            'clients' => User::userId($id)
        ];
        return view('clients.show', $data);
    }

    public function satusClient(Request $req)
    {
        $user = User::find($req['id']);
        $user->status = $req['status'];
        $user->save();

        return redirect(route(('client.index')));
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
