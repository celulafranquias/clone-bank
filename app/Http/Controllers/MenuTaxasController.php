<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\MenuSimula;
use App\Models\RoleMenu;
use Illuminate\Http\Request;

class MenuTaxasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'pag' => 'Meus menus',
            'link' => '/',
            'menus' => RoleMenu::myMenuTaxas()
        ];
        return view('taxas.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = [
            'pag' => 'Nova taxa de menu',
            'link' => '/',
            'menus' => Menu::where('status', 1)->get()
        ];
        return view('taxas.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($request['menu_id'] == 'simular') {
            MenuSimula::create($request->all());
            return redirect(route('menu-taxa.simulacao'));
        } 
        if($request['menu_id'] !== 'simular') {
            RoleMenu::create($request->all());
        }  
        return redirect(route('menu-taxa.index'));
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
