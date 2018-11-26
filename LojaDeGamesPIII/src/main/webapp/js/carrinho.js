console.log("JS CARRINHO ACIONADO!");

GetCellValues();

var Estoque    = document.getElementById("tablecarrinho").rows[1].cells[2].innerHTML;
var Quantidade = document.getElementById("tablecarrinho").rows[1].cells[3].innerHTML;


function GetCellValues() {

    var tamanhoDaTable = $('#tablecarrinho tr').length;

    subTotal = 0;

    for (i = 1; i <= tamanhoDaTable - 1; i++)
    {
        total = parseInt($('#tablecarrinho').find("tr:eq(" + i + ")").find("td:eq(7)").html());
        subTotal = subTotal + total;
    }

    $("#subtotal").val(subTotal);

    valordodesconto = calculaDesconto();

    setaValorTotal(valordodesconto);

    //('#table1') - table Name
    // tr:eq(2) - table ROW
    // td:eq(1) - table COLUMN
}

function calculaDesconto()
{
    porcentagemdesconto = $("#desconto").val();

    subTotal = $("#subtotal").val();

    valordodesconto = per(subTotal, porcentagemdesconto);

    return valordodesconto;
}

$("#desconto").on("click", function () {

    valordodesconto = calculaDesconto();

    setaValorTotal(valordodesconto);

})
$("#desconto").on("change", function () {

    valordodesconto = calculaDesconto();

    setaValorTotal(valordodesconto);

})
function setaValorTotal(valordodesconto)
{
    subtotal = $("#subtotal").val();

    $("#valortotal").val(subtotal - valordodesconto);
}
function per(num, amount) {
    return num * amount / 100;
}