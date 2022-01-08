<?php

namespace App\View\Components;

use Illuminate\View\Component;

class BreadcrumbBar extends Component
{

    public $link;
    public $pag;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($pag, $link)
    {
        $this->pag = $pag;
        $this->link = $link;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.breadcrumb-bar');
    }
}
