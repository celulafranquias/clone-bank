<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="card-header bg-white">
          <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
          <h6 class="card-subtitle">Aqui estão listados todos os <code class="highlighter-rouge">filtros,</code> disponíveis para filtrar na pesquisa do código de barras.</code></h6>
        </div>

        <div class="card-body">
          <form method="POST" action="{{ route('vendedor.gerarCodigoFilter') }}">
            @csrf
            <div class="form-row">
              <div class="form-group col-md-3">
                <label>Data inicial</label>
                <input type="date" class="form-control" name="datainicial">
              </div>
              <div class="form-group col-md-3">
                <label>Data final</label>
                <input type="date" class="form-control" name="datafinal">
              </div>
              <div class="form-group col-md-3">
                <label>Status do pagamento</label>
                <select class="xp-select2-single form-control" name="status">
                  <option selected value="0">Todos os pagamentos</option>
                  <option value="1">Aguandando pagamento</option>
                  <option value="2">Pagamento aprovado</option>
                  <option value="3">Pagamento rejeitado</option>
                </select>
              </div>
              <div class="form-group col-md-3">
                <label>Tipo de pagamento</label>
                <select class="xp-select2-single form-control" name="type">
                  <option selected value="0">Todos os pagamentos</option>
                  <option value="1">Cartão de credito</option>
                  <option value="2">Pix</option>
                </select>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-3">
                <label>Valor total menor que:</label>
                <input type="number" class="form-control" name="valormenor" placeholder="Ex: R$ 15,80">
              </div>
              <div class="form-group col-md-3">
                <label>Valor total maior que:</label>
                <input type="number" class="form-control" name="valormaior" placeholder="Ex: R$ 354,80">
              </div>
              <div class="form-group col-md-3">
                <label>CPF do cliente:</label>
                <input type="text" class="form-control" name="cpf" id="xp-inputmask-cpf" placeholder="Ex: 000.000.000-00">
              </div>
              <div class="form-group col-md-3">
                <label>Menu</label>
                <select class="xp-select2-single form-control" name="menu">
                  <option selected value="0">Todos os menus</option>
                  @foreach($menus as $menu)
                    <option value="{{$menu->id}}">{{$menu->name}}</option>
                  @endforeach
                </select>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Filtrar</button>
          </form>  
        </div>

      </div>
    </div>
  </div>
</x-app-layout>
