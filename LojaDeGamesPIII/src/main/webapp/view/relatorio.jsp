<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <c:if test="${empty sessionScope.getNome}">
            <c:redirect url = "/expulsarDaPaginaSemLogar"/>
        </c:if>
        <jsp:include page="/listaRelatorio" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Relatorio</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/validanumero.js"></script>
    </head>
    <body>
        <!-- Inicio Menu -->
        <nav class="navbar navbar-light bg-light">
            <div class="corpoimagem">
                <a href="${pageContext.request.contextPath}/view/index.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
            </div>
            <div class="informacoessobrefuncionario">
                <span class="nomedofuncionario">${sessionScope.getNome}</span> ●
                <span class="filialfuncionario">${sessionScope.getFilial}</span>  ●
                <span class="cargofuncionario">${sessionScope.getCargo}</span>  ●
                <span class="datafuncionario">${sessionScope.getData}</span>  
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
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="2500">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/aviso1.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/aviso2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item" >
                    <img class="d-block w-100" src="${pageContext.request.contextPath}/img/aviso3.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <nav class="navbar navbar-light separadorcarrocel">
        </nav>
        <div class="container">
            <div class="row" style="margin-top: 2%;">
                <h3> Página de relatorios </h3>
            </div>

            <div class="row">
                <!-- Fim do Carrocel-->

                <div class="corpotabela">
                    <div class="">
                        <!-- Verifica se tem vendas retornadas -->
                        <c:if test="${empty listaSemFiltro && empty listaComFiltro}">
                            Não há vendas realizadas.
                        </c:if>
                        <!-- Se não retornou vazio abre tabela -->
                        <c:if test="${not empty listaSemFiltro || not empty listaComFiltro}">

                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Tipo de venda</th>
                                        <th scope="col">Bandeira</th>
                                        <th scope="col">Data da Venda</th>
                                        <th scope="col">Filial</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Vendedor</th>
                                        <th scope="col">Número Comprovante</th>
                                        <th scope="col">Parcelamento (Vezes)</th>
                                        <th scope="col">SubTotal</th>
                                        <th scope="col">% Desconto</th>
                                        <th scope="col">Valor Pago Em Especie</th>
                                        <th scope="col">Valor Total</th>
                                        <th scope="col">Produtos</th>
                                    </tr>
                                </thead>
                                <tbody>


                                    <c:if test="${not empty listaSemFiltro}">
                                        <c:forEach var="Venda" items="${listaSemFiltro}">
                                            <tr class="">

                                                <td>${Venda.id}</td> 

                                                <c:if test="${not empty Venda.bandeira && not empty Venda.valorEmEspecie}">
                                                    <td>Venda com cartão e dinheiro</td> 
                                                </c:if>

                                                <c:if test="${empty Venda.valorEmEspecie}">
                                                    <td>Venda em cartão</td> 
                                                </c:if>

                                                <c:if test="${empty Venda.bandeira}">
                                                    <td>Venda em dinheiro</td> 
                                                </c:if>


                                                <td>${Venda.bandeira}</td>
                                                <td>${Venda.dataDaVenda}</td>
                                                <td>${Venda.filial}</td>
                                                <td>${Venda.idCliente}</td>
                                                <td>${Venda.idVendedor}</td>
                                                <td>${Venda.numeroComprovante}</td>
                                                <td>${Venda.vezesCartao}</td>
                                                <td>${Venda.subTotal}</td>
                                                <td>${Venda.desconto}%</td>
                                                <td>${Venda.valorEmEspecie}</td>
                                                <td>${Venda.valorTotal}</td>
                                                <td><a href="${pageContext.request.contextPath}/capturaProdutosDaVenda?idVenda=${Venda.id}">Visualizar Produtos</a></td>
                                            </c:forEach>
                                        </c:if>


                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
                <a class="suporte" href="#"> Solicitar Suporte  <img class="imagemsuporte" src="${pageContext.request.contextPath}/img/suporte.png"></a>
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
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nome Produto</th>
                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Preço de Custo</th>
                                    <th scope="col">Preço Total</th>                                  
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty listaDeProdutosDaCompra}">
                                    <c:forEach var="Produto" items="${listaDeProdutosDaCompra}">
                                        <tr class="">
                                            <td>${Produto.id}</td> 
                                            <td>${Produto.nomeProduto}</td> 
                                            <td>${Produto.quantidade}</td> 
                                            <td>${Produto.precoUnitario}</td> 
                                            <td>${Produto.precoUnitario * Produto.quantidade}</td> 
                                        </c:forEach>
                                    </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty abrirParaExibirProdutos}">
            <script type="text/javascript">
                $("#myModal").modal();
                $('#myModal').on('hidden.bs.modal', function () {
                    window.location.href = '${pageContext.request.contextPath}/view/relatorio.jsp'
                })
            </script>
        </c:if>
    </body>
</html>