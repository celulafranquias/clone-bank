<?php

namespace App\View\Components;

use Illuminate\View\Component;

class FormUser extends Component
{
    // dados view
    public $act;
    public $btn;
    public $type;
    
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($act, $btn, $type)
    {
        $this->act = $act;
        $this->btn = $btn;
        $this->type = $type;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.form-user');
    }
}
