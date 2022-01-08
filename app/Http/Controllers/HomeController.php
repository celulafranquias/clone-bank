<?php

namespace App\Http\Controllers;

use App\Helpers\getDados;
use App\Models\Menu;
use App\Models\MenuSimula;
use App\Models\RoleMenu;
use App\Models\Ticket;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = [
            'pag' => 'Início',
            'link' => '/',
            'currentWeekIncome' => $this->getCurrentWeekIncome(),
            'previousWeekIncome' => $this->getPreviousWeekIncome(),
            'paymentData' => $this->getCurrentWeekIncomeData()
        ];
        return view('dashboard', $data);
    }

    public function bankSimulate(int $id)
    {
        $menu = Menu::find($id);
        $data = [
            'pag' => $menu->name,
            'link' => '/',
            'saveBtn' => false,
            'bank' => $id,
            'taxas' => RoleMenu::where('menu_id', $id)
                ->orderBy('qtd', 'ASC')->get(),
        ];

        return view('bankSimulate', $data);
    }

    public function userSearch($cpf)
    {
        $cpf = getDados::searchUser($cpf);
        return $cpf;
    }

    public function percentageSearch($type, $id)
    {
        return getDados::percentageSearch($type, $id);
    }

    private function getCurrentWeekIncome()
    {
        $startDate = Carbon::now()->modify('-1 week');
        $finalDate = Carbon::now();
        $tickets = $this->getTicketsBetweenDates($startDate, $finalDate);
        $priceSum = $tickets->sum('total');

        return $this->formatMoney($priceSum);
    }

    private function getTicketsBetweenDates($startDate, $finalDate)
    {
        $tickets = Ticket::whereBetween('created_at', [$startDate->format('Y-m-d H:i:s'), $finalDate->format('Y-m-d H:i:s')]);

        if (!auth()->user()->isAdmin()) {
            $tickets = $tickets->query(function ($query) {
                return $query->where('vendedor_id', auth()->user()->id);
            });
        }

        $tickets = $tickets->get();

        return $tickets;
    }

    private function getPreviousWeekIncome()
    {
        $startDate = Carbon::now()->modify('-2 week');
        $finalDate = Carbon::now()->modify('-1 week');
        $tickets = $this->getTicketsBetweenDates($startDate, $finalDate);
        $priceSum = $tickets->sum('total');

        return $this->formatMoney($priceSum);
    }

    private function getCurrentWeekIncomeData()
    {
        $now = Carbon::now();
        $data = [];

        for ($i = 7; $i >= 0; $i--) {
            $startDate = $now->copy()->setTime(0, 0, 0);
            $finalDate = $now->copy()->setTime(23, 59, 59);

            $tickets = $this->getTicketsBetweenDates($startDate, $finalDate);
            $ticketPricesSum = $tickets->sum('total');

            $data[$now->format('d/m')] = $ticketPricesSum;

            $now->subDay();
        }
        
        return $data;
    }

    private function formatMoney($number)
    {
        $formatted = number_format($number, 2, ',', '.');

        return $formatted;
    }
}
