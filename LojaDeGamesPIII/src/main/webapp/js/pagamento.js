$("#avisovalor").css('visibility', 'hidden');


$("#cartao").attr('checked', false);
$("#vezesCartao").prop("disabled", true);
$("#vezesCartao").prop('required', false);

$("#numeroComprovante").prop("disabled", true);
$("#numeroComprovante").prop('required', false);

$("#valorParcela").prop("disabled", true);
$("#valorParcela").prop('required', false);

$("#bandeira").prop("disabled", true);
$("#bandeira").prop('required', false);

$("#valorEmEspecie").prop("disabled", true);
$("#valorEmEspecie").prop('required', false);



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

    valorTotal = $("#valorTotalDaCompraSemAlterar").val();

    valorTotal = Math.round(valorTotal);

    valorEmEspecie = $(this).val();

    valorEmEspecie = Math.round(valorEmEspecie);

    if (valorTotal < valorEmEspecie)
    {
        $("#avisovalor").css('visibility', 'visible');
        $(".btnFinalizarImprimir").prop("disabled", true);
    } else
    {
        $("#avisovalor").css('visibility', 'hidden');
        $(".btnFinalizarImprimir").prop("disabled", false);      
        
        $(".valorTotal").val(valorTotal - valorEmEspecie);


        retornocheckbox = $("#cartao").is(':checked');
        
        if (retornocheckbox ==true)
        {
            valorTotal = $(".valorTotal").val();

            qtdVezes = $("[type='number']").val();

            valorParcela = valorTotal / qtdVezes;

            $("#valorParcela").val(valorParcela);
       }
    }

});

$('body').on('keypress', '#valorEmEspecie', function () {
    $(this).click();
});

$('body').on('click', '#cartao', function () {

    retornocheckbox = $(this).is(':checked');

    console.log(retornocheckbox);

    if (retornocheckbox == false)
    {
        $("#vezesCartao").prop("disabled", true);
        $("#vezesCartao").prop('required', false);

        $("#numeroComprovante").prop("disabled", true);
        $("#numeroComprovante").prop('required', false);

        $("#valorParcela").prop("disabled", true);
        $("#valorParcela").prop('required', false);

        $("#bandeira").prop("disabled", true);
        $("#bandeira").prop('required', false);


    } else
    {
        $("#vezesCartao").prop("disabled", false);
        $("#vezesCartao").prop('required', true);

        $("#numeroComprovante").prop("disabled", false);
        $("#numeroComprovante").prop('required', true);

        $("#valorParcela").prop("disabled", false);
        $("#valorParcela").prop('required', true);

        $("#bandeira").prop("disabled", false);
        $("#bandeira").prop('required', true);
    }


});

$('body').on('click', '#dinheiro', function () {

    retornocheckbox = $(this).is(':checked');

    if (retornocheckbox == false)
    {
        $("#valorEmEspecie").prop("disabled", true);
        $("#valorEmEspecie").prop('required', false);




    } else
    {
        $("#valorEmEspecie").prop("disabled", false);
        $("#valorEmEspecie").prop('required', true);
    }


});

$(".btnFinalizarImprimir").click(function (evt) {
    
    subtotal = $(".valorTotal").val();
    
    if (subtotal > 0)
    {         
        evt.preventDefault();
        $("#myModal").modal();
        $("#avisodevedor").css('visibility', 'visible');
        $(".valorTotal").css('color','red');
    }

});