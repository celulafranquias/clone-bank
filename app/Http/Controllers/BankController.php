<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use App\Models\Notification;
use App\Models\RoleMenu;
use App\Models\Ticket;
use Illuminate\Http\Request;

class BankController extends Controller
{

    public function mainMenu($id)
    {
        $menu = Menu::find($id);
        $data = [
            'pag' => $menu->name,
            'link' => '/',
            'bank' => $id,
            'taxas' => RoleMenu::where('menu_id', $id)
                ->orderBy('qtd', 'ASC')->get()
        ];

        return view('bank.pagamentos-boletos', $data);
    }

    public function sendBank(Request $req, $id)
    {
        $index = 0;
        foreach ($req->boletos as $boleto) {
            $data = array_merge($req->boletos[$index], array(
                'vendedor_id' => $req->vendedor_id,
                'menu_id' => $req->menu_id,
                'client_id' => $req->client_id,
                'type' => $req->type,
            ));
            $ticket = Ticket::create($data);

            $notification = new Notification();
            $notification->ticket_id = $ticket->id;
            $notification->save();

            $index++;
        }

        return redirect(route('vendedor.pagamentos'));
    }

    public function statusBank(Request $req)
    {
        $ticketId = $req['id'];

        $pag = Ticket::find($ticketId);

        if (!$pag->hasCertificateOfPayment()) {
            return redirect()->back();
        }

        $pag->status = $req['status'];
        $pag->save();

        Notification::where('ticket_id', $ticketId)->delete();
        
        return redirect(route('vendedor.pagamentos'));
    }
}
