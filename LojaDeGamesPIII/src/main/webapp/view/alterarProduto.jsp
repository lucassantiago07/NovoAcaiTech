<%-- 
   Document   : alterarProduto
   Created on : 16/10/2018, 09:22:17
   Author     : angelo.xavier
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <c:if test="${empty sessionScope.getNome}">
            <c:redirect url = "/expulsarDaPaginaSemLogar"/>
        </c:if>
        <jsp:include page="/capturaProduto" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>AcaiTech Sistema - Alterar Produtos</title>
        <link type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/validanumero.js"></script>
    </head>
    <!-- Inicio Menu -->
    <nav class="navbar navbar-light bg-light">
                <div class="corpoimagem">
                    <a href="${pageContext.request.contextPath}/view/destaques.jsp"><img  src="${pageContext.request.contextPath}/img/logo.png"  class="imagemlogo"></a>
                </div>

                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li class="active-menu">
                            <a id="idhomejsp" href="destaques.jsp">Home</a>

                        </li>


                    </ul>
                </div>

                <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a href="institucional.jsp">Institucional</a>
                        </li>


                    </ul>
                </div>

                <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a href="listaProduto.jsp">Gerenciamento de Produtos</a>
                        </li>


                    </ul>
                </div>

                <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a href="relatorio.jsp">Relatórios</a>
                        </li>


                    </ul>
                </div>

                <div class="menu-desktop">
                    <ul class="main-menu">

                        <li>
                            <a href="listaCliente.jsp">Meus Dados</a>
                        </li>


                    </ul>
                </div>



                <form action="${pageContext.request.contextPath}/sairLogin" method="post">

                    <a style="color:white;" href="/view/login.jsp">
                        <button type="button" class="btn btn-primary" >Login</button>
                    </a>

                    <a style="color:white;" href="${pageContext.request.contextPath}/view/carrinho.jsp">
                        <button type="button" class="btn btn-primary" >Carrinho</button>
                    </a>
                    <button type="submit" class="btn btn-primary btnSair">Sair</button>
                </form>
            </nav>
    <!-- Fim Menu -->
    <body>
        <!-- Inicio Carrocel -->
        
        <!-- Fim Carrocel -->

        <!-- Inicio Separador -->
        <nav class="navbar navbar-light separadorcarrocel">

        </nav>
        <!-- Fim Separador -->

        <!-- Inicio Corpo De Campo -->
        <div class="container corpodecampos">

            <h3>Alterar Produto</h3>

            <form name="formularioProduto" id="formularioProduto" action="${pageContext.request.contextPath}/alterarProduto" method="post">

                <div class="form-group">
                    <label>Identificador do Produto:</label>
                    <input class="form-control" id="id" name="id" value="${produto.id}" readonly="readonly"></input>
                </div>



                <div class="form-group">
                    <label>Nome do Produto</label>
                    <input class="form-control" id="nomeProduto" value="${produto.nome}" name="nomeProduto" maxlength="20" required></input>
                </div>
                <div class="form-group">
                    <label>Preço De Venda</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">R$</div>
                        </div>
                        <input type="Text" class="form-control"  id="precoVenda" name="precoVenda" size="4" maxlength="5" onkeypress="return isNumberKey(event)"  value="${produto.precoDeVenda}" required />

                    </div>
                </div>
                <div class="form-group">
                    <label>Preço De Custo</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">R$</div>
                        </div>
                        <input type="Text" class="form-control"  id="precoCusto" name="precoCusto" size="4" maxlength="5" onkeypress="return isNumberKey(event)" value="${produto.precoDeCusto}" required />


                    </div>
                </div>
                <div class="form-group">
                    <label>Fornecedor</label>
                    <input class="form-control" id="fornecedor" name="fornecedor" maxlength="20" value="${produto.fornecedor}" required></input>
                </div>
                <div class="form-group">
                    <label>Plataforma</label>
                    <input class="form-control" id="plataforma" name="plataforma" maxlength="20" value="${produto.plataforma}" required></input>
                </div>
                <div class="form-group">
                    <label>Ano de lançamento</label>
                    <input type="text" class="form-control" id="anolancamento" name="anolancamento" onkeypress='validate(event)' maxlength="4" value="${produto.anoLancamento}" required></input>
                </div>
                <div class="form-group">
                    <label>Categoria</label>
                    <select class="form-control" id="categoria" name="categoria" value="${produto.categoria}" required>
                        <option value="1">Ação</option>
                        <option value="2">Corrida</option>
                        <option value="3">Tiro</option>
                        <option value="4">RPG</option>
                        <option value="5">Estratégia</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Quantidade</label>
                    <input type="text" class="form-control" id="estoque" name="estoque" onkeypress='validate(event)' maxlength="4" value="${produto.estoque}" required></input>
                </div>
                <div class="form-group">
                    <label>Descrição</label>
                    <input class="form-control" id="descricao" name="descricao" maxlength="40" value="${produto.descricao}"></input>
                </div>
                
                <button type="button" class="btn btn-primary" style="background-color: gray;">                    
                    <a href="${pageContext.request.contextPath}/view/index.jsp" style="color:white;">Voltar</a>                       
                </button>
                
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>


        </div>




        <!-- Inicio Footer -->
        <footer class="rodape page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright: [ ACAITECH SISTEMAS OPERACIONAIS LTDA 13.050.544/0001-00 ]
            
            </div>
        </footer>
        <!-- Fim Footer -->


        <link type="text/css" href="${pageContext.request.contextPath}/css/script.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/cadastrarProduto.css" rel="stylesheet" />
        <link type="text/css" href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/gradiente.js"></script>

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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!--  Captura a variavel de retorno e abre modal-->
        <c:if test="${not empty retorno}">
            <script type="text/javascript">
                        $("#myModal").modal();
                        $('#myModal').on('hidden.bs.modal', function () {
                            window.location.href = '${pageContext.request.contextPath}/view/listaProduto.jsp'
                        })
            </script>
        </c:if> 


    </body>
</html>