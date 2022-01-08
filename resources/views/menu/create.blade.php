<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="card-header bg-white">
          <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
          <h6 class="card-subtitle">Para o cadastro do novo <code class="highlighter-rouge">menu,</code> preencha todos os campos abaixo <code class="highlighter-rouge">corretamente</code>.</h6>
        </div>

        <div class="card-body">
          <form method="POST" action="{{ route('menu.store') }}">
            @csrf
            <input type="text" name="status" value="1" hidden>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputNome">Nome</label>
                <input type="text" class="form-control" name="name" placeholder="Digite o menu" required>
              </div>
              <div class="form-group col-md-6">
                <label for="inputCpf">Descrição</label>
                <input type="text" class="form-control" name="description" placeholder="Digite a descrição" required>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Criar menu</button>
          </form>  
        </div>
          
      </div>
    </div>
  </div>
</x-app-layout>
