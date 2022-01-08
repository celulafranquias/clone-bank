<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="card-header bg-white">
          <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
          <h6 class="card-subtitle">Para o cadastro do novo <code class="highlighter-rouge">vendedor,</code> preencha todos os campos abaixo <code class="highlighter-rouge">corretamente</code>.</h6>
        </div>

        <x-form-user :btn="$btn" :act="$act" :type="$type"/>
          
      </div>
    </div>
  </div>
</x-app-layout>
