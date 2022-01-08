<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <link rel="shortcut icon" href="{{asset('assets/images/favicon.ico')}}" />

        <!-- Styles -->
        <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css">
        <link href="{{ asset('assets/css/icons.css') }}" rel="stylesheet" type="text/css">
        <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="{{ asset('assets/plugins/chartist-js/chartist.min.css') }}">

        <!-- Scripts -->
        <script src="{{ mix('js/app.js') }}" defer></script>
        <!-- Start JS -->        
        <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
        <script src="{{ asset('assets/js/popper.min.js') }}"></script>
        <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
        <script src="{{ asset('assets/js/modernizr.min.js') }}"></script>
        <script src="{{ asset('assets/js/detect.js') }}"></script>
        <script src="{{ asset('assets/js/jquery.slimscroll.js') }}"></script>
        <script src="{{ asset('assets/js/sidebar-menu.js') }}"></script>
        <script src="{{ asset('assets/js/index.js') }}"></script>
        <script src="{{ asset('assets/plugins/bootstrap-inputmask/jquery.inputmask.bundle.min.js') }}"></script>
        <script src="{{ asset('assets/js/init/form-inputmask-init.js') }}"></script>
        <script src="{{ asset('assets/js/viacep.js') }}"></script>

        <script src="{{ asset('assets/plugins/chartist-js/chartist.min.js') }}"></script>
        <script src="{{ asset('assets/plugins/chartist-js/chartist-plugin-tooltip.min.js') }}"></script>

        <!-- Dashboard JS -->
        <script src="{{ asset('assets/js/init/dashborad.js') }}"></script>

        <!-- Main JS -->
        <script src="{{ asset('assets/js/main.js') }}"></script>
        <!-- End JS -->
    </head>
    <body class="font-sans antialiased">
        <div id="xp-container">
            <div class="xp-leftbar">
                <x-left-bar-menu />
            </div>
        
            <div class="xp-rightbar">
                <div class="xp-topbar">
                    @include('components.topbar-menu')
                </div>
                <!-- Page Content -->
                <main>
                    {{ $slot }}
                </main>
                <div class="xp-footerbar">
                    @include('components.footer')
                </div>
            </div>
        </div> 
        @yield('additional_scripts')
    </body>
</html>
