<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Bank extends Component
{

    public $bank;
    public $taxas;
    public $saveBtn;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($bank, $taxas, $saveBtn = true)
    {
        $this->bank = $bank;
        $this->taxas = $taxas;
        $this->saveBtn = $saveBtn;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.bank');
    }
}
