<?php

namespace App\View\Components;

use App\Models\Menu;
use Illuminate\View\Component;

class LeftBarMenu extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $data['menus'] = Menu::where('status', 1)->get();
        return view('components.leftbar-menu', $data);
    }
}
