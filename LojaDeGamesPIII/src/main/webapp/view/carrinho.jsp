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

    <!-- Inicio Menu -->
    <nav class="navbar navbar-light bg-light">
        <div class="corpoimagem">
            <a href="${pageContext.request.contextPath}/view/index.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
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
    <!-- Fim Carrocel -->
    <!-- Inicio Separador -->
    <nav class="navbar navbar-light separadorcarrocel">
    </nav>
    <!-- Fim Separador -->
    <!-- Inicio Corpo De Campo -->


    <form method="POST" action="${pageContext.request.contextPath}/roteamentoPagamentoXBuscaCliente">
        <div class="container corpodecampos">
            <h3>Carrinho</h3>
            <h6 class="avisodecarrinho" style="margin-top: 2%"></h6>
            <a id="linkparadestaques" href="${pageContext.request.contextPath}/view/destaques.jsp" style="visibility: hidden;">Ir a lista de produtos..</a>
            <c:if test="${not empty listaProdutos}">
                <table class="table table-sm" id="tablecarrinho">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Produto</th>
                            <th scope="col">Estoque</th>
                            <th scope="col">Quantidade</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col">Preço Unitario</th>
                            <th scope="col">Preço Total</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Lista para itens com filtros -->
                        <c:if test="${not empty listaProdutos}">
                            <c:forEach var="produto" items="${listaProdutos}">
                                <tr class="">
                                    <c:if test="${produto.qtdCarrinho >0}">
                                        <td>${produto.id}</td>
                                        <td>${produto.nome}</td>
                                        <td>${produto.estoque}</td>
                                        <td>${produto.qtdCarrinho}</td>
                                        <td>                           
                                            <c:if test="${produto.estoque != produto.qtdCarrinho}">
                                                <a href="${pageContext.request.contextPath}/adicionarAoCarrinho?idProduto=${produto.id}"><img  src="${pageContext.request.contextPath}/img/add.png"  style="width: 35px;"></a>                                         
                                                </c:if>
                                            </a>
                                        </td>
                                        <td>
                                            <c:if test="${produto.qtdCarrinho >= 2}">
                                                <a href="${pageContext.request.contextPath}/diminuiQtdCarrinho?idProduto=${produto.id}"><img  src="${pageContext.request.contextPath}/img/remove.png"  style="width: 35px;"></a>                                       
                                                </c:if>
                                        </td>
                                        <td>${produto.precoDeVenda}</td>
                                        <td type="number">${produto.precoDeVenda * produto.qtdCarrinho}</td>
                                        <td>  <a href="${pageContext.request.contextPath}/removeDoCarrinho?idProduto=${produto.id}">Remover</a>  </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                <div class="row">
                    <!--
                    <div class="col-4">
                        <div class="informacoesdocliente">
                            <label style="margin-top: 2%">Nome do cliente: </label>  
                            <input type="text" class="form-control form-control-sm nomeCliente"   value="${sessionScope.nomeCliente}" readonly="readonly"></input>
                            <label style="margin-top: 2%">CPF: </label>  
                            <input type="text" class="form-control form-control-sm cpfCliente"   value="${sessionScope.cpfCliente}" readonly="readonly"></input>
                            <label style="margin-top: 2%">Contato: </label>  
                            <input type="text" class="form-control form-control-sm celularCliente"   value="${sessionScope.celularCliente}"  readonly="readonly"></input>
                            <button type="button" class="btn btn-primary btnContinuar"> <a href="${pageContext.request.contextPath}/view/destaques.jsp" style="color:white">Continuar comprando</a> </button>
                        </div>
                    </div>
                    -->
                    <div class="col-10">
                        <div class="informacoessobrepreco">
                           <! <label style="margin-top: 2%">Total: </label>  
                            <input type="text"  pattern="([0-9]|[0-9]|[0-9])" class="form-control form-control-sm"  name="subTotal" id="subtotal" readonly="readonly"></input>

                            <input type="hidden" pattern="([0-9]|[0-9]|[0-9])" class="form-control form-control-sm"   name="Desconto" id="desconto"  value="0" maxlength="2" max="20"></input>

                            <input type="hidden"  pattern="([0-9]|[0-9]|[0-9])" class="form-control form-control-sm"   name="valorTotal" id="valortotal" readonly="readonly"></input>

                            <button type="submit"  name="controledeChamadas" value="irPagaPagamento" class="btn btn-primary btnGeral btnFinalizar" data-toggle="tooltip" data-placement="bottom" title="Pagamento seguir ao pagamento, escolha seu produto e pesquisa um cliente.">Ir para pagamento</button>
                        </div>
                    </div>
                </c:if>
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
    <link type="text/css" href="${pageContext.request.contextPath}/css/carrinho.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>
    <script src="${pageContext.request.contextPath}/js/carrinho.js"></script>
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
                    ${retornoMensagem}<br>
                    Deseja cadastrar um cliente?
                    <div class="container corpobtnCadastrarCliente">
                        <button type="button" class="btn btn-primary btnCadastrarCliente" onclick="window.location.href = '${pageContext.request.contextPath}/view/cadastrarCliente.jsp'">Sim</button>
                        <button type="button" class="btn btn-primary btnCadastrarCliente" onclick="window.location.href = '${pageContext.request.contextPath}/view/carrinho.jsp'">Não</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
    <!--  Captura a variavel de retorno e abre modal-->
    <c:if test="${empty listaProdutos}">
        <script type="text/javascript">
            $(".avisodecarrinho").text("Não existem produtos adicionados ao carrinho.");
            $("#linkparadestaques").css("visibility", "visible");
        </script>
    </c:if>   
    <!--  Captura a variavel de retorno e abre modal-->
    <c:if test="${not empty retorno}">
        <script type="text/javascript">
            $("#myModal").modal();
            $('#myModal').on('hidden.bs.modal', function () {
                window.location.href = '${pageContext.request.contextPath}/view/carrinho.jsp'
            })
        </script>
    </c:if>

</html>