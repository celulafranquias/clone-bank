<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="card-header bg-white">
          <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
          <div class="row">
            <div class="col-10">
              <h6 class="card-subtitle">Aqui estão listados todas as suas <code class="highlighter-rouge">taxas de simulação,</code> basta inserir alguma informação de taxa no campo de busca, para filtrar pela taxa expecifica.</code></h6>
            </div>

            <div class="col-2">
              <a href="{{ route('menu-taxa.create') }}" class="btn btn-primary dataTables_paginate">
                <i class="icon-plus"></i> Nova taxa menu
              </a>
            </div>

          </div>
        </div>
        @if ($menus['type'] === 'success')
        <div class="card-body">
          <div class="table-responsive">
            <table id="datatable-buttons" class="table table-striped table-bordered">
              <thead>
              <tr>
                <th>id</th>
                <th>Menu</th>
                <th>Texto da taxa</th>
                <th>Taxa (%)</th>
                <th>Descrição</th>
              </tr>
              </thead>
              <tbody>
                @foreach($menus['dados'] as $menu)
                  <tr>
                    <td>{{$menu->id}}</td>
                    <td>Menu de simulação</td>
                    <td>{{$menu->menu_txt}}</td>
                    <td>{{$menu->percentage}} %</td>
                    <td>{{$menu->description}}</td>
                  </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
        @else
        <div class="xp-alert ml-2 mr-2">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Opss! </strong><span>{{ $menus['message'] }}</span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>                                   
        </div>
        @endif
      </div>
    </div>
  </div>
  <!-- Required Datatable JS -->
  <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/dataTables.bootstrap4.min.js') }}"></script>

  <!-- Buttons Examples -->
  <script src="{{ asset('assets/plugins/datatables/dataTables.buttons.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/buttons.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/jszip.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/pdfmake.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/vfs_fonts.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/buttons.html5.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/buttons.print.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/buttons.colVis.min.js') }}"></script>
  
  <!-- Responsive Examples -->
  <script src="{{ asset('assets/plugins/datatables/dataTables.responsive.min.js') }}"></script>
  <script src="{{ asset('assets/plugins/datatables/responsive.bootstrap4.min.js') }}"></script>

  <!-- Datatable init JS -->
  <script src="{{ asset('assets/js/init/table-datatable-init.js') }}"></script>
</x-app-layout>
