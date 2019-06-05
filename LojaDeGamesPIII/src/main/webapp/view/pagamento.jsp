<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Carrinho</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/validanumero.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>
            <form action="${pageContext.request.contextPath}/sairLogin" method="post">
                <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                    <button type="button" class="btn btn-primary" >Carrinho</button>
                </a>
                <button type="submit" class="btn btn-primary btnSair">Sair</button>
            </form>
        </nav>
        <!-- Fim Menu -->
        <!-- Inicio Carrocel -->
        
        <nav class="navbar navbar-light separadorcarrocel">
        </nav>
        <form method="POST" action="${pageContext.request.contextPath}/finalizarVenda">
            <div class="container">
                <div class="row">
                    <div class="col-8 titulocorpopagamento">
                        <h3> Pagamento </h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 corpopagamento">
                        <div class="col-8 corpovalortotal">
                            <h4>Total:</h4>
                            <input type="text" id="valorTotalDaCompraSemAlterar"  class="valorTotalDaCompraSemAlterar form-control" name="valorTotalDaCompraSemAlterar" value="${valorTotal}" style="visibility: visible;" readonly="readonly"></input>

                            <h6 style="margin-top: 1%;"> Sub Total / Restante </h6>
                            <input type="text" id="valorTotal"  class="valorTotal form-control" name="valorTotal" value="${valorTotal}" style="visibility: visible;" readonly="readonly"></input>

                        </div>

                        <div class="col-8 corpoopcaocartao">
                            <input type="checkbox" id="cartao" name="cartao" value="Pagamento em cartao">Pagamento em cartão<br>
                            <label>Parcelamento (Em até 12X):</label>
                            <div class="input-group mb-2 vezesCartao">                              
                                <input type="number" class="form-control " id="vezesCartao" name="vezesCartao" value="10" onkeypress="return isNumberKey(event)" max="12" ></input>
                                <div class="input-group-prepend">
                                    <div class="input-group-text">X</div>
                                </div>
                            </div>                            
                            <label>Número do comprovante:</label>
                            <input type="text" class="form-control" id="numeroComprovante" name="numeroComprovante" onkeypress="return isNumberKey(event)" maxlength="20"></input>
                            <div class="form-group">
                                <label>Bandeira</label>
                                <select class="form-control" id="bandeira" name="bandeira" required>
                                    <option value="VISA">VISA</option>
                                    <option value="MASTERCARD">MASTERCARD</option>
                                    <option value="OUTROS">OUTROS</option>
                                </select>
                            </div>
                            <label>Valor parcela:</label>
                            <input type="text" class="form-control" id="valorParcela" class="valorParcela" name="valorParcela" readonly="readonly"></input>
                        </div>
                        <div class="col-8 corpoopcaodinheiro">
                            <input type="checkbox" id="boleto" name="boleto" value="Pagamento em boleto">Pagamento em Boleto<br>
                            <span id="avisovalor" style="color:red"><b>Valor em especie maior que o valor: Sub Total / Restante!</b></span>
                        </div>

                        <div class="col-8 corpodebotoesfinais">
                            <a href="${pageContext.request.contextPath}/view/destaques.jsp"><button type="button" class="btn btn-secondary btnCancelar" >Cancelar compra</button></a>
                            <a href="${pageContext.request.contextPath}/view/carrinho.jsp"><button type="button" class="btn btn-secondary btnVoltaCarrinho" >Voltar ao carrinho</button></a>
                            <a href="${pageContext.request.contextPath}/view/finalizacao.jsp"><button type="submit" class="btn btn-secondary btnFinalizarImprimir" >Imprimir recibo e finalizar</button></a>
                        </div>                         
                    </div>
                </div>
            </div>
        </form>
        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
            </div>
        </footer>
        <!-- Fim Footer -->
        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/pagamento.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>
        <script src="${pageContext.request.contextPath}/js/pagamento.js"></script>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><img src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogomodal" style="width:20%;"> </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ${retornoMensagem}     
                    </div>
                    <div class="modal-body" id="avisodevedor" style="visibility: hidden;">
                        Ainda há saldo para ser quitado (SubTotal / Restante)!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty retorno}">
            <script type="text/javascript">
                                    $("#myModal").modal();
                                    $('#myModal').on('hidden.bs.modal', function () {
                                        window.location.href = '${pageContext.request.contextPath}/view/pagamento.jsp'
                                    })
            </script>
        </c:if>
    </body>
</html>