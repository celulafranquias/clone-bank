<?php

namespace App\View\Components;

use App\Models\Notification;
use Illuminate\View\Component;

class AppLayout extends Component
{
    /**
     * Get the view / contents that represents the component.
     *
     * @return \Illuminate\View\View
     */
    public function render()
    {
        $notifications = Notification::orderBy('created_at', 'desc')->get();

        return view('layouts.app', array(
            'notifications' => $notifications
        ));
    }
}
