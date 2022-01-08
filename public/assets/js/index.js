//============= Identificar tipo de código do boleto =============

function identificarTipoCodigo(codigo) {
    codigo = codigo.replace(/[^0-9]/g, "");

    if (typeof codigo !== "string")
        throw new TypeError("Insira uma string válida!");

    if (codigo.length == 44) {
        return "CODIGO_DE_BARRAS";
    } else if (
        codigo.length == 46 ||
        codigo.length == 47 ||
        codigo.length == 48
    ) {
        return "LINHA_DIGITAVEL";
    } else {
        return "TAMANHO_INCORRETO";
    }
}

//==================================================================
// ============= Identificar o tipo de boleto inserido =============

function identificarTipoBoleto(codigo) {
    codigo = codigo.replace(/[^0-9]/g, "");

    if (typeof codigo !== "string")
        throw new TypeError("Insira uma string válida!");

    if (codigo.substr(0, 1) == "8") {
        if (codigo.substr(1, 1) == "1") {
            return "ARRECADACAO_PREFEITURA";
        } else if (codigo.substr(1, 1) == "2") {
            return "CONVENIO_SANEAMENTO";
        } else if (codigo.substr(1, 1) == "3") {
            return "CONVENIO_ENERGIA_ELETRICA_E_GAS";
        } else if (codigo.substr(1, 1) == "4") {
            return "CONVENIO_TELECOMUNICACOES";
        } else if (codigo.substr(1, 1) == "5") {
            return "ARRECADACAO_ORGAOS_GOVERNAMENTAIS";
        } else if (codigo.substr(1, 1) == "6" || codigo.substr(1, 1) == "9") {
            return "OUTROS";
        } else if (codigo.substr(1, 1) == "7") {
            return "ARRECADACAO_TAXAS_DE_TRANSITO";
        }
    } else {
        return "BANCO";
    }
}

//==================================================================
// ============= Identificar o código de referência para qual módulo
//usar para calcular os dígitos verificadores ======================

function identificarReferencia(codigo) {
    codigo = codigo.replace(/[^0-9]/g, "");

    const referencia = codigo.substr(2, 1);

    if (typeof codigo !== "string")
        throw new TypeError("Insira uma string válida!");

    switch (referencia) {
        case "6":
            return {
                mod: 10,
                efetivo: true,
            };
            break;
        case "7":
            return {
                mod: 10,
                efetivo: false,
            };
            break;
        case "8":
            return {
                mod: 11,
                efetivo: true,
            };
            break;
        case "9":
            return {
                mod: 11,
                efetivo: false,
            };
            break;
        default:
            break;
    }
}

//=======================================================================
// ============= Identificar a data de vencimento do boleto =============

function identificarData(codigo, tipoCodigo) {
    codigo = codigo.replace(/[^0-9]/g, "");
    const tipoBoleto = identificarTipoBoleto(codigo);

    let fatorData = "";
    let dataBoleto = new Date();

    dataBoleto.setFullYear(1997);
    dataBoleto.setMonth(9);
    dataBoleto.setDate(7);
    dataBoleto.setHours(23, 54, 59);

    if (tipoCodigo === "CODIGO_DE_BARRAS") {
        if (tipoBoleto == "BANCO") {
            fatorData = codigo.substr(5, 4);

            dataBoleto.setDate(dataBoleto.getDate() + Number(fatorData));
            dataBoleto.setTime(
                dataBoleto.getTime() +
                    dataBoleto.getTimezoneOffset() -
                    3 * 60 * 60 * 1000
            );
            var dataBoletoform =
                dataBoleto.getDate() +
                "/" +
                (dataBoleto.getMonth() + 1) +
                "/" +
                dataBoleto.getFullYear();

            return dataBoletoform;
        } else {
            dataBoleto = null;

            return dataBoleto;
        }
    } else if (tipoCodigo === "LINHA_DIGITAVEL") {
        if (tipoBoleto == "BANCO") {
            fatorData = codigo.substr(33, 4);
            dataBoleto.setDate(dataBoleto.getDate() + Number(fatorData));
            dataBoleto.setTime(
                dataBoleto.getTime() +
                    dataBoleto.getTimezoneOffset() -
                    3 * 60 * 60 * 1000
            );
            var dataBoletoform =
                dataBoleto.getDate() +
                "/" +
                (dataBoleto.getMonth() + 1) +
                "/" +
                dataBoleto.getFullYear();

            return dataBoletoform;
        } else {
            dataBoleto = null;

            return dataBoleto;
        }
    }
}

//==============================================================================
// ============= Identificar o preço do boleto do tipo arrecadação =============

function identificarValorCodBarrasArrecadacao(codigo, tipoCodigo) {
    codigo = codigo.replace(/[^0-9]/g, "");
    const isValorEfetivo = identificarReferencia(codigo).efetivo;

    let valorBoleto = "";
    let valorFinal;

    if (isValorEfetivo) {
        if (tipoCodigo == "LINHA_DIGITAVEL") {
            valorBoleto = codigo.substr(4, 14);
            valorBoleto = codigo.split("");
            valorBoleto.splice(11, 1);
            valorBoleto = valorBoleto.join("");
            valorBoleto = valorBoleto.substr(4, 11);
        } else if (tipoCodigo == "CODIGO_DE_BARRAS") {
            valorBoleto = codigo.substr(4, 11);
        }

        valorFinal = valorBoleto.substr(0, 9) + "." + valorBoleto.substr(9, 2);

        let char = valorFinal.substr(1, 1);
        while (char === "0") {
            valorFinal = substringReplace(valorFinal, "", 0, 1);
            char = valorFinal.substr(1, 1);
        }
    } else {
        valorFinal = 0;
    }

    return valorFinal;
}

//==========================================================
// ============= Identificar o preço do boleto =============

function identificarValor(codigo, tipoCodigo) {
    const tipoBoleto = identificarTipoBoleto(codigo);

    let valorBoleto = "";
    let valorFinal;

    if (tipoCodigo == "CODIGO_DE_BARRAS") {
        if (tipoBoleto == "BANCO") {
            valorBoleto = codigo.substr(9, 10);
            valorFinal =
                valorBoleto.substr(0, 8) + "." + valorBoleto.substr(8, 2);

            let char = valorFinal.substr(1, 1);
            while (char === "0") {
                valorFinal = substringReplace(valorFinal, "", 0, 1);
                char = valorFinal.substr(1, 1);
            }
        } else {
            valorFinal = identificarValorCodBarrasArrecadacao(
                codigo,
                "CODIGO_DE_BARRAS"
            );
        }
    } else if (tipoCodigo == "LINHA_DIGITAVEL") {
        if (tipoBoleto == "BANCO") {
            valorBoleto = codigo.substr(37);
            valorFinal =
                valorBoleto.substr(0, 8) + "." + valorBoleto.substr(8, 2);

            let char = valorFinal.substr(1, 1);
            while (char === "0") {
                valorFinal = substringReplace(valorFinal, "", 0, 1);
                char = valorFinal.substr(1, 1);
            }
        } else {
            valorFinal = identificarValorCodBarrasArrecadacao(
                codigo,
                "LINHA_DIGITAVEL"
            );
        }
    }
    return parseFloat(valorFinal);
}

//========================================================================================
// ============= Identificar o módulo para calcular os dígitos verificadores =============

function digitosVerificadores(codigo, mod) {
    codigo = codigo.replace(/[^0-9]/g, "");
    switch (mod) {
        case 10:
            return (codigo + calculaMod10(codigo)).toString();
            break;
        case 11:
            return (codigo + calculaMod11(codigo)).toString();
            break;
        default:
            break;
    }
}

//============================================================================
// ============= Converter o código de barras em linha digitável =============

function codBarras2LinhaDigitavel(codigo, formatada) {
    codigo = codigo.replace(/[^0-9]/g, "");

    const tipoBoleto = identificarTipoBoleto(codigo);

    let resultado = "";

    if (tipoBoleto == "BANCO") {
        const novaLinha =
            codigo.substr(0, 4) +
            codigo.substr(19, 25) +
            codigo.substr(4, 1) +
            codigo.substr(5, 14);

        const bloco1 =
            novaLinha.substr(0, 9) + calculaMod10(novaLinha.substr(0, 9));
        const bloco2 =
            novaLinha.substr(9, 10) + calculaMod10(novaLinha.substr(9, 10));
        const bloco3 =
            novaLinha.substr(19, 10) + calculaMod10(novaLinha.substr(19, 10));
        const bloco4 = novaLinha.substr(29);

        resultado = (bloco1 + bloco2 + bloco3 + bloco4).toString();

        if (formatada) {
            resultado =
                resultado.slice(0, 5) +
                "." +
                resultado.slice(5, 10) +
                " " +
                resultado.slice(10, 15) +
                "." +
                resultado.slice(15, 21) +
                " " +
                resultado.slice(21, 26) +
                "." +
                resultado.slice(26, 32) +
                " " +
                resultado.slice(32, 33) +
                " " +
                resultado.slice(33);
        }
    } else {
        const identificacaoValorRealOuReferencia =
            identificarReferencia(codigo);
        let bloco1;
        let bloco2;
        let bloco3;
        let bloco4;

        if (identificacaoValorRealOuReferencia.mod == 10) {
            bloco1 = codigo.substr(0, 11) + calculaMod10(codigo.substr(0, 11));
            bloco2 =
                codigo.substr(11, 11) + calculaMod10(codigo.substr(11, 11));
            bloco3 =
                codigo.substr(22, 11) + calculaMod10(codigo.substr(22, 11));
            bloco4 =
                codigo.substr(33, 11) + calculaMod10(codigo.substr(33, 11));
        } else if (identificacaoValorRealOuReferencia.mod == 11) {
            bloco1 = codigo.substr(0, 11) + calculaMod11(codigo.substr(0, 11));
            bloco2 =
                codigo.substr(11, 11) + calculaMod11(codigo.substr(11, 11));
            bloco3 =
                codigo.substr(22, 11) + calculaMod11(codigo.substr(22, 11));
            bloco4 =
                codigo.substr(33, 11) + calculaMod11(codigo.substr(33, 11));
        }

        resultado = bloco1 + bloco2 + bloco3 + bloco4;
    }

    return resultado;
}

//============================================================================
// ============= Converter a linha digitável em códgio de barras =============

function linhaDigitavel2CodBarras(codigo) {
    codigo = codigo.replace(/[^0-9]/g, "");

    const tipoBoleto = identificarTipoBoleto(codigo);

    let resultado = "";

    if (tipoBoleto == "BANCO") {
        resultado =
            codigo.substr(0, 4) +
            codigo.substr(32, 1) +
            codigo.substr(33, 14) +
            codigo.substr(4, 5) +
            codigo.substr(10, 10) +
            codigo.substr(21, 10);
    } else {
        codigo = codigo.split("");
        codigo.splice(11, 1);
        codigo.splice(22, 1);
        codigo.splice(33, 1);
        codigo.splice(44, 1);
        codigo = codigo.join("");

        resultado = codigo;
    }

    return resultado;
}

//==================================================================================================
// ============= Calcular o dígito verificador de toda a numeração do código de barras =============

function calculaDVCodBarras(codigo, posicaoCodigo, mod) {
    codigo = codigo.replace(/[^0-9]/g, "");

    codigo = codigo.split("");
    codigo.splice(posicaoCodigo, 1);
    codigo = codigo.join("");

    if (mod === 10) {
        return calculaMod10(codigo);
    } else if (mod === 11) {
        return calculaMod11(codigo);
    }
}

//=======================================================================
// ============= Identificar se o código de barras é válido =============

function validarCodigoComDV(codigo, tipoCodigo) {
    codigo = codigo.replace(/[^0-9]/g, "");
    let tipoBoleto;

    let resultado;

    if (tipoCodigo === "LINHA_DIGITAVEL") {
        tipoBoleto = identificarTipoBoleto(codigo, "LINHA_DIGITAVEL");

        if (tipoBoleto == "BANCO") {
            const bloco1 =
                codigo.substr(0, 9) + calculaMod10(codigo.substr(0, 9));
            const bloco2 =
                codigo.substr(10, 10) + calculaMod10(codigo.substr(10, 10));
            const bloco3 =
                codigo.substr(21, 10) + calculaMod10(codigo.substr(21, 10));
            const bloco4 = codigo.substr(32, 1);
            const bloco5 = codigo.substr(33);

            resultado = (bloco1 + bloco2 + bloco3 + bloco4 + bloco5).toString();
        } else {
            const identificacaoValorRealOuReferencia =
                identificarReferencia(codigo);
            let bloco1;
            let bloco2;
            let bloco3;
            let bloco4;

            if (identificacaoValorRealOuReferencia.mod == 10) {
                bloco1 =
                    codigo.substr(0, 11) + calculaMod10(codigo.substr(0, 11));
                bloco2 =
                    codigo.substr(12, 11) + calculaMod10(codigo.substr(12, 11));
                bloco3 =
                    codigo.substr(24, 11) + calculaMod10(codigo.substr(24, 11));
                bloco4 =
                    codigo.substr(36, 11) + calculaMod10(codigo.substr(36, 11));
            } else if (identificacaoValorRealOuReferencia.mod == 11) {
                bloco1 = codigo.substr(0, 11);
                bloco2 = codigo.substr(12, 11);
                bloco3 = codigo.substr(24, 11);
                bloco4 = codigo.substr(36, 11);

                dv1 = parseInt(codigo.substr(11, 1));
                dv2 = parseInt(codigo.substr(23, 1));
                dv3 = parseInt(codigo.substr(35, 1));
                dv4 = parseInt(codigo.substr(47, 1));

                valid =
                    calculaMod11(bloco1) == dv1 &&
                    calculaMod11(bloco2) == dv2 &&
                    calculaMod11(bloco3) == dv3 &&
                    calculaMod11(bloco4) == dv4;

                return valid;
            }

            resultado = bloco1 + bloco2 + bloco3 + bloco4;
        }
    } else if (tipoCodigo === "CODIGO_DE_BARRAS") {
        tipoBoleto = identificarTipoBoleto(codigo, "CODIGO_DE_BARRAS");

        if (tipoBoleto == "BANCO") {
            const DV = calculaDVCodBarras(codigo, 4, 11);
            resultado = codigo.substr(0, 4) + DV + codigo.substr(5);
        } else {
            const identificacaoValorRealOuReferencia =
                identificarReferencia(codigo);

            resultado = codigo.split("");
            resultado.splice(3, 1);
            resultado = resultado.join("");

            const DV = calculaDVCodBarras(
                codigo,
                3,
                identificacaoValorRealOuReferencia.mod
            );
            resultado = resultado.substr(0, 3) + DV + resultado.substr(3);
        }
    }

    return codigo === resultado;
}

//=====================================================================================
// ============= Gerar código de barras com calculo do digito verificador =============

function geraCodBarras(codigo) {
    codigo = codigo.replace(/[^0-9]/g, "");

    const tipoBoleto = identificarTipoBoleto(codigo);

    let novoCodigo;

    novoCodigo = linhaDigitavel2CodBarras(codigo);
    novoCodigo = novoCodigo.split("");
    novoCodigo.splice(4, 1);
    novoCodigo = novoCodigo.join("");
    let dv = calculaMod11(novoCodigo);
    novoCodigo = novoCodigo.substr(0, 4) + dv + novoCodigo.substr(4);

    return novoCodigo;
}

//=============================================================================================
// ============= Calcular o digito verificador de numeração a partir do módulo 10 =============

function calculaMod10(numero) {
    numero = numero.replace(/\D/g, "");
    var i;
    var mult = 2;
    var soma = 0;
    var s = "";

    for (i = numero.length - 1; i >= 0; i--) {
        s = mult * parseInt(numero.charAt(i)) + s;
        if (--mult < 1) {
            mult = 2;
        }
    }
    for (i = 0; i < s.length; i++) {
        soma = soma + parseInt(s.charAt(i));
    }
    soma = soma % 10;
    if (soma != 0) {
        soma = 10 - soma;
    }
    return soma;
}

//=============================================================================================
// ============= Calcular o digito verificador de numeração a partir do módulo 11 =============

function calculaMod11(x) {
    let sequencia = [4, 3, 2, 9, 8, 7, 6, 5];
    let digit = 0;
    let j = 0;
    let DAC = 0;

    for (var i = 0; i < x.length; i++) {
        let mult = sequencia[j];
        j++;
        j %= sequencia.length;
        digit += mult * parseInt(x.charAt(i));
    }

    DAC = 11 - (digit % 11);

    if (DAC == 0 || DAC == 1 || DAC == 10 || DAC == 11) return 1;
    else return DAC;
}

//====================================================================================
// ============= Função auxiliar para remover os zeros no código inserido=============

function substringReplace(str, repl, inicio, tamanho) {
    if (inicio < 0) {
        inicio = inicio + str.length;
    }

    tamanho = tamanho !== undefined ? tamanho : str.length;
    if (tamanho < 0) {
        tamanho = tamanho + str.length - inicio;
    }

    return [
        str.slice(0, inicio),
        repl.substr(0, tamanho),
        repl.slice(tamanho),
        str.slice(inicio + tamanho),
    ].join("");
}

// ============= Obter dados do boleto =============
dadosBoleto = (codigo) => {
    let retorno = {};
    codigo = codigo.replace(/[^0-9]/g, "");

    let tipoCodigo = identificarTipoCodigo(codigo);

    if (codigo.length == 36) {
        codigo = codigo + "00000000000";
    } else if (codigo.length == 46) {
        codigo = codigo + "0";
    }

    if (
        codigo.length != 44 &&
        codigo.length != 46 &&
        codigo.length != 47 &&
        codigo.length != 48
    ) {
        retorno.sucesso = false;
        retorno.codigoInput = codigo;
        retorno.mensagem =
            "O código inserido possui " +
            codigo.length +
            " dígitos. Por favor insira uma numeração válida. Códigos de barras SEMPRE devem ter 44 caracteres numéricos. Linhas digitáveis podem possuir 46 (boletos de cartão de crédito), 47 (boletos bancários/cobrança) ou 48 (contas convênio/arrecadação) caracteres numéricos. Qualquer caractere não numérico será desconsiderado.";
    } else if (
        codigo.substr(0, 1) == "8" &&
        codigo.length == 46 &&
        codigo.length == 47
    ) {
        retorno.sucesso = false;
        retorno.codigoInput = codigo;
        retorno.mensagem =
            "Este tipo de boleto deve possuir um código de barras 44 caracteres numéricos. Ou linha digitável de 48 caracteres numéricos.";
    } else if (!validarCodigoComDV(codigo, tipoCodigo)) {
        retorno.sucesso = false;
        retorno.codigoInput = codigo;
        retorno.mensagem =
            "A validação do dígito verificador falhou. Tem certeza que inseriu a numeração correta?";
    } else {
        retorno.sucesso = true;
        retorno.codigoInput = codigo;
        retorno.mensagem = "Boleto válido";

        switch (tipoCodigo) {
            case "LINHA_DIGITAVEL":
                retorno.tipoCodigoInput = "LINHA_DIGITAVEL";
                retorno.tipoBoleto = identificarTipoBoleto(
                    codigo,
                    "LINHA_DIGITAVEL"
                );
                retorno.codigoBarras = linhaDigitavel2CodBarras(codigo);
                retorno.linhaDigitavel = codigo;
                retorno.vencimento = identificarData(codigo, "LINHA_DIGITAVEL");
                retorno.estaVencido = estaVencido(
                    identificarData(codigo, "LINHA_DIGITAVEL")
                );
                retorno.valor = identificarValor(codigo, "LINHA_DIGITAVEL");
                break;
            case "CODIGO_DE_BARRAS":
                retorno.tipoCodigoInput = "CODIGO_DE_BARRAS";
                retorno.tipoBoleto = identificarTipoBoleto(
                    codigo,
                    "CODIGO_DE_BARRAS"
                );
                retorno.codigoBarras = codigo;
                retorno.linhaDigitavel = codBarras2LinhaDigitavel(
                    codigo,
                    false
                );
                retorno.vencimento = identificarData(
                    codigo,
                    "CODIGO_DE_BARRAS"
                );
                retorno.estaVencido = estaVencido(
                    identificarData(codigo, "CODIGO_DE_BARRAS")
                );
                retorno.valor = identificarValor(codigo, "CODIGO_DE_BARRAS");
                break;
            default:
                break;
        }
    }

    return retorno;
};

function estaVencido(data) {
    data = data.replace(/(\d{1,2})\/(\d{1,2})\/(\d{4})/, "$3-$2-$1");
    const now = new Date();
    const boletoDate = new Date(data);
    return now - boletoDate > 0;
}

function limpacod(codigo) {
    return codigo.replace(/( |\.|-)/g, "");
}

function modulo10(bloco) {
    const codigo = bloco.split("").reverse();
    const somatorio = codigo.reduce((acc, current, index) => {
        let soma = Number(current) * (((index + 1) % 2) + 1);
        soma = soma > 9 ? Math.trunc(soma / 10) + (soma % 10) : soma;
        return acc + soma;
    }, 0);
    return Math.ceil(somatorio / 10) * 10 - somatorio;
}

function modulo11Bancario(bloco) {
    const codigo = bloco.split("").reverse();
    let multiplicador = 2;
    const somatorio = codigo.reduce((acc, current) => {
        const soma = Number(current) * multiplicador;
        multiplicador = multiplicador === 9 ? 2 : multiplicador + 1;
        return acc + soma;
    }, 0);
    const restoDivisao = somatorio % 11;
    const DV = 11 - restoDivisao;
    if (DV === 0 || DV === 10 || DV === 11) return 1;
    return DV;
}

function modulo11Arrecadacao(bloco) {
    const codigo = bloco.split("").reverse();
    let multiplicador = 2;
    const somatorio = codigo.reduce((acc, current) => {
        const soma = Number(current) * multiplicador;
        multiplicador = multiplicador === 9 ? 2 : multiplicador + 1;
        return acc + soma;
    }, 0);
    const restoDivisao = somatorio % 11;

    if (restoDivisao === 0 || restoDivisao === 1) {
        return 0;
    }
    if (restoDivisao === 10) {
        return 1;
    }
    const DV = 11 - restoDivisao;
    return DV;
}

function convertToBoletoArrecadacaoCodigoBarras(codigo) {
    const cod = limpacod(codigo);
    let codigoBarras = "";
    for (let index = 0; index < 4; index++) {
        const start = 11 * index + index;
        const end = 11 * (index + 1) + index;
        codigoBarras += cod.substring(start, end);
    }
    return codigoBarras;
}

function convertToBoletoBancarioCodigoBarras(codigo) {
    const cod = limpacod(codigo);
    let codigoBarras = "";
    codigoBarras += cod.substring(0, 3); // Identificação do banco
    codigoBarras += cod.substring(3, 4); // Código da moeda
    codigoBarras += cod.substring(32, 33); // DV
    codigoBarras += cod.substring(33, 37); // Fator Vencimento
    codigoBarras += cod.substring(37, 47); // Valor nominal
    codigoBarras += cod.substring(4, 9); // Campo Livre Bloco 1
    codigoBarras += cod.substring(10, 20); // Campo Livre Bloco 2
    codigoBarras += cod.substring(21, 31); // Campo Livre Bloco 3
    return codigoBarras;
}

function boletoBancarioCodigoBarras(codigo) {
    const cod = limpacod(codigo);
    if (!/^[0-9]{44}$/.test(cod)) return false;
    const DV = cod[4];
    const bloco = cod.substring(0, 4) + cod.substring(5);
    return modulo11Bancario(bloco) === Number(DV);
}

function boletoBancarioLinhaDigitavel(codigo, validarBlocos = false) {
    const cod = limpacod(codigo);
    if (!/^[0-9]{47}$/.test(cod)) return false;
    const blocos = [
        {
            num: cod.substring(0, 9),
            DV: cod.substring(9, 10),
        },
        {
            num: cod.substring(10, 20),
            DV: cod.substring(20, 21),
        },
        {
            num: cod.substring(21, 31),
            DV: cod.substring(31, 32),
        },
    ];
    const validBlocos = validarBlocos
        ? blocos.every((e) => modulo10(e.num) === Number(e.DV))
        : true;
    const validDV = boletoBancarioCodigoBarras(
        convertToBoletoBancarioCodigoBarras(cod)
    );
    return validBlocos && validDV;
}

function boletoBancario(codigo, validarBlocos = false) {
    const cod = limpacod(codigo);
    if (cod.length === 44) return boletoBancarioCodigoBarras(cod);
    if (cod.length === 47)
        return boletoBancarioLinhaDigitavel(codigo, validarBlocos);
    return false;
}

function boletoArrecadacaoCodigoBarras(codigo) {
    const cod = limpacod(codigo);
    if (!/^[0-9]{44}$/.test(cod) || Number(cod[0]) !== 8) return false;
    const codigoMoeda = Number(cod[2]);
    const DV = Number(cod[3]);
    const bloco = cod.substring(0, 3) + cod.substring(4);
    let modulo;
    if (codigoMoeda === 6 || codigoMoeda === 7) modulo = modulo10;
    else if (codigoMoeda === 8 || codigoMoeda === 9)
        modulo = modulo11Arrecadacao;
    else return false;
    return modulo(bloco) === DV;
}

function boletoArrecadacaoLinhaDigitavel(codigo, validarBlocos = false) {
    const cod = limpacod(codigo);
    if (!/^[0-9]{48}$/.test(cod) || Number(cod[0]) !== 8) return false;
    const validDV = boletoArrecadacaoCodigoBarras(
        convertToBoletoArrecadacaoCodigoBarras(cod)
    );
    if (!validarBlocos) return validDV;
    const codigoMoeda = Number(cod[2]);
    let modulo;
    if (codigoMoeda === 6 || codigoMoeda === 7) modulo = modulo10;
    else if (codigoMoeda === 8 || codigoMoeda === 9)
        modulo = modulo11Arrecadacao;
    else return false;
    const blocos = Array.from(
        {
            length: 4,
        },
        (v, index) => {
            const start = 11 * index + index;
            const end = 11 * (index + 1) + index;
            return {
                num: cod.substring(start, end),
                DV: cod.substring(end, end + 1),
            };
        }
    );
    const validBlocos = blocos.every((e) => modulo(e.num) === Number(e.DV));
    return validBlocos && validDV;
}

function boletoArrecadacao(codigo, validarBlocos = false) {
    const cod = limpacod(codigo);
    if (cod.length === 44) return boletoArrecadacaoCodigoBarras(cod);
    if (cod.length === 48)
        return boletoArrecadacaoLinhaDigitavel(codigo, validarBlocos);
    return false;
}

// ============= Fazer validação do boleto =============
validarBoleto = (codigo, validarBlocos = false) => {
    const cod = limpacod(codigo);
    if (Number(cod[0]) === 8) return boletoArrecadacao(cod, validarBlocos);
    return boletoBancario(cod, validarBlocos);
};

function formatValor(value) {
    var format = value.toLocaleString("pt-br", {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2,
    });
    return format;
}
