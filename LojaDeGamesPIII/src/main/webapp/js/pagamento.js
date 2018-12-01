$(".avisovalor").css('visibility', 'hidden');


$("[type='number']").keypress(function (evt) {
    evt.preventDefault();
});

$("[type='number']").click(function () {
    valorTotal = $(".valorTotal").val();

    qtdVezes = $(this).val();

    valorParcela = valorTotal / qtdVezes;

    $("#valorParcela").val(valorParcela);

    console.log(valorParcela);
});





$('body').on('change', '#valorEmEspecie', function () {

    valorTotal = $("#valorTotal").val();

    valorTotal = Math.round(valorTotal);

    valorEmEspecie = $(this).val();

    valorEmEspecie = Math.round(valorEmEspecie);

    console.log(valorEmEspecie);
    console.log(valorTotal);
    
    if (valorEmEspecie > valorTotal)
    {
        $(".avisovalor").css('visibility', 'visible');
    }

    if (valorEmEspecie < valorTotal)
    {
        $(".btnFinalizarImprimir").attr("disable", "disable");
       
    } else
    {
        $(".avisovalor").css('visibility', 'hidden');
        $(".btnFinalizarImprimir").attr("enable", "enable");
        $(".valorTotal").val(valorTotal - valorEmEspecie);
    }

});

$('body').on('keypress', '#valorEmEspecie', function () {
    $(this).click();
});