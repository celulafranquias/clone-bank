<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="card-header bg-white">
          <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
          <h6 class="card-subtitle">Aqui estão listados todos os seus <code class="highlighter-rouge">pagamentos,</code> basta inserir alguma informação do cliente no campo de busca, para filtrar pelo cliente expecifico.</code></h6>
        </div>
        @if ($pagamentos['type'] === 'success')
        <div class="card-body">
          <div class="table-responsive">
            <table id="datatable-buttons" class="table table-striped table-bordered">
              <thead>
              <tr style="text-align: center">
                <th>Cliente</th>
                <th>Item</th>
                <th>Tipo</th>
                <th>Vencimento</th>
                <th>Status</th>
                <th>Q. Parcelas</th>
                <th>V. Parcelas</th>
                <th>Total</th>
              </tr>
              </thead>
              <tbody>
                @foreach($pagamentos['dados'] as $pag)
                  <tr style="text-align: center">
                    <td>{{$pag->name}}</td>
                    <td>{{$pag->item}}</td>
                    <td>@if($pag->type == 1) Cartão de credito @else Pix @endif</td>
                    <td>{{$pag->vencimento}}</td>
                    @if($pag->status == 1)
                      <td>Aguardando pagamento</td>
                    @endif
                    @if($pag->status == 2)
                      <td class="btnStatusSuccess">Pagamento aprovado</td>
                    @endif
                    @if($pag->status == 3)
                      <td class="btnStatusCancel">Pagamento reprovado</td>
                    @endif
                      <td>{{$pag->parcelas}}</td>
                    <td>R$ {{number_format($pag->valorParcelas,2,",",".")}}</td>
                    <td>R$ {{number_format($pag->total,2,",",".")}}</td>
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
