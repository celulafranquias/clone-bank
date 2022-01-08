<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="row">
          <div class="col-9">
            <div class="card-header bg-white">
              <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
              <h6 class="card-subtitle">Esses são os dados do seu <code class="highlighter-rouge">cliente,</code> basta clicar na foto para ampliar.</h6>
            </div>
          </div>
          <div class="col-3 mt-4">
            <a class="float-right mr-5" href="{{route('client.index')}}"><i class="icon-arrow-left"></i> Voltar</a>
          </div>
        </div>
        <?php $img = $clients['dados']['img'];?>
        <div class="card-body">
          <div class="row">
            <div class="col-4 mt-4">
              <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <img class="tableImg" src="{{asset("assets/$img")}}" alt="{{$clients['dados']['name']}}">
                  </div>
                </div>
              </div>
            <button type="button" @if($clients['dados']['status'] == 1) class="btnBorderImg" @else class="btnBorderImgDanger" @endif data-toggle="modal" data-target=".bd-example-modal-lg">
              <img class="tableImg" src="{{asset("assets/$img")}}" alt="{{$clients['dados']['name']}}">
            </button>
            <p class="mt-4"><b>Usuário está:</b>
              @if($clients['dados']['status'] == 1)
              <span class="btnStatusSuccess">Ativo</span>
              @endif
              @if($clients['dados']['status'] == 2)
                <span class="btnStatusCancel">Inativo</span>
              @endif
            </p>
            </div>
            <div class="col-8">
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="inputNome">Nome</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['name']}}" readonly>
                </div>
                <div class="form-group col-md-3">
                  <label for="inputCpf">CPF</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['cpf']}}" readonly>
                </div>
                <div class="form-group col-md-3">
                  <label for="inputRG">RG</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['rg']}}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="inputCelular">Celular</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['celular']}}" readonly>
                </div>
                <div class="form-group col-md-4">
                  <label for="nascimento">Data de nascimento</label>
                  <input type="date" class="form-control" value="{{$clients['dados']['nascimento']}}" readonly>
                </div>
                <div class="form-group col-md-4">
                  <label for="inputEmail4">E-mail</label>
                  <input type="email" class="form-control" value="{{$clients['dados']['email']}}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-3">
                  <label for="cep">CEP</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['cep']}}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="logradouro">Rua</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['logradouro']}}" readonly>
                </div>
                <div class="form-group col-md-3">
                  <label for="numero">Número</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['numero']}}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="complemento">Complemento</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['complemento']}}" readonly>
                </div>
                <div class="form-group col-md-8">
                  <label for="bairro">Bairro</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['bairro']}}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="localidade">Cidade</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['localidade']}}" readonly>
                </div>
                <div class="form-group col-md-6">
                  <label for="uf">Estado</label>
                  <input type="text" class="form-control" value="{{$clients['dados']['uf']}}" readonly>
                </div>
              </div>
            </div>
          </div>	
        </div>          
      </div>
    </div>
  </div>
</x-app-layout>
