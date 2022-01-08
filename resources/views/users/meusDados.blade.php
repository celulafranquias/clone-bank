<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="row">
          <div class="col-9">
            <div class="card-header bg-white">
              <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
              <h6 class="card-subtitle">Esses são seus <code class="highlighter-rouge">dados</code>.</h6>
            </div>
          </div>
        </div>
        <div class="card-body">
          <h5 class="card-title text-black">Alterar senha</h5>
          @if($msg != '')
            <div class="xp-alert">
              <div class="alert alert-{{$class}} alert-dismissible fade show" role="alert">
                <strong>@if($class == 'danger') Opss! @endif </strong><span>{{ $msg }}</span>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>                                   
            </div>
          @endif
            <form action="{{ route('user.alterarSenha') }}" method="POST">
            @csrf
            <input type="text" value="{{ auth()->user()->id }}" name="id" hidden>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label>Nova senha</label>
                <input type="text" class="form-control" name="senha" required>
              </div>
              <div class="form-group col-md-6">
                <label>Repita a nova senha</label>
                <input type="text" class="form-control" name="senha2" required>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Alterar senha</button>
          </form>
        </div>          
      </div>
    </div>
  </div>
</x-app-layout>
