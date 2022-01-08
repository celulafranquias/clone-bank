<x-app-layout>
  <x-breadcrumb-bar :pag="$pag" :link="$link" />
  <div class="xp-contentbar">
    <div class="col-lg-12">
      <div class="card m-b-30">
        <div class="row">
          <div class="col-9">
            <div class="card-header bg-white">
              <h5 class="card-title text-black">Olá, {{ auth()->user()->name}}</h5>
              <h6 class="card-subtitle">Esses são os dados do pagamento do seu <code class="highlighter-rouge">cliente,</code> basta clicar na foto para ampliar.</h6>
            </div>
          </div>
          <div class="col-3 mt-4">
            <a class="float-right mr-5" href="{{route('vendedor.pagamentos')}}"><i class="icon-arrow-left"></i> Voltar</a>
          </div>
        </div>
        <?php $img = $comprovante->img;?>
        <div class="card-body">
          <div class="row">
            @if($comprovante->hasCertificateOfPayment())
              <div class="col-4 mt-4">
                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <img class="tableImg" src="{{asset("assets/$img")}}">
                    </div>
                  </div>
                </div>
                <button type="button" class="btnBorderImg" data-toggle="modal" data-target=".bd-example-modal-lg">
                  <img class="tableImg" src="{{asset("assets/$img")}}">
                </button>
              </div>
            @endif
            <div @if($comprovante->img == '') class="col-12" @else class="col-8" @endif>
              <div class="form-row">
                <div class="form-group col-md-5">
                  <label>Item</label>
                  <input type="text" class="form-control" value="{{ $comprovante->item }}" readonly>
                </div>
                <div class="form-group col-md-5">
                  <label>Código de barras</label>
                  <input type="text" class="form-control" value="{{ $comprovante->codigo }}" readonly>
                </div>
                <div class="form-group col-md-2">
                  <label>Vencimento</label>
                  <input type="text" class="form-control" value="{{ $comprovante->vencimento }}" readonly>
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-2">
                  <label>Q. Parcelas</label>
                  <input type="text" class="form-control" value="{{ $comprovante->parcelas }}" readonly>
                </div>
                <div class="form-group col-md-2">
                  <label>Valor das parcelas</label>
                  <input type="text" class="form-control" value="R$ {{ number_format($comprovante->valorParcelas,2,",",".") }}" readonly>
                </div>
                <div class="form-group col-md-2">
                  <label>Sub total</label>
                  <input type="text" class="form-control" value="R$ {{ number_format($comprovante->subTotal,2,",",".") }}" readonly>
                </div>
                <div class="form-group col-md-2">
                  <label>Total</label>
                  <input type="text" class="form-control" value="R$ {{ number_format($comprovante->total,2,",",".") }}" readonly>
                </div>
                <div class="form-group col-md-4">
                  <label>Forma de pagamento</label>
                  <input type="text" class="form-control" value="@if($comprovante->type == 1) Cartão de credito @else Pix @endif" readonly>
                </div>
              </div>
              @if(!$comprovante->hasCertificateOfPayment())
              <form action="{{ route('vendedor.save.comprovante') }}" method="POST" enctype="multipart/form-data">
                <div class="form-row">
                  <div class="form-group col-md-12">
                    @csrf
                    <label>Comprovante de pagamento</label>
                    <input type="text" value="{{ $comprovante->id }}" name="id" hidden>
                    <input type="file" class="form-control" name="image" required>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary">Enviar comprovante</button>
              </form>
              @endif
            </div>
          </div>	
        </div>          
      </div>
    </div>
  </div>
</x-app-layout>
