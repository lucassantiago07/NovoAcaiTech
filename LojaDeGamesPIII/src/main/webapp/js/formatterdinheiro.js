function numeroParaMoeda(n, c, d, t)
{
    c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
}

function validate(evt) {
    var theEvent = evt || window.event;

    // Handle paste
    if (theEvent.type === 'paste') {
        key = event.clipboardData.getData('text/plain');
    } else {
        // Handle key press
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
    }
    var regex = /[0-9]|\.,/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault)
            theEvent.preventDefault();
    }
}
$(document).on('keypress', '#precoVenda', function () {
    
    console.log("$(this).length");
    
    if ($(this).length > 2)
    {
        console.log("caiu!!!")
        var precoVenda = $("#precoVenda").val();
        $("#precoVenda").val(numeroParaMoeda(precoVenda));
    }

});

$(document).on('keypress', '#precoCusto', function () {

    if ($(this).length  > 2)
    {
        var precoCusto = $("#precoCusto").val();
        $("#precoCusto").val(numeroParaMoeda(precoCusto));
    }
});

