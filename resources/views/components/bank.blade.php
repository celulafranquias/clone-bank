<div class="col-md-12 col-lg-12 col-xl-12">
    <div class="card m-b-30">
        <div class="card-body">
            <div class="xp-invoice">
                <div class="row mb-3">
                    <div class="col-6 col-md-6 col-lg-6">
                        <div class="xp-invoice-logo">
                            <img src="{{ asset('assets/images/logo.png') }}" class="img-fluid"
                                alt="invoice-logo" />
                        </div>
                    </div>

                    <div class="col-6 col-md-6 col-lg-4">
                        <div class="xp-invoice-name text-right">
                            <h5 class="mb-0">Fatura</h5>
                        </div>
                    </div>
                </div>
                <div class="xp-alert" style="display: none" id="msgDisplay">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Opss! </strong><span id="msgBank"></span>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
                <div id="formsPagamento" style="display: none">
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="boleto-containers">
                                <x-boleto-container :status="false" :expirationDate="false" />
                            </div>
                            <button type="button" class="btn btn-primary" onclick="reloadTicketPrices();">
                                <i class="mdi mdi-send mr-2"></i> Simular
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-12 col-lg-12">
                        <div class="xp-invoice-meta">
                            <ul class="list-inline mb-3">
                                <li class="list-inline-item">
                                    <p class="mb-0">
                                        Data de vencimento:
                                        <span class="text-black f-w-5 ml-2" id="dataVencimento"></span>
                                    </p>
                                </li>
                                <li class="list-inline-item">
                                    <p class="mb-0">
                                        Status :
                                        <span class="text-success f-w-5 ml-2" id="statusBoleto"></span>
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-6 col-md-6 col-lg-4">
                        <div class="xp-invoice-address mb-4">
                            <p class="f-w-5 text-black">Cobrança de:</p>
                            <span>Abank Ltda.</span>
                            <h6>©️ Alphabank </h6>
                            <address>
                                Avenida dos Holandeses SALA 807 ED <br />
                                TECH OFFICE N. 06 <br />
                                Ponto D`Areia - São Luis - MA <br />
                                CNPJ: 37.182.621/0001-43
                            </address>
                            <p style="margin: 0">Fone: (98) 9 8867-4206</p>
                            <p>E-mail: contato@alphabank.com.br</p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4">
                        <div class="xp-invoice-address mb-4">
                            <p class="f-w-5 text-black">Cobrança para:</p>
                            <input type="text" class="form-control codUserSearch" id="xp-inputmask-cpf"
                                placeholder="CPF: ___.___.___-__">
                            <button type="button" class="btn btn-primary mb-4" onclick="pesquisaUser();">
                                <i class="icon-magnifier mr-2"></i> Buscar
                            </button>
                            <div id="pesquisaUser" style="display: none">
                                <h6 id="userName"></h6>
                                <address>
                                    <span id="userRuaN"></span> <br />
                                    <span id="addressCity"></span>
                                </address>
                                <p id="userFone"></p>
                                <p id="userEmail"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-4" id="formsPagamentoSelect" style="display: none">
                        <div class="xp-invoice-address mb-4">
                            <p class="f-w-5 text-black">Formas de pagamento:</p>
                            <!-- Start XP Col -->
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline1" name="customRadioInline1"
                                    onclick="formatPag(1)" class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline1">Cartão de credito</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customRadioInline2" name="customRadioInline1"
                                    onclick="formatPag(2)" class="custom-control-input">
                                <label class="custom-control-label" for="customRadioInline2">Pix</label>
                            </div>
                            <div style="display: none" id="selecParcelas">
                                <p class="f-w-5 mt-4 text-black">Qtd. Parcelas:</p>
                                <select class="xp-select2-single form-control" id="numParcelas"
                                    onchange="qtdParcelas(this)" name="state">
                                    <option data-qtd="0" data-percentage="0" selected>Selecione a parcela</option>
                                    @foreach ($taxas as $taxa)
                                        <option value="{{ $taxa->id }}" data-qtd="{{ $taxa->qtd }}"
                                            data-percentage="{{ $taxa->percentage }}">
                                            {{ $taxa->menu_txt }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12 col-lg-12">
                        <div class="xp-invoice-summary">
                            <div class="table-responsive">
                                <table class="table table-striped table-borderless">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Item</th>
                                            <th v-if="installments >= 1" scope="col">Qtd Parcelas</th>
                                            <th v-if="installments >= 1" scope="col">Valor Parcela</th>
                                            <th scope="col" class="text-right">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody class="boleto-dados">
                                        <tr>
                                            <th id="qtdBank"></th>
                                            <td id="nameBoleto"></td>
                                            <td id="qtdParcelas"></td>
                                            <td id="valorParcela"></td>
                                            <td id="valorTotal" class="text-right"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12 col-lg-12">
                        <div class="xp-invoice-total text-right font-16">
                            <p>
                                Sub Total :
                                <span class="text-black f-w-5 font-18" id="subTotal"></span>
                            </p>
                            <p>
                                Valor Total :
                                <span class="text-black f-w-5 text-danger font-24" id="valorFinal"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6">
                        <div class="xp-invoice-note">
                            <p>
                                <span class="text-black f-w-5">Nota :</span> Todos os pagamentos gravados nessa área
                                serão validos
                            </p>
                            <button type="button" class="btn btn-success" onClick="window.print()">
                                <i class="mdi mdi-printer mr-2"></i> Imprimir
                            </button>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="xp-invoice-btn text-right">
                            <form action="{{ route('bank.sendBank', ['id' => $bank]) }}" method="POST">
                                @csrf
                                <input type="text" name="vendedor_id" hidden value="{{ auth()->user()->id }}">
                                <input type="text" name="menu_id" hidden value="{{ $bank }}">
                                <input type="text" name="client_id" hidden id="submitClient_id" value="">
                                <input type="text" name="type" hidden id="submitType" value="">

                                <div id="boleto-inputs">


                                </div>

                                @if ($saveBtn)
                                    <button style="display: none; float: right;" type='submit' id="btnSubmit"
                                        class='btn btn-primary'><i class='icon-cloud-upload'></i> Gravar</button>
                                @endif
                            </form>
                            @if ($saveBtn)
                                <button style="float: right" id="btnDisabled" disabled class="btn btn-primary"><i
                                        class="icon-cloud-upload"></i> Gravar</button>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function valueNone() {
        $("#dataVencimento").text('-');
        $("#statusBoleto").text('-');
        $("#qtdBank").text('-');
        $("#qtdParcelas").text('-');
        $("#nameBoleto").text('-');
        $("#valorParcela").text('-');
        $("#valorTotal").text('-');
        $("#valorFinal").text('-');
    }

    function pesquisaUser() {
        var app_url = '{{ env('APP_URL') }}';
        document.getElementById("msgDisplay").style.display = "none";
        const cpf = document.getElementById('xp-inputmask-cpf').value
        $.get(app_url + '/buscar-user/' + cpf, function(result) {
            if (result.type === 'error') {
                document.getElementById("msgDisplay").style.display = "block";
                document.getElementById("pesquisaUser").style.display = "none";
                document.getElementById("formsPagamento").style.display = "none";
                document.getElementById("formsPagamentoSelect").style.display = "none";
                $("#msgBank").text(result.message);
                btnSubmit(2)
            }
            if (result.type === 'success') {
                document.getElementById("pesquisaUser").style.display = "block";
                document.getElementById("formsPagamento").style.display = "block";
                document.getElementById("formsPagamentoSelect").style.display = "block";
                $("#userName").text(result.message.name);
                $("#userRuaN").text(result.message.logradouro + ', Nº' + result.message.numero);
                $("#addressCity").text(result.message.bairro + ', ' + result.message.localidade + ' - ' + result
                    .message.uf);
                $("#userFone").text(result.message.celular);
                $("#userEmail").text(result.message.email);
                document.getElementById('submitClient_id').value = result.message.user_id;
                btnSubmit(2)
            }
        })
    }


    function validBank() {
        const boletoContainers = $('.boleto-container');
        $(".statusBoleto").text('');
        $('.boleto-dados').empty();
        $('.boleto-inputs').empty();

        var priceSum = 0;

        boletoContainers.each(function(index) {
            const currentContainer = $(this);
            const boletoValue = currentContainer.find('.codBoleto').val();
            const bankData = dadosBoleto(boletoValue);

            const isExpiredBadgeClass = bankData.estaVencido ? 'badge-danger' : 'badge-success';
            currentContainer.find('.dataVencimento').removeClass('badge-danger badge-success').addClass(
                isExpiredBadgeClass);
            currentContainer.find('.dataVencimento').text(bankData.vencimento);

            const statusBadgeClass = bankData.sucesso ? 'badge-success' : 'badge-danger';
            currentContainer.find('.statusBoleto').removeClass('badge-danger badge-success').addClass(
                statusBadgeClass);
            currentContainer.find('.statusBoleto').text(bankData.mensagem);

            if (!bankData.sucesso) return;

            $('#boleto-inputs').append(`
                <input type="text" name="boletos[${index}][item]" hidden id="submitItem" value="${bankData.tipoBoleto}">
                <input type="text" name="boletos[${index}][codigo]" hidden id="submitCodigo" value="${bankData.codigoBarras}">
                <input type="text" name="boletos[${index}][vencimento]" hidden id="submitVencimento" value="${bankData.vencimento}">
                <input type="text" name="boletos[${index}][status]" hidden value="1">
                <input type="text" name="boletos[${index}][parcelas]" hidden id="submitParcelas" value="1">
                <input type="text" name="boletos[${index}][valorParcelas]" hidden id="submitValorParcelas" value="${bankData.valor}">
                <input type="text" name="boletos[${index}][subTotal]" hidden id="submitSubTotal" value="${bankData.valor}">
                <input type="text" name="boletos[${index}][total]" hidden id="submitTotal" value="${bankData.valor}">
            `)

            $('.boleto-dados').append(`
                  <tr>
                    <th id="qtdBank">1</th>
                    <td id="nameBoleto">${bankData.tipoBoleto}</td>
                    <td id="qtdParcelas">1</td>
                    <td id="valorParcela">${'R$ ' + formatValor(bankData.valor)}</td>
                    <td id="valorTotal" class="text-right">${'R$ ' + formatValor(bankData.valor)}</td>
                  </tr>
                `)

            priceSum += bankData.valor;
        });

        $("#subTotal").text('R$ ' + formatValor(priceSum));
        $("#valorFinal").text('R$ ' + formatValor(priceSum));

        this.soma = priceSum;
    }


    // function validBank() {
    //     document.getElementById("msgDisplay").style.display = "none";
    //     var dadosBank = dadosBoleto(document.getElementById('codBoleto').value);
    //     console.log(dadosBank)
    //     document.getElementById('submitItem').value = dadosBank.tipoBoleto
    //     document.getElementById('submitCodigo').value = dadosBank.codigoBarras
    //     document.getElementById('submitSubTotal').value = dadosBank.valor
    //     document.getElementById('submitVencimento').value = dadosBank.vencimento
    //     $("#dataVencimento").text(dadosBank.vencimento);
    //     $("#statusBoleto").text(dadosBank.mensagem);
    //     $("#qtdBank").text('1');
    //     $("#qtdParcelas").text('1');
    //     $("#nameBoleto").text(dadosBank.tipoBoleto);
    //     $("#valorParcela").text('R$ ' + formatValor(dadosBank.valor));
    //     $("#valorTotal").text('R$ ' + formatValor(dadosBank.valor));
    //     $("#subTotal").text('R$ ' + formatValor(dadosBank.valor));
    //     $("#valorFinal").text('R$ ' + formatValor(dadosBank.valor));
    //     btnSubmit(2)
    //     this.soma = dadosBank.valor;
    // }

    function formatPag(id) {
        document.getElementById('submitType').value = id;

        document.getElementById("msgDisplay").style.display = "none";
        if (id === 1 && this.soma > 0) {
            document.getElementById("selecParcelas").style.display = "block";
            reloadTicketPricesBasedOnInstallmentOption()
            btnSubmit(2)
        }
        if (id === 1 && this.soma == undefined) {
            reloadTicketPricesBasedOnInstallmentOption()
            document.getElementById("msgDisplay").style.display = "block";
            $("#msgBank").text('Para calcular o valor, é nescessario inserir o código do seu boleto!');
        }
        if (id === 2 && this.soma == undefined) {
            reloadTicketPrices()
            document.getElementById("msgDisplay").style.display = "block";
            $("#msgBank").text('Para calcular o valor, é nescessario inserir o código do seu boleto!');
        }
        if (id === 2 && this.soma > 0) {
            document.getElementById("selecParcelas").style.display = "none";
            reloadTicketPrices()
            btnSubmit(1)
            $("#valorParcela").text('R$ ' + formatValor(this.soma));
            $("#valorFinal").text('R$ ' + formatValor(this.soma));
            $("#valorTotal").text('R$ ' + formatValor(this.soma));
            $("#qtdParcelas").text('1');
            document.getElementById('submitParcelas').value = 1;
            document.getElementById('submitValorParcelas').value = formatValor(this.soma);
            document.getElementById('submitTotal').value = formatValor(this.soma);
        }
    }

    function reloadTicketPrices(qtd = 1, percentage = 0) {
        console.log('PIX')
        const boletoContainers = $('.boleto-container');
        $(".statusBoleto").text('');
        $('.boleto-dados').empty();
        $('#boleto-inputs').empty();
        var priceSum = 0;
        var valorParcelas = 0;

        boletoContainers.each(function(index) {
            const currentContainer = $(this);

            const boletoValue = currentContainer.find('.codBoleto').val();
            const bankData = dadosBoleto(boletoValue);
            const vSoma = bankData.valor + ((percentage * bankData.valor) / 100);
            const valorParcela = vSoma / qtd;

            console.log(vSoma);

            const isExpiredBadgeClass = bankData.estaVencido ? 'badge-danger' : 'badge-success';
            currentContainer.find('.dataVencimento').removeClass('badge-danger badge-success').addClass(
                isExpiredBadgeClass);
            currentContainer.find('.dataVencimento').text(bankData.vencimento);

            const statusBadgeClass = bankData.sucesso ? 'badge-success' : 'badge-danger';
            currentContainer.find('.statusBoleto').removeClass('badge-danger badge-success').addClass(
                statusBadgeClass);
            currentContainer.find('.statusBoleto').text(bankData.mensagem);

            if (!bankData.sucesso) return;

            $('#boleto-inputs').append(`
                <input type="text" name="boletos[${index}][item]" hidden id="submitItem" value="${bankData.tipoBoleto}">
                <input type="text" name="boletos[${index}][codigo]" hidden id="submitCodigo" value="${bankData.codigoBarras}">
                <input type="text" name="boletos[${index}][vencimento]" hidden id="submitVencimento" value="${bankData.vencimento}">
                <input type="text" name="boletos[${index}][status]" hidden value="1">
                <input type="text" name="boletos[${index}][parcelas]" hidden id="submitParcelas" value="${qtd}">
                <input type="text" name="boletos[${index}][valorParcelas]" hidden id="submitValorParcelas" value="${vSoma}">
                <input type="text" name="boletos[${index}][subTotal]" hidden id="submitSubTotal" value="${bankData.valor}">
                <input type="text" name="boletos[${index}][total]" hidden id="submitTotal" value="${vSoma}">
            `)

            $('.boleto-dados').append(`
                  <tr>
                    <th id="qtdBank">${index + 1}</th>
                    <td id="nameBoleto">${bankData.tipoBoleto}</td>
                    <td id="qtdParcelas">${qtd}</td>
                    <td id="valorParcela">${'R$ ' + formatValor(valorParcela)}</td>
                    <td id="valorTotal" class="text-right">${'R$ ' + formatValor(vSoma)}</td>
                  </tr>
            `)

            priceSum += vSoma;
        });

        $("#subTotal").text('R$ ' + formatValor(priceSum));
        $("#valorFinal").text('R$ ' + formatValor(priceSum));

        this.soma = priceSum;
    }

    function reloadTicketPricesBasedOnInstallmentOption() {
        const qtd = $('#numParcelas :selected').attr('data-qtd');
        const percentage = $('#numParcelas :selected').attr('data-percentage');
        reloadTicketPrices(qtd, percentage);
    }

    function qtdParcelas() {
        reloadTicketPricesBasedOnInstallmentOption()

        btnSubmit(1)
    }

    function btnSubmit(id) {
        if (id === 1) {
            document.getElementById("btnDisabled").style.display = "none";
            document.getElementById("btnSubmit").style.display = "block";
        } else {
            document.getElementById("btnDisabled").style.display = "block";
            document.getElementById("btnSubmit").style.display = "none";
        }
    }

    function addBankInput(currentButton) {

        currentButton.remove();
        $('.boleto-containers').append(`<x-boleto-container :status="false" :expirationDate="false" />`)

        const boletosInput = $('.codBoleto');
        const boletosInputCount = boletosInput.length;

        if (boletosInputCount >= 5) $('.add-boleto-input').remove();
    }

    valueNone();
</script>
