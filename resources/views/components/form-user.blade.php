<div class="card-body">
    <form method="POST" action="{{ $act }}" enctype="multipart/form-data">
        @csrf
        <input type="text" name="type" value="{{ $type }}" hidden>
        <input type="text" name="status" value="1" hidden>
        <div class="form-row">
            @if ($type == 3)
                <div class="form-group col-md-4">
                @else
                    <div class="form-group col-md-6">
            @endif
            <label for="inputNome">Nome</label>
            <input type="text" class="form-control" name="name" placeholder="Digite o nome" required>
        </div>
        <div class="form-group col-md-3">
            <label for="inputCpf">CPF</label>
            <input type="text" class="form-control" name="cpf" id="xp-inputmask-cpf" placeholder="Digite o CPF"
                required>
        </div>
        <div class="form-group col-md-3">
            <label for="inputRG">RG</label>
            <input type="text" class="form-control" name="rg" placeholder="Digite o RG" maxlength="10" required>
        </div>
        @if ($type == 3)
            <div class="form-group col-md-2">
                <label for="inputRG">Foto</label>
                <input type="hidden" class="form-control" name="image" required>
                <img class="img-thumbnail mb-2 d-none" width="640" height="480" id="photo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXSanyZlDfeS_V8YJ872e7LhfTKPUytb6DG3MrlELhCtleZpt2Q9-qxdBDjMNYGByTthM&usqp=CAU" >
                <button class="btn btn-primary btn-block" data-toggle="modal" data-target=".take-photo-modal">Tirar
                    Foto</button>
            </div>
        @endif
</div>
<div class="form-row">
    <div class="form-group col-md-3">
        <label for="inputCelular">Celular</label>
        <input type="text" class="form-control" name="celular" id="xp-inputmask-phone"
            placeholder="Digite o número do celular" required>
    </div>
    <div class="form-group col-md-2">
        <label for="nascimento">Data de nascimento</label>
        <input type="date" class="form-control" name="nascimento" placeholder="Digite a data de nascimento" required>
    </div>
    <div class="form-group col-md-4">
        <label for="inputEmail4">E-mail</label>
        <input type="email" class="form-control" name="email" placeholder="Digite o E-Mail" required>
    </div>
    <div class="form-group col-md-3">
        <label for="inputPassword4">Senha</label>
        <input type="password" class="form-control" name="password" placeholder="Digite a senha" required>
    </div>
</div>
<div class="form-row">
    <div class="form-group col-md-2">
        <label for="cep">CEP</label>
        <input type="text" class="form-control" onblur="pesquisacep(this.value);" name="cep" id="cep"
            placeholder="Digite o cep">
    </div>
    <div class="form-group col-md-8">
        <label for="logradouro">Rua</label>
        <input type="text" class="form-control" name="logradouro" id="logradouro" placeholder="Digite o logradouro"
            required>
    </div>
    <div class="form-group col-md-2">
        <label for="numero">Número</label>
        <input type="text" class="form-control" name="numero" id="numero" placeholder="Digite o número" required>
    </div>
</div>
<div class="form-row">
    <div class="form-group col-md-4">
        <label for="complemento">Complemento</label>
        <input type="text" class="form-control" name="complemento" id="complemento" placeholder="Digite o complemento"
            required>
    </div>
    <div class="form-group col-md-8">
        <label for="bairro">Bairro</label>
        <input type="text" class="form-control" name="bairro" id="bairro" placeholder="Digite o bairro" required>
    </div>
</div>
<div class="form-row">
    <div class="form-group col-md-6">
        <label for="localidade">Cidade</label>
        <input type="text" class="form-control" id="localidade" name="localidade"
            placeholder="Digite o cep para completar a cidade" readonly required>
    </div>
    <div class="form-group col-md-6">
        <label for="uf">Estado</label>
        <input type="text" class="form-control" id="uf" name="uf" placeholder="Digite o cep para completar o estado"
            readonly required>
    </div>
</div>
<button type="submit" class="btn btn-primary">{{ $btn }}</button>
</form>

<div class="modal fade take-photo-modal" tabindex="-1" role="dialog" aria-labelledby="takePhotoModal"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Tirar Foto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
              <video class="w-100" autoplay playsinline width="640" height="480" id="webcam"></video>
              <canvas class="d-none" id="webcam-canvas"></canvas>
              <audio id="webcamSound" preload = "auto"></audio>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
              <button type="button" class="btn btn-primary" id="take-photo-btn">Tirar Foto</button>
            </div>
        </div>
    </div>
</div>
</div>
