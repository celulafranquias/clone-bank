<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="card-header bg-white">
          <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
          <h6 class="card-subtitle">Para o cadastro da nova <code class="highlighter-rouge">taxa do menu,</code> preencha todos os campos abaixo <code class="highlighter-rouge">corretamente</code>.</h6>
        </div>

        <div class="card-body">
          <form method="POST" action="{{ route('menu-taxa.store') }}">
            @csrf
            <div class="form-row">
              <div class="form-group col-md-6">
                <label>Menu</label>
                  <select class="xp-select2-single form-control" name="menu_id">
                    @foreach($menus as $menu)
                      <option value="{{ $menu->id }}">Menu: {{ $menu->name }} / Descrição: {{ $menu->description }}</option>
                    @endforeach
                    <option value="simular">Menu de simulação</option>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label>Descrição</label>
                <input type="text" class="form-control" name="description" placeholder="Digite a descrição da taxa" required>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label>Nome da taxa</label>
                <input type="text" class="form-control" name="menu_txt" placeholder="Ex: Parcelado em 10X com juros de 4.5%" required>
              </div>
              <div class="form-group col-md-3">
                <label>Taxa em (%)</label>
                <input type="text" class="form-control" name="percentage" placeholder="Ex: 4.5" required id="xp-inputmask-currency">
              </div>
              <div class="form-group col-md-3">
                <label>Qtd. parcelas</label>
                <input type="number" class="form-control" name="qtd" placeholder="Qtd. de parcelas nessa regra" required>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Criar taxa menu</button>
          </form>  
        </div>
          
      </div>
    </div>
  </div>
</x-app-layout>
