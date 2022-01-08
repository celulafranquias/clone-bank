<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">

        @if ($pagamentos['type'] === 'success')
        <div class="card-body">
          <div class="table-responsive">
            <table id="datatable-buttons" class="table table-striped table-bordered">
              <thead>
              <tr>
                <th>Id</th>
                <th>Nome</th>
                <th>CPF</th>
                <th>C. Barras</th>
                <th>status</th>
                <th>Vencimento</th>
                <th>Valor</th>
              </tr>
              </thead>
              <tbody>
                @foreach($pagamentos['dados'] as $pag)
                  <tr>
                    <td>{{$pag->id}}</td>
                    <td>{{$pag->name}}</td>
                    <td>{{$pag->cpf}}</td>
                    <td>{{$pag->codigo}}</td>
                    @if($pag->status == 1)
                      <td>Aguardando pagamento</td>
                    @endif
                    @if($pag->status == 2)
                      <td class="btnStatusSuccess">Pagamento aprovado</td>
                    @endif
                    @if($pag->status == 3)
                      <td class="btnStatusCancel">Pagamento reprovado</td>
                    @endif
                    <td>{{$pag->vencimento}}</td>
                    <td>R$ {{number_format($pag->subTotal,2,",",".")}}</td>
                  </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
        @else
        <div class="xp-alert ml-2 mr-2">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Opss! </strong><span>{{ $pagamentos['message'] }}</span>
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
