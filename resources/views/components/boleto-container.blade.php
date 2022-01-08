<div class="boleto-container">
    <p class="mb-0">Código de barras:</p>
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex flex-row">
                <input type="text" class="form-control codBank codBoleto" value=""
                    placeholder="Digite o código de barras:" />
                <button type="button " class="btn btn-rounded btn-inline btn-primary add-boleto-input" onclick="addBankInput(this)">
                    <i class="mdi mdi-plus mb-2"></i>
                </button>
            </div>
        </div>
        <div class="row col-12 mb-3">
            <div class="col-md-12 col-lg-12">
                <div class="xp-invoice-meta text-left">
                    <ul class="list-inline mb-3">
                        <li class="list-inline-item">
                            <p class="mb-0">
                                Data de vencimento:
                                <span class="badge badge-success text-white f-w-5 ml-2 dataVencimento"></span>
                            </p>
                        </li>
                        <li class="list-inline-item">
                            <p class="mb-0">
                                Status :
                                <span class="badge badge-success text-white f-w-5 ml-2 statusBoleto"></span>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
